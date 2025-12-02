select *
from {{ source('team_aa', 'total_feed_in') }}