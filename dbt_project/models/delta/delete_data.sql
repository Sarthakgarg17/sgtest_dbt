{{ config(materialized='table') }}


with data_final as(
select * from {{ref('alter_data')}}
)

select * from data_final
where SRN!=2
