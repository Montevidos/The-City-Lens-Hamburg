{{ config(materialized='table') }}
select *
from {{ source('team_aa', 'air_quality_hamburg') }}