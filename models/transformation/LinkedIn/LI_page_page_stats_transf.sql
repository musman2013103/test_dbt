
{{
    config(
        materialized='table'
    )
}}

with raw_li_page_page_stats as (

    SELECT 
        * 
    
    FROM 
        {{ ref('LI_page_timebound_stats')}}

),

trans_li_page_page_stats AS (

SELECT 
    clickcount, commentcount,engagement, dataddo_extraction_timestamp, impressioncount, likecount, sharecount, uniqueimpressionscounts, DATE(dataddo_extraction_timestamp) as time



FROM
    raw_li_page_page_stats


)

SELECT *
FROM trans_li_page_page_stats

