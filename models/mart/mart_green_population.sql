select * 
from {{ ref('prep_green')}}
join {{ ref('prep_population_data')}}
using (bezirk)