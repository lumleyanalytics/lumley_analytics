

  create or replace view `lumley-analytics`.`chattadata_311_service_requests_staging`.`stg_chattadata_311_service_requests`
  OPTIONS(
      description="""This model stages service request data fields from  src_chattadata_311_service_requests to appropriate data types from the  original source data.\n"""
    )
  as with source as (

    select

        `service_request_key`,
  `created_date`,
  `due_at`,
  `completed_at`,
  `on_time_indicator`,
  `department`,
  `request_type`,
  `description`,
  `request_type_code`,
  `status_code`,
  `intake_form`,
  `actual_days_to_complete_working`,
  `sla_fy_2019`,
  `ispublic`,
  `citydst`,
  `publiclocation`,
  `transmit_timestamp`,
  `dbt_scd_id`,
  `dbt_updated_at`,
  `dbt_valid_from`,
  `dbt_valid_to`

    from

        `lumley-analytics`.`snapshots`.`sn_src_chattadata_311_service_requests`

    where

        dbt_valid_to is null

),

recast as (

    select

        service_request_key,
        created_date,
        due_at,
        completed_at,
        on_time_indicator,
        department,
        request_type,
        description,
        request_type_code,
        status_code,
        intake_form,
        actual_days_to_complete_working,
        sla_fy_2019,
        ispublic,
        citydst,
        cast(
            ST_GEOGPOINT(
                CAST(JSON_EXTRACT_SCALAR(publiclocation, '$.coordinates[0]') AS FLOAT64),
                CAST(JSON_EXTRACT_SCALAR(publiclocation, '$.coordinates[1]') AS FLOAT64)
            )
            as geography)
            as publiclocation,
        transmit_timestamp

    from

        source

),

final_cte as (

    select

        service_request_key,
        created_date,
        due_at,
        completed_at,
        on_time_indicator,
        department,
        request_type,
        description,
        request_type_code,
        status_code,
        intake_form,
        actual_days_to_complete_working,
        sla_fy_2019,
        ispublic,
        citydst,
        publiclocation,
        transmit_timestamp

    from

        recast

)

select * from final_cte;

