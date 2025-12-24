with population as (
    select
        case 
            when "Bezirk" = 'Stadt Hamburg' then "Bezirk"
            else left("Bezirk", length("Bezirk")-3)
        end as bezirk,

        cast(replace("Fläche(km²)", ',', '.') as numeric) as area_size,
        cast(replace("Einwohner", '.', '') as integer) as population,
        cast(replace("Bevölkerungsdichte(Einwohner/km²)", ',', '.') as numeric) as population_density,
        cast("Stadtteile" as integer) as city_districts

    from {{ ref('stg_population_data') }}
)
select * from population