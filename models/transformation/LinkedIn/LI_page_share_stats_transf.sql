
{{
    config(
        materialized='table'
    )
}}

with raw_li_page_share_stats as (

    SELECT 
        * , (clickcount / impressioncount) AS click_through_rate
    
    FROM 
        {{ ref('LI_page_share_stats')}}

),

trans_li_page_share_stats as (

SELECT 
    AVG(clickcount) AS click, AVG(commentcount) AS commentcount, AVG(engagement) AS engagement, 
    AVG(impressioncount) AS impressioncount, AVG(likecount) AS likecount, AVG(sharecount) AS sharecount, 
    AVG(uniqueimpressionscount) AS uniqueimpressionscount,text ,AVG(click_through_rate) AS click_through_rate

FROM
    raw_li_page_share_stats

Where 
    dataddo_extraction_timestamp BETWEEN DATE_ADD(CURRENT_TIMESTAMP,INTERVAL -6 DAY) AND CURRENT_TIMESTAMP

GROUP BY text
)

SELECT *
FROM trans_li_page_share_stats