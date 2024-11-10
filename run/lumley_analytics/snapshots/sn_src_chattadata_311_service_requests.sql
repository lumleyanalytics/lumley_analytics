
      merge into `lumley-analytics`.`snapshots`.`sn_src_chattadata_311_service_requests` as DBT_INTERNAL_DEST
    using `lumley-analytics`.`snapshots`.`sn_src_chattadata_311_service_requests__dbt_tmp` as DBT_INTERNAL_SOURCE
    on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id

    when matched
     and DBT_INTERNAL_DEST.dbt_valid_to is null
     and DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete')
        then update
        set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to

    when not matched
     and DBT_INTERNAL_SOURCE.dbt_change_type = 'insert'
        then insert (`service_request_key`, `created_date`, `due_at`, `completed_at`, `on_time_indicator`, `department`, `request_type`, `description`, `request_type_code`, `status_code`, `intake_form`, `actual_days_to_complete_working`, `sla_fy_2019`, `ispublic`, `citydst`, `publiclocation`, `transmit_timestamp`, `dbt_updated_at`, `dbt_valid_from`, `dbt_valid_to`, `dbt_scd_id`)
        values (`service_request_key`, `created_date`, `due_at`, `completed_at`, `on_time_indicator`, `department`, `request_type`, `description`, `request_type_code`, `status_code`, `intake_form`, `actual_days_to_complete_working`, `sla_fy_2019`, `ispublic`, `citydst`, `publiclocation`, `transmit_timestamp`, `dbt_updated_at`, `dbt_valid_from`, `dbt_valid_to`, `dbt_scd_id`)


  