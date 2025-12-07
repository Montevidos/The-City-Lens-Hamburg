with raw_garden as (
    select bezirk, 
    sum(cemetry_area) as cemetry_area, 
    sum(allotment_area) as allotment_area, 
    sum(public_garden_area) as public_garden_area
    from {{ref ('prep_green')}}
    group by bezirk
)
,base as (
    select *, 
        (cemetry_area + allotment_area + public_garden_area) as total_green_ha
    from raw_garden
    join {{ref('prep_population_data')}}
    using (bezirk)
)
select *,

    -- 2. Total green area in km2
    total_green_ha * 0.01
        as total_green_km2,

    -- 3. Percent of district covered by green areas
    (total_green_ha * 0.01 / area_size) * 100
        as green_area_percent,

    -- 4. m2 of green area per capita
    (total_green_ha * 0.01 * 1000000 / population)
        as green_area_m2_per_capita,

    -- 5. Green area per km2 (density)
    (total_green_ha * 0.01) / area_size
        as green_density

from base
order by bezirk