
{{ config(materialized='table' , alias="load_data") }}



with source_data as(

    select MD5(CONCAT(f_name, l_name)) AS cust_id,* from DBT_DB.RAW.RAW_DATA
limit 5

)

select * from source_data