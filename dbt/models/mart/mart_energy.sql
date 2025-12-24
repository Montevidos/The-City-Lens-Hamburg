select *,
    (generated_energy_gwh - consumed_energy_gwh) as energy_balance,
    (renewable_feed_in_gwh / total_feed_in_gwh * 100) as renewable_percentage,
    (generated_energy_gwh/consumed_energy_gwh) as self_sufficiency

from {{ ref('prep_energy')}}