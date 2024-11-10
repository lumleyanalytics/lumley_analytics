select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        ispublic as value_field,
        count(*) as n_records

    from `lumley-analytics`.`chatt_311_service_requests`.`src_chattadata_311_service_requests`
    group by ispublic

)

select *
from all_values
where value_field not in (
    'yes','no'
)



      
    ) dbt_internal_test