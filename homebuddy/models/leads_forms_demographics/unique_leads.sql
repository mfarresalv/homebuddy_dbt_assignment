
{{ config(materialized='table') }}

select 
  distinct *
from {{source('homeBuddy','leads')}} 