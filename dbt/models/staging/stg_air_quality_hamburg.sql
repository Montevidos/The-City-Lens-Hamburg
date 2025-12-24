select cast(timestamp as timestamp) as timestamp,
    pm10::float,
    pm2_5::float,
    no2::float,
    o3::float,
    co::float,
    so2::float
from {{ source('team_aa', 'air_quality_hamburg') }}