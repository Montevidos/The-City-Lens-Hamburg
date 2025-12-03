with src as (
  select
    "Bezirke"                            as bezirk_raw,
    "absolut 2023"                       as absolut_2023,
    "aufgeklärt 2023"                    as aufgeklart_2023,
    "Prozent (%) 2023"                   as percent_2023,
    "absolut 2024"                       as absolut_2024,
    "aufgeklärt 2024"                    as aufgeklart_2024,
    "Prozent (%) 2024"                   as percent_2024
  from {{ ref('stg_crime_data') }}
),

clean as (
  select
    trim(replace(bezirk_raw, 'Bezirk ', '')) as bezirk,
    nullif(replace(trim(absolut_2023),  ',', '.'), '') as absolut_2023_txt,
    nullif(replace(trim(aufgeklart_2023), ',', '.'), '') as aufgeklart_2023_txt,
    nullif(replace(trim(percent_2023),    ',', '.'), '') as percent_2023_txt,
    nullif(replace(trim(absolut_2024),  ',', '.'), '') as absolut_2024_txt,
    nullif(replace(trim(aufgeklart_2024), ',', '.'), '') as aufgeklart_2024_txt,
    nullif(replace(trim(percent_2024),    ',', '.'), '') as percent_2024_txt
  from src
  where bezirk_raw is not null
    and bezirk_raw not in ('Bezirke insgesamt','Hamburg unbekannt','Tatort unbekannt','Hamburg insgesamt')
),

crime_2023 as (
  select
    bezirk,
    cast(absolut_2023_txt as double precision)    as absolut,
    cast(aufgeklart_2023_txt as double precision) as aufgeklart,
    cast(percent_2023_txt as double precision)    as percent,
    2023 as year
  from clean
),

crime_2024 as (
  select
    bezirk,
    cast(absolut_2024_txt as double precision)    as absolut,
    cast(aufgeklart_2024_txt as double precision) as aufgeklart,
    cast(percent_2024_txt as double precision)    as percent,
    2024 as year
  from clean
)

select * from crime_2023
union all
select * from crime_2024
order by bezirk, year
