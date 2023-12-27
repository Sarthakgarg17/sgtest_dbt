
{{ config(materialized='table' ) }}


with transformed_data as (

    select cust_id ,SRN,F_NAME,L_NAME,PURCHASED_PRODUCT,ADDRESS,CAST(
    CASE
      WHEN srn = 4 THEN '444-1234'
      WHEN srn = 5 THEN '666-1234'
      ELSE phone
    END AS STRING
  ) AS phone,CITY,COUNTRY
from {{ ref('load_data') }}
union all
select MD5(CONCAT(f_name, l_name)) AS cust_id,* from DBT_DB.RAW.RAW_DATA
where srn in (6,7,8)


)

select * from transformed_data