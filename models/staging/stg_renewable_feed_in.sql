select *
from {{ source('team_aa', 'renewable_feed_in') }}