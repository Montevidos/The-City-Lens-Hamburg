select *
from {{ source('team_aa', 'generated_energie') }}
