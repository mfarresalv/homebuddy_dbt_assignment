
{{ config(materialized='table') }}


WITH
-- First I get and pivot the answers for all those questions that do not have more than 2 answers (all but whyChangeShower and whyInterested)
  base_query AS (
  SELECT
    *
  FROM
    {{source('homeBuddy','form_answers')}} fa

  WHERE
    QUESTION_KEY NOT IN ('whyChangeShower',
      'whyInterested') ),
  base_query_pivoted AS (
  SELECT
    *
  FROM
    base_query PIVOT(MAX(ANSWER_CODE) FOR QUESTION_KEY IN ('internalOwner',
        'internalMobileHome',
        'internalExistingTub',
        'internalInsuranceCoverage',
        'senior',
        'military',
        'showerLayout',
        'projectDetails',
        'wisPropertyType',
        'wisCurrentStatus',
        'zipCode',
        'thankYou')) ),
--  To consider all the possible answers on the questions I pivot over all posible answers and creat a column for each answer (on whyChangeShower there are 5 possible answers and on whyinterested 4)
  changed_shower_answers AS (
  SELECT
    *,
    TRUE AS answer
  FROM
    {{source('homeBuddy','form_answers')}}
  WHERE
    QUESTION_KEY IN ('whyChangeShower')),
  pivoted_whychanged_table AS (
  SELECT
    *
  FROM
    changed_shower_answers PIVOT(MAX(answer) FOR ANSWER_CODE IN ('1',
        '2',
        '3',
        '4',
        '5'))),
  why_changed_final AS (
  SELECT
    pw.lead_id,
    pw.1 AS why_change_shower_1,
    pw.2 AS why_change_shower_2,
    pw.3 AS why_change_shower_3,
    pw.4 AS why_change_shower_4,
    pw.5 AS why_change_shower_5
  FROM
    pivoted_whychanged_table pw),

-- Here I start with the whyinterested answers
  Interested_answers AS (
  SELECT
    *,
    TRUE AS answer
  FROM
    {{source('homeBuddy','form_answers')}}
  WHERE
    QUESTION_KEY IN ('whyInterested')),
  pivoted_whyinterested_table AS (
  SELECT
    *
  FROM
    Interested_answers PIVOT(MAX(answer) FOR ANSWER_CODE IN ('1',
        '2',
        '3',
        '4'))),
  why_interested_final AS (
  SELECT
    wi.lead_id,
    wi.1 AS why_interested_1,
    wi.2 AS why_interested_2,
    wi.3 AS why_interested_3,
    wi.4 AS why_interested_4
  FROM
    pivoted_whyinterested_table wi)
-- In here the tables of sigle answers are mixed with the ones of mutiple answers
SELECT
  *,
  IFNULL(COALESCE(why_change_shower_1,why_change_shower_2,why_change_shower_3,why_change_shower_4,why_change_shower_5),FALSE) as answered_why_changed_shower,
  IFNULL(COALESCE(why_interested_1,why_interested_2,why_interested_3,why_interested_4),FALSE) as answered_interested
FROM
  base_query_pivoted
LEFT JOIN
  why_changed_final
USING
  (lead_id)
LEFT JOIN
  why_interested_final
USING
  (lead_id)









