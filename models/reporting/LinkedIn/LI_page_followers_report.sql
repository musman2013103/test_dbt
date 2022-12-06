
{{
    config(
        materialized='table'
    )
}}

with report_li_page_followers as (

    SELECT 
        * , DATE(dataddo_extraction_timestamp) as time
        
    
    FROM 
        {{ ref('LI_page_follower_count')}}

    

)

SELECT *
FROM report_li_page_followers