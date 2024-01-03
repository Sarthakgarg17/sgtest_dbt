

{{ config(materialized='table' , alias="load_data", unique_key="CUST_ID") }}


with source_data as(

    select {{ dbt_utils.generate_surrogate_key(['f_name', 'l_name']) }} AS cust_id,* from {{ source("data","RAW_DATA")}} 

)

select * from source_data
limit 5