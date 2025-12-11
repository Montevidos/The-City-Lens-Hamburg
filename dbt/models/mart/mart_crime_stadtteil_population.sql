select c.year, c.bezirk, c.stadtteile, c.absolut, c.aufgeklart,
p.area_size as area_size_bezirk, p.population, p.population_density
from {{ref ('prep_crime_stadtteil')}} c 
join {{ref ('prep_population_data')}} p using (bezirk)

