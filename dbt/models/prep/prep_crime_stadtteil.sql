with crime_2023 as (
    select 2023 as year, bezirk, stadtteile,
        absolut_2023 as absolut,
        aufgeklärt_2023 as aufgeklart
    from {{ref ('stg_crime_stadtteil')}}
),
crime_2024 as (
    select 2024 as year, bezirk, stadtteile,
        absolut_2024 as absolut,
        aufgeklärt_2024 as aufgeklart
from {{ref ('stg_crime_stadtteil')}}
),
full_data as (
    select * from crime_2023
    union all 
    select * from crime_2024
)
select year, 
    case 
        when bezirk = 'Mitte' then 'Hamburg-Mitte'
        when bezirk = 'Nord' then 'Hamburg-Nord'
        else bezirk
    end as bezirk,
    stadtteile, absolut, aufgeklart
from full_data
