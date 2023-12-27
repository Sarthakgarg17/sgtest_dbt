

{{ config(materialized='table' , alias="load_data") }}



with source_data as(

    select MD5(CONCAT(f_name, l_name)) AS cust_id,* from {{ source("data","RAW_DATA")}} 

)

select * from source_data
limit 5