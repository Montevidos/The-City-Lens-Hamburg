select *
from {{ source('team_aa', 'population_data') }}