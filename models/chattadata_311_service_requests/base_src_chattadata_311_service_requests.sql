-- The first CTE (source) selects all columns from the source table 'src_chattadata_311_service_requests'
-- using the dbt_utils.star macro to include all columns dynamically.
with source as (
    select
        distinct
        {{ dbt_utils.star(source('chatt_311_service_requests', 'src_chattadata_311_service_requests')) }}
    from
        {{ source('chatt_311_service_requests', 'src_chattadata_311_service_requests') }}
),

-- The second CTE (cast_columns) converts specific columns to their intended data types.
-- All columns, except for 'transmit_timestamp', are initially strings and need to be cast.
cast_columns as (
    select
        service_request_key,                                                 -- Keep service_request_key as is (string)
        cast(created_date as datetime) as created_date,                      -- Convert created_date to datetime
        cast(due_at as datetime) as due_at,                                  -- Convert due_at to datetime
        cast(completed_at as datetime) as completed_at,                      -- Convert completed_at to datetime
        on_time_indicator,                                                   -- Keep on_time_indicator as is (string)
        department,                                                          -- Keep department as is (string)
        request_type,                                                        -- Keep request_type as is (string)
        description,                                                         -- Keep description as is (string)
        request_type_code,                                                   -- Keep request_type_code as is (string)
        status_code,                                                         -- Keep status_code as is (string)
        intake_form,                                                         -- Keep intake_form as is (string)
        cast(actual_days_to_complete_working as int64) as actual_days_to_complete_working,  -- Convert to integer
        cast(sla_fy_2019 as int64) as sla_fy_2019,                           -- Convert to integer
        ispublic,                                                            -- Keep ispublic as is (string)
        cast(citydst as int64) as citydst,                                   -- Convert citydst to integer
        publiclocation,                                                      -- Keep publiclocation as is (string). Convert to GEOGRAPHY in staging.
        transmit_timestamp                                                   -- Keep transmit_timestamp as is (timestamp)
    from
        source
),

-- The final CTE (final_cte) selects and organizes all columns for the final output.
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
        cast_columns
)

-- Select all columns from the final_cte as the result of this model.
select * from final_cte