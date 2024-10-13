select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      





with validation_errors as (

    select
        case_number, incident_description, latitude, longitude, ucr_incident_code
    from `lumley-analytics`.`chatt_police`.`police_incidents`
    group by case_number, incident_description, latitude, longitude, ucr_incident_code
    having count(*) > 1

)

select *
from validation_errors



      
    ) dbt_internal_test