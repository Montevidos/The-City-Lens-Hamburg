select *
from {{ source('team_aa', 'consumed_energie_GWh') }}
