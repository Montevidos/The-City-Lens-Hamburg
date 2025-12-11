
with data_raw as (
    select bezirk, stadtteil, gruen_art as art, 'cemetry' as green_type , flaeche_ha
    from {{ source('team_aa', 'cemetry') }}
),
renamed as (
    select bezirk, stadtteil,
        case 
            when art = 'Friedhöfe' then 'Cemeteries'
        end as art,
        'Cemetry' as green_type , 
        sum(replace(flaeche_ha, ',', '.')::float) as area
    from data_raw
    group by bezirk, stadtteil, art, green_type
)
select * from renamed
