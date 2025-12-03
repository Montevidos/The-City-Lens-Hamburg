with cemetry as (
    select
        bezirk,
        sum(cast(replace(flaeche_ha, ',', '.') as float)) as cemetry_area
    from {{ ref('stg_cemetry') }}
    group by bezirk
),

allotment as (
    select
        bezirk,
        sum(cast(replace(flaeche_ha, ',', '.') as float)) as allotment_area
    from {{ ref('stg_allotment_gardens') }}
    group by bezirk
),

public_gardens as (
    select
        bezirk,
        sum(cast(replace(flaeche_ha, ',', '.') as float)) as public_garden_area
    from {{ ref('stg_public_gardens') }}
    group by bezirk
)

select
    c.bezirk,
    c.cemetry_area,
    a.allotment_area,
    p.public_garden_area
from cemetry c
left join allotment a using (bezirk)
left join public_gardens p using (bezirk)
order by c.bezirk