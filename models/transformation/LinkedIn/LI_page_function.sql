
{{
    config(
        materialized='table'
    )
}}

with raw_li_page as (

    SELECT 
        * 
    
    FROM 
        {{ ref('LI_page_followers_function')}}

),

trans_li_page as (

SELECT 
    functionname AS function_name ,organicfollowercount + paidfollowercount AS follower_count

FROM
    raw_li_page

Where 
    dataddo_extraction_timestamp BETWEEN DATE_ADD(CURRENT_TIMESTAMP,INTERVAL -6 DAY) AND CURRENT_TIMESTAMP

Order By 
    organicfollowercount DESC

)

SELECT *
FROM trans_li_page
LIMIT 5

