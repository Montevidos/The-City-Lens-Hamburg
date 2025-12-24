
with raw_renamed as(
    select bezirk,
        absolut as total_crime,
        aufgeklart as solved_criminal_cases,
        percent,
        year,
        area_size,
        population,
        population_density,
        city_districts
    from {{ref('prep_crime_new')}}
    join {{ref('prep_population_data')}}
    using (bezirk)
    )
select *,
    (total_crime::float / population::float * 1000) as crime_per_1000_people,
    (total_crime::float / area_size) as crime_density,
    (solved_criminal_cases::float / total_crime * 100) as solved_rate
from raw_renamed