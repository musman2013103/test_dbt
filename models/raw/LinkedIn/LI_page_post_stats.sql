{{
    config(
        materialized='table'
    )
}}

SELECT
    *
FROM {{ source('bq_ddm', 'post_stats_LI_dp') }} 