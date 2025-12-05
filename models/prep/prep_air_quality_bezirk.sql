with extracted_date as (
    select *,
        extract('hour' from timestamp)  as hour,
        extract('month' from timestamp) as month,
        extract('year' from timestamp)  as year
    from {{ ref('stg_air_quality_bezirk') }}
)

select *,
    case 
        when month in (12,1,2) then 'Winter'
        when month in (3,4,5) then 'Spring'
        when month in (6,7,8) then 'Summer'
        when month in (9,10,11) then 'Autumn'
    end as season,

    case 
        when hour between 5 and 10 then 'Morning'
        when hour between 11 and 16 then 'Afternoon'
        when hour between 17 and 21 then 'Evening'
        else 'Night'
    end as day_period

from extracted_date