with green as (
    select bezirk, stadtteil, art, green_type, sum(area) as area
    from {{ref ('prep_green')}} 
    group by bezirk, stadtteil, art, green_type
)
select g.bezirk, g.stadtteil, g.art, g.green_type, g.area, p.area_size, p.population, p.population_density, p.city_districts 
from green g
join {{ref('prep_population_data')}} p using (bezirk)
