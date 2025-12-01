select *
from {{ source('team_aa', 'public_gardens') }}