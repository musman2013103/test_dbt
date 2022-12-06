{{
    config(
        materialized='table'
    )
}}

SELECT
    *
FROM {{ source('bq_ddm', 'TimeBoundStats_LI_dp') }} 