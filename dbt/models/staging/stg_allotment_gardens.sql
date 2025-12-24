with data_raw as (
    select case
        when stadtteil = 'Billstedt' then 'Hamburg-Mitte'
        else bezirk
    end as bezirk,
    stadtteil, 
    case 
        when gruen_art = 'Grün an Kleingärten' then 'Greenery in allotment gardens'
        when gruen_art = 'Dauerkleingärten' then 'Permanent allotments'
        when gruen_art = 'Kleingärten' then 'Allotment gardens'
    end as art, 
    'Allotment Gardens'as green_type,
    sum(replace(flaeche_ha, ',', '.')::float) as area
    from {{ source('team_aa', 'allotment_gardens') }}
    group by bezirk, stadtteil, art, green_type
)

select bezirk, stadtteil, area, art, green_type
from data_raw

select distinct gruen_art from {{ source('team_aa', 'allotment_gardens') }}


-- with data_raw as (
--     select bezirk, stadtteil, gruen_art as art, 'cemetry' as green_type , flaeche_ha
--     from {{ source('team_aa', 'cemetry') }}
-- ),
-- renamed as (
--     select bezirk, stadtteil,
--         case 
--             when art = 'Friedhöfe' then 'Cemeteries'
--         end as art,
--         'Cemetry' as green_type , 
--         sum(replace(flaeche_ha, ',', '.')::float) as area
--     from data_raw
--     group by bezirk, stadtteil, art, green_type
-- )
-- select * from renamed
