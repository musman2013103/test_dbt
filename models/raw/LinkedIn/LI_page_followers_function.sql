
{{
    config(
        materialized='table'
    )
}}

SELECT
    *
FROM {{ source('bq_ddm', 'FollowersFunction_LI_dp') }} 