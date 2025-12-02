with consumed as (
    select
        cast(year as integer) as year,
        cast(replace("consumed_energie_GWh", ',', '.') as float) as consumed_energie_gwh
    from {{ ref('stg_consumed_energie') }}
),

generated as (
    select
        cast(year as integer) as year,
        cast(replace("generated_energie_GWh", ',', '.') as float) as generated_energie_gwh
    from {{ ref('stg_generated_energie') }}
),

total_feed as (
    select
        cast(year as integer) as year,
        cast(replace("total_feed_in_GWh", ',', '.') as float) as total_feed_in_gwh
    from {{ ref('stg_total_feed_in') }}
),

renewable_feed as (
    select
        cast(year as integer) as year,
        cast(replace("renewable_feed_in_GWh", ',', '.') as float) as renewable_feed_in_gwh
    from {{ ref('stg_renewable_feed_in') }}
)

select
    c.year,
    c.consumed_energie_gwh,
    g.generated_energie_gwh,
    t.total_feed_in_gwh,
    r.renewable_feed_in_gwh
from consumed c
left join generated g on c.year = g.year
left join total_feed t on c.year = t.year
left join renewable_feed r on c.year = r.year
order by c.year