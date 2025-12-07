select *, 
    (cemetry_area + allotment_area + public_garden_area) as green_area
from {{ref ('prep_green')}}