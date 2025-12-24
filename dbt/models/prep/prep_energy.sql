with consumed as (
    select
        cast(year as integer) as year,
        month,
        monthly_consumed_energie_gwh as consumed_energie_gwh
    from {{ ref('stg_consumed_energie') }}
),

generated as (
    select
        cast(year as integer) as year,
        month,
        monthly_generated_energie_gwh as generated_energie_gwh
    from {{ ref('stg_generated_energie') }}
),

total_feed as (
    select
        cast(year as integer) as year,
        month,
        monthly_total_feed_in_gwh as total_feed_in_gwh
    from {{ ref('stg_total_feed_in') }}
),

renewable_feed as (
    select
        cast(year as integer) as year,
        month,
        monthly_renewable_feed_in_gwh as renewable_feed_in_gwh
    from {{ ref('stg_renewable_feed_in') }}
)

select
    c.year,
    c.month,
    c.consumed_energie_gwh as consumed_energy_gwh,
    g.generated_energie_gwh as generated_energy_gwh,
    t.total_feed_in_gwh,
    r.renewable_feed_in_gwh
from consumed c
left join generated g on c.year = g.year and c.month = g.month
left join total_feed t on c.year = t.year and c.month = t.month
left join renewable_feed r on c.year = r.year and c.month = r.month
order by c.year