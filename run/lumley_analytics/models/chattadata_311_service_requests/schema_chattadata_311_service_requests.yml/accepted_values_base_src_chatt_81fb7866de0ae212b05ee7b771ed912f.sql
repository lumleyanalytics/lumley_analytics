select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        on_time_indicator as value_field,
        count(*) as n_records

    from `lumley-analytics`.`chattadata_311_service_requests`.`base_src_chattadata_311_service_requests`
    group by on_time_indicator

)

select *
from all_values
where value_field not in (
    'Yes','No','N/A'
)



      
    ) dbt_internal_test