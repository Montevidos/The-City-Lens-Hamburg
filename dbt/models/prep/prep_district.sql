select * 
from {{ref ('stg_district')}}
where bezirk_name is not null