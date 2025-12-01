select *
from {{ source('team_aa', 'air_quality_bezirk_2023_2025') }}