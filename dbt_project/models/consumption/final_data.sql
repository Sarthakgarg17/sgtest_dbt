

{{ config(materialized='table') }}


select * from {{ref("delete_data")}}
