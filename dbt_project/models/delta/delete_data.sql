{{ config(materialized='table') }}


with data as(
select * from {{ref('alter_data')}}
where SRN!=2
)
select * from data 
