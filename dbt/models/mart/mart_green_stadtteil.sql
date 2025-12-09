select bezirk, stadtteil, cemetry_area, allotment_area, public_garden_area, area_size as area_size_bezirk, 
    population as population_bezirk, population_density as population_density_per_bezirk, city_districts as city_districts_per_bezirk,
    (cemetry_area + allotment_area + public_garden_area) as green_area
from {{ref ('prep_green')}} g
join {{ref('prep_population_data')}} p using (bezirk)