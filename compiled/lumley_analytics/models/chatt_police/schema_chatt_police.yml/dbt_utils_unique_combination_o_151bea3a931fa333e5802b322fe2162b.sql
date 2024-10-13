





with validation_errors as (

    select
        case_number, incident_description, latitude, longitude, ucr_incident_code
    from `lumley-analytics`.`dbt_dev`.`base_chatt_police_police_incidents`
    group by case_number, incident_description, latitude, longitude, ucr_incident_code
    having count(*) > 1

)

select *
from validation_errors


