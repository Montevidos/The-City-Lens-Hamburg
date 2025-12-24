select cast(year as integer) as year,
    case 
        when month = 'Dezember' then 'December'
        when month = 'Januar' then 'January'
        when month = 'Februar' then 'February'
        when month = 'März' then 'March'
        when month = 'Juni' then 'June'
        when month = 'Juli' then 'July'
        when month = 'Oktober' then 'October'
        else month
    end as month,
    cast(replace("monthly_total_feed_in_GWh", ',', '.') as float) as monthly_total_feed_in_gwh
from {{ source('team_aa', 'monthly_total_feed_in_GWh') }}