

{{ config(materialized='table', unique_key="CUST_ID") }}


select * from {{ref("delete_data")}}
