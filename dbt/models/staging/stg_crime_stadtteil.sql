select "Bezirk" as bezirk, "Stadtteile" as stadtteile, 
    replace(regexp_replace("absolut 2023"::text, '\.0$', ''), '.', '')::int as absolut_2023,
    replace(regexp_replace("aufgeklärt 2023"::text, '\.0$', ''), '.', '')::int as aufgeklärt_2023,
    replace(regexp_replace("absolut 2024"::text, '\.0$', ''), '.', '')::int as absolut_2024,
    replace(regexp_replace("aufgeklärt 2024"::text, '\.0$', ''), '.', '')::int as aufgeklärt_2024

from {{source('team_aa', 'crime_data_stadtteil')}}