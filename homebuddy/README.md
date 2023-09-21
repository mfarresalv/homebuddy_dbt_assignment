## Home Buddy assigment

this code transforms the 3 tables given on the exercise into one big table with all the information needed to perform the analisys and data exploration.

In order to do this I have uploaded the 3 tables to google bigquery and worked on those tables. These source tables are the following:
- leads: contains information on the deal, on the contractor that was assigned, the state of the lead, the service the lead is interested and also if an appointment has been set. 
- demographics: Contains demographic information of each lead. One column is the lead_id and the other is a JSON containing all these values.
- form_answers: contains all responses that a user has answered on the funnel of the product. The granularity is lead, question, answer. This means that each lead will appear as many times as questions have answerd and as many times as answered given on a question.

In order of being able to work on data there is the need setting the same granularity for all tables. This code transforms demographics table to explode json columns and changes the granularity of forms_answers into lead.

In order to do that 2 extra tables are created:
- unique_leads: this table was created since the table leads had a lot of duplicated rows, so this table is the same as leads but only unique values
- exploded_demo_data: this table gets some fields on the demographics, and tranform each value into a column
- lead_form_answers_parsed: this table transforms the table form_answers into a lead granularity. givin one column for each existing question. There are 2 questions that accept multiple answers (they have several response per deal) on that case this table also create one field for each option available to answer.

The last table is **all_metrics**. This merges both transformed tables into leads tables, and it is the source of the analisys.


