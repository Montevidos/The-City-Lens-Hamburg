
with public_gardens as (
    select
        bezirk, 
        stadtteil,
        sum(public_garden_area) as public_garden_area
    from {{ ref('stg_public_gardens') }}
    group by bezirk, stadtteil
),

allotment as (
    select
        bezirk,
        stadtteil,
        sum(allotment_area) as allotment_area
    from {{ ref('stg_allotment_gardens') }}
    group by bezirk, stadtteil
),
cemetry as (
    select
        bezirk,
        stadtteil, 
        sum(cemetry_area) as cemetry_area
    from {{ ref('stg_cemetry') }}
    group by bezirk, stadtteil
)

select
    coalesce(p.bezirk, a.bezirk, c.bezirk) as bezirk,
    coalesce(p.stadtteil, a.stadtteil, c.stadtteil) as stadtteil,
    c.cemetry_area,
    a.allotment_area,
    p.public_garden_area
from public_gardens p
full join allotment a using (bezirk, stadtteil)
full join cemetry c using (bezirk, stadtteil)
order by p.stadtteil