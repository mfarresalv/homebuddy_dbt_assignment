
{{ config(materialized='table') }}


SELECT 
LEAD_ID,
QUESTION_KEY,
fa.ANSWER_CODE,
COALESCE(answer_code_parsed,fa.ANSWER_CODE) as uncoded_answer
 FROM {{source('homeBuddy','form_answers')}} fa
LEFT JOIN
(select 
*
 from {{ref('answer_codes')}} )  ac on fa.QUESTION_KEY=ac.question and fa.ANSWER_CODE=CAST(ac.answer_code as string)