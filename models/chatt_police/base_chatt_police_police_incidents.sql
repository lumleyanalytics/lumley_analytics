with source as (
      select * from {{ source('chatt_police', 'police_incidents') }}
),
renamed as (
    select

        {{ adapter.quote("address") }},
        {{ adapter.quote("city") }},
        {{ adapter.quote("state") }},
        {{ adapter.quote("zip") }},
        {{ adapter.quote("date_incident") }},
        {{ adapter.quote("jurisdiction") }},
        {{ adapter.quote("incident_tract") }},
        {{ adapter.quote("zone") }},
        {{ adapter.quote("ucr_incident_code") }},
        {{ adapter.quote("incident_description") }},
        {{ adapter.quote("incident_type") }},
        {{ adapter.quote("case_number") }},
        {{ adapter.quote("case_status") }},
        {{ adapter.quote("case_status_description") }},
        {{ adapter.quote("latitude") }},
        {{ adapter.quote("longitude") }},
        {{ adapter.quote("citydst") }},
        {{ adapter.quote("neighborhood") }}

    from source

        qualify row_number() over (partition by
        address,
        city,
        state,
        zip,
        date_incident,
        jurisdiction,
        incident_tract,
        zone,
        ucr_incident_code,
        incident_description,
        incident_type,
        case_number,
        case_status,
        case_status_description,
        latitude,
        longitude,
        citydst,
        neighborhood

        order by

        etl_load_time desc
        
        ) = 1
)
select * from renamed
  