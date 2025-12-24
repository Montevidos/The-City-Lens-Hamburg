select *
from {{ source('team_aa', 'crime_data') }}