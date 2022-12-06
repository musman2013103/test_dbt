{{
    config(
        materialized='table'
    )
}}

SELECT
    *
FROM {{ source('bq_ddm', 'ShareStats_LI_dp') }} 