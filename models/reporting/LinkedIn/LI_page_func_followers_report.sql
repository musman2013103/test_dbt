
{{
    config(
        materialized='table'
    )
}}

with report_li_page as (

    SELECT 
        * 
    
    FROM 
        {{ ref('LI_page_function')}}

    ORDER BY 
        follower_count DESC

    LIMIT 5

)


SELECT *
FROM report_li_page