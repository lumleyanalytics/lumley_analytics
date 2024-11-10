
    
    

with dbt_test__target as (

  select service_request_key as unique_field
  from `lumley-analytics`.`dbt_dev`.`base_src_chattadata_311_service_requests`
  where service_request_key is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


