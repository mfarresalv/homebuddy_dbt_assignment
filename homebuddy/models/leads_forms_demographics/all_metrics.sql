{{ config(materialized='table') }}

SELECT 
*
FROM {{ref('unique_leads')}}  
LEFT JOIN {{ ref('lead_form_answers_parsed') }} l using(lead_id)
LEFT JOIN  {{ ref('exploded_demo_data') }} using(lead_id)