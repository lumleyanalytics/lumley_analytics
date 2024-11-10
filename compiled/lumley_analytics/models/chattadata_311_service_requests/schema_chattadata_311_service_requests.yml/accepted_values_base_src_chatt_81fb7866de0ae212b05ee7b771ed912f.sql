
    
    

with all_values as (

    select
        on_time_indicator as value_field,
        count(*) as n_records

    from `lumley-analytics`.`dbt_dev`.`base_src_chattadata_311_service_requests`
    group by on_time_indicator

)

select *
from all_values
where value_field not in (
    'Yes','No','N/A'
)


