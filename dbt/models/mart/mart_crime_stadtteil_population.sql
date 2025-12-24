with raw_table as (
    select c.year, c.bezirk, c.stadtteile, c.absolut, c.aufgeklart,
        p.area_size as area_size_bezirk, p.population, p.population_density
    from {{ref ('prep_crime_stadtteil')}} c 
    join {{ref ('prep_population_data')}} p using (bezirk)
),
absolut_changed as (
    select year, bezirk, stadtteile,
    case 
        when (stadtteile = 'Othmarschen' and year = 2023) then 1030
        when (stadtteile = 'Barmbek-Nord' and year = 2023) then 1630
        when (stadtteile = 'Fuhlsbüttel' and year = 2023) then 4020
        when (stadtteile = 'Eilbek' and year = 2023) then 1690
        when (stadtteile = 'Jenfeld' and year = 2023) then 2260
        when (stadtteile = 'Farmsen-Berne' and year = 2023) then 1070
        when (stadtteile = 'Bramfeld' and year = 2023) then 1340
        when (stadtteile = 'Steilshoop' and year = 2023) then 1510
        when (stadtteile = 'Neustadt' and year = 2023) then 4960
        when (stadtteile = 'Wilhelmsburg' and year = 2023) then 5280
        when (stadtteile = 'Osdorf' and year = 2023) then 2030
        when (stadtteile = 'Lokstedt' and year = 2023) then 1710
        when (stadtteile = 'Eidelstedt' and year = 2023) then 2650
        when (stadtteile = 'Billstedt' and year = 2024) then 6420
        else absolut
    end as absolut,
    aufgeklart,
    area_size_bezirk, population, population_density
from raw_table
),
aufgeklart_changed as (
    select year, bezirk, stadtteile, absolut,
    case 
        when (stadtteile = 'Wandsbek' and year = 2023) then 2000
        when (stadtteile = 'Rahlstedt' and year = 2023) then 3160
        when (stadtteile = 'Neustadt' and year = 2023) then 2300
        when (stadtteile = 'Wandsbek' and year = 2023) then 2000
        when (stadtteile = 'Neustadt' and year = 2024) then 2040
        else aufgeklart
    end as aufgeklart,
    area_size_bezirk, population, population_density
from absolut_changed
)
select * from aufgeklart_changed