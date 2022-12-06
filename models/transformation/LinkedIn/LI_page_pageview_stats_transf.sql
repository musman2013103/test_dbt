
{{
    config(
        materialized='table'
    )
}}

with raw_li_page_pageview_stats as (

    SELECT 
        * 
    
    FROM 
        {{ ref('LI_page_lifetime_stats')}}

),

trans_li_page_pageview_stats AS (

SELECT 
    alldesktoppageviews AS desktop_page_views ,allmobilepageviews AS mobile_page_views, allpageviews AS total_page_views

FROM
    raw_li_page_pageview_stats

Where 
    dataddo_extraction_timestamp BETWEEN DATE_ADD(CURRENT_TIMESTAMP,INTERVAL -6 DAY) AND CURRENT_TIMESTAMP

)

SELECT *
FROM trans_li_page_pageview_stats

