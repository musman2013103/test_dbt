{{
    config(
        materialized='table'
    )
}}

SELECT
    *
FROM {{ source('bq_ddm', 'LifeTimeOrgStats_LI_dp') }} 