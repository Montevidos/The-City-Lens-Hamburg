with data_raw as (
    select case
        when stadtteil = 'Billstedt' then 'Hamburg-Mitte'
        else bezirk
    end as bezirk,
    stadtteil,
    sum(replace(flaeche_ha, ',', '.')::float) as allotment_area
    from {{ source('team_aa', 'allotment_gardens') }}
    group by bezirk, stadtteil
)

select bezirk, stadtteil, allotment_area
from data_raw
