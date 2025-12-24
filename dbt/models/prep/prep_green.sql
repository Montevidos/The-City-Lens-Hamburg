with unified as (
    -- public gardens
    select
        bezirk,
        stadtteil,
        art,
        green_type,
        area
    from {{ ref('stg_public_gardens')}}
    
    union all
    
    -- allotment gardens
    select
        bezirk,
        stadtteil,
        art,
        green_type,
        area
    from {{ ref('stg_allotment_gardens')}}
    
    union all
    
    -- cemeteries
    select
        bezirk,
        stadtteil,
        art,
        green_type,
        area
    from {{ ref('stg_cemetry')}}
)

select
    bezirk,
    stadtteil,
    art,
    green_type,
    sum(area) as area
from unified
group by bezirk, stadtteil, art, green_type
order by bezirk, stadtteil, art