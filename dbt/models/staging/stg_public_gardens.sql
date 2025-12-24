with data_raw as (
    select bezirk, stadtteil, gruen_art as art, 'Public garden' as green_type , flaeche_ha
    from {{ source('team_aa', 'public_gardens') }}
),
renamed_stadtteil as (
select art, green_type,
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
), 
renamed_art as (
select bezirk, stadtteil, 
case 
    when art = 'Sportplätze' then 'Sports fields'
    when art = 'Parkanlagen' then 'Parks'
    when art = 'Grün an Kleingärten' then 'Greenery in allotment gardens'
    when art = 'Wanderwege' then 'Hiking trails'
    when art = 'Anderweitige Flächen' then 'Other areas'
    when art = 'Schutzgrün' then 'Protective green area'
    when art = 'Allgemeines Grün' then 'General green area'
    when art = 'Spielplätze' then 'Playgrounds'
end as art, green_type, sum(flaeche_ha) as area
from renamed_stadtteil
group by bezirk, stadtteil, art, green_type
)
select * from renamed_art