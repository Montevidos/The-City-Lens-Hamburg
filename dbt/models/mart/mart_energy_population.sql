with energy_2024 as (
    select year,  sum(consumed_energy_gwh) as consumed_energy_gwh, 
        sum(generated_energy_gwh) as generated_energy_gwh, 
        sum(total_feed_in_gwh) as total_feed_in_gwh, 
        sum(renewable_feed_in_gwh) as renewable_feed_in_gwh
    from {{ref ('prep_energy')}}
    where year = 2024
    group by year
), 
population_2024_raw as (
    select 2024 as year, sum(area_size) as area_size, 
        sum(population) as population, 
        sum(city_districts) as city_districts
    from {{ref ('prep_population_data')}}
    where bezirk <> 'Stadt Hamburg'
),
population_2024 as (
    select *, 
        (population/area_size) as population_density
    from population_2024_raw
),
final as (
    select * from energy_2024
    join population_2024 using(year)
)
select *, 
(renewable_feed_in_gwh/total_feed_in_gwh) as renwable_share,
(generated_energy_gwh/consumed_energy_gwh) as self_sufficiency,
(consumed_energy_gwh * 1000000 / population) as energy_consumption_per_capita,
(renewable_feed_in_gwh*1000000/population) as renewable_per_capita
from final

