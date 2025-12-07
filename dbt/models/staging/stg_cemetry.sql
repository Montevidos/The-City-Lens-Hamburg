
with data_raw as (
    select *
    from {{ source('team_aa', 'cemetry') }}
)

select bezirk,
    stadtteil,
    sum(replace(flaeche_ha, ',', '.')::float) as cemetry_area
from data_raw
group by bezirk, stadtteil