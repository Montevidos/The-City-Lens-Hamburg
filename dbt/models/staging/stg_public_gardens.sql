with data_raw as (
    select bezirk, stadtteil, flaeche_ha
    from {{ source('team_aa', 'public_gardens') }}
),
renamed as (
select     
    case
        when stadtteil = 'Billstedt' then 'Hamburg-Mitte'
        else bezirk
    end as bezirk,
    case 
        when stadtteil like '%Pauli' then 'St. Pauli'
        when stadtteil like '%Georg' then 'St. Georg'
        when stadtteil like '%penbüttel' then 'Poppenbüttel'
        when stadtteil like 'Rahlste%' then 'Rahlstedt'
        else stadtteil
    end as stadtteil,
    replace(flaeche_ha, ',', '.')::float as flaeche_ha
from data_raw
)
select bezirk, stadtteil, sum(flaeche_ha) as public_garden_area
from renamed
group by bezirk, stadtteil
