{{ config(materialized='table') }}


WITH exploded_json as (SELECT 
lead_id,
JSON_EXTRACT_SCALAR(demographics_data, "$.AGE") as age,
JSON_EXTRACT_SCALAR(demographics_data, "$.CHILD") as child,
JSON_EXTRACT_SCALAR(demographics_data, "$.CHILDAGECD_11_15") as childagecd_11_15,
JSON_EXTRACT_SCALAR(demographics_data, "$.CHILDAGECD_16_17") as childagecd_16_17,
JSON_EXTRACT_SCALAR(demographics_data, "$.CHILDAGECD_6") as CHILDAGECD_6,
JSON_EXTRACT_SCALAR(demographics_data, "$.CHILDAGECD_6_10") as CHILDAGECD_6_10,
JSON_EXTRACT_SCALAR(demographics_data, "$.CHILDNBRCD") as childnbrcd,
JSON_EXTRACT_SCALAR(demographics_data, "$.DOB") as dob,
JSON_EXTRACT_SCALAR(demographics_data, "$.EHI") as ehi,
JSON_EXTRACT_SCALAR(demographics_data, "$.ETHNICITYCD") as ethnicitycd,
JSON_EXTRACT_SCALAR(demographics_data, "$.GENDER") as gender,
JSON_EXTRACT_SCALAR(demographics_data, "$.HOMEOWNERCD") as homeownercd,
JSON_EXTRACT_SCALAR(demographics_data, "$.LANGUAGECD") as languagecd,
JSON_EXTRACT_SCALAR(demographics_data, "$.MARRIEDCD") as marriedcd,
JSON_EXTRACT_SCALAR(demographics_data, "$.WEALTHSCR") as wealthscr

 FROM {{source('homeBuddy','demographics')}})

SELECT 
        LEAD_ID,
        IF(age="null",NULL,regexp_replace(age,'\"',"")) as age,
        IF(child="null",NULL,regexp_replace(child,'\"',"")) as child,
        IF(childagecd_11_15="null",NULL,regexp_replace(childagecd_11_15,'\"',"")) as childagecd_11_15,
        IF(childagecd_16_17="null",NULL,regexp_replace(childagecd_16_17,'\"',"")) as childagecd_16_17,
        IF(CHILDAGECD_6="null",NULL,regexp_replace(CHILDAGECD_6,'\"',"")) as CHILDAGECD_6,
        IF(CHILDAGECD_6_10="null",NULL,regexp_replace(CHILDAGECD_6_10,'\"',"")) as CHILDAGECD_6_10,
        IF(childnbrcd="null",NULL,regexp_replace(childnbrcd,'\"',"")) as childnbrcd,
        IF(dob="null",NULL,regexp_replace(dob,'\"',"")) as dob,
        IF(ehi="null",NULL,regexp_replace(ehi,'\"',"")) as ehi,
        IF(ethnicitycd="null",NULL,regexp_replace(ethnicitycd,'\"',"")) as ethnicitycd,
        IF(gender="null",NULL,regexp_replace(gender,'\"',"")) as gender,
        IF(homeownercd="null",NULL,regexp_replace(homeownercd,'\"',"")) as homeownercd,
        IF(languagecd="null",NULL,regexp_replace(languagecd,'\"',"")) as languagecd,
        IF(marriedcd="null",NULL,regexp_replace(marriedcd,'\"',"")) as marriedcd,
        IF(wealthscr="null",NULL,regexp_replace(wealthscr,'\"',"")) as wealthscr
FROM exploded_json
