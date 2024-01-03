
{{ config(materialized='table', unique_key="CUST_ID" ) }}



with basic_data as (

    select * from {{ source("data","RAW_DATA")}} 
),

transformed_data as (

    select cust_id ,SRN,F_NAME,L_NAME,PURCHASED_PRODUCT,ADDRESS,CAST(
    CASE
      WHEN srn = 4 THEN '444-1234'
      WHEN srn = 5 THEN '666-1234'
      ELSE phone
    END AS STRING
  ) AS phone,CITY,COUNTRY
from {{ ref('load_data') }}
)


select * from transformed_data
union all
select MD5(CONCAT(f_name, l_name)) AS cust_id,* from basic_data
where srn in (6,7,8)
