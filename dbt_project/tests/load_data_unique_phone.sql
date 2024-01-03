
select col from(
    select phone,count(phone) as col
    from {{ref("load_data")}}
    group by phone
)
where col>1