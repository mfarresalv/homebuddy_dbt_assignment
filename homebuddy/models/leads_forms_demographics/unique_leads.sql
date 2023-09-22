
{{ config(materialized='table') }}

select 
distinct 
LEAD_ID,			
CONTRACTOR_ID,		
LEAD_CREATED_AT,		
LEAD_STATUS,				
SERVICE_ALIAS,				
IS_APPOINTMENT_SET

FROM {{source('homeBuddy','leads')}} 