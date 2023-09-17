{{ config(materialized='table') }}

SELECT 
*
FROM {{ ref('lead_form_answers_parsed') }}
LEFT JOIN {{source('homeBuddy','leads')}}  l using(lead_id)
LEFT JOIN  {{ ref('exploded_demo_data') }} using(lead_id)