/* 
In here I made assumptions on the codes of the answer codes, These are the one that I could identify on the product funnel,
The atribution method was the first to appear (left to right up to down) on the product gets the num 1 and counting.

For yes/no quetions, I assumed that 1 is yes and 0 is no.

 */

{{ config(materialized='table') }}

SELECT 'whyChangeShower' as question, 1 as answer_code, 'ease of use' as answer_code_parsed UNION ALL 
SELECT 'whyChangeShower' as question, 2 as answer_code, 'safer bathing' as answer_code_parsed UNION ALL 
SELECT 'whyChangeShower' as question, 3 as answer_code, 'update style' as answer_code_parsed UNION ALL 
SELECT 'whyChangeShower' as question, 4 as answer_code, 'shower not working properly' as answer_code_parsed UNION ALL 
SELECT 'whyChangeShower' as question, 5 as answer_code, 'other reasons' as answer_code_parsed UNION ALL 
SELECT 'showerLayout' as question, 1 as answer_code, 'Against 1 wall' as answer_code_parsed UNION ALL 
SELECT 'showerLayout' as question, 2 as answer_code, 'Against 2 walls' as answer_code_parsed UNION ALL 
SELECT 'showerLayout' as question, 3 as answer_code, 'Not Sure' as answer_code_parsed UNION ALL 
SELECT 'internalExistingTub' as question, 0 as answer_code, 'Not existing tub' as answer_code_parsed UNION ALL 
SELECT 'internalExistingTub' as question, 1 as answer_code, 'Existing tub' as answer_code_parsed UNION ALL 
SELECT 'wisPropertyType' as question, 1 as answer_code, 'House' as answer_code_parsed UNION ALL 
SELECT 'wisPropertyType' as question, 2 as answer_code, 'Mobile/Modular/manufactured' as answer_code_parsed UNION ALL 
SELECT 'wisPropertyType' as question, 3 as answer_code, 'Condo/Apartment' as answer_code_parsed UNION ALL 
SELECT 'wisPropertyType' as question, 4 as answer_code, 'Office/CommercialOther' as answer_code_parsed UNION ALL 
SELECT 'internalInsuranceCoverage' as question, 0 as answer_code, 'Not covered insurance' as answer_code_parsed UNION ALL 
SELECT 'internalInsuranceCoverage' as question, 1 as answer_code, 'Covered by insurance' as answer_code_parsed UNION ALL 
SELECT 'internalOwner' as question, 0 as answer_code, 'User not owner' as answer_code_parsed UNION ALL 
SELECT 'internalOwner' as question, 1 as answer_code, 'User is owner' as answer_code_parsed 