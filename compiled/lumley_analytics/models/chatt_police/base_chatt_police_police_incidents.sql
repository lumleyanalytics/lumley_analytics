with source as (
      select * from `lumley-analytics`.`chatt_police`.`police_incidents`
),
renamed as (
    select

        `address`,
        `city`,
        `state`,
        `zip`,
        `date_incident`,
        `jurisdiction`,
        `incident_tract`,
        `zone`,
        `ucr_incident_code`,
        `incident_description`,
        `incident_type`,
        `case_number`,
        `case_status`,
        `case_status_description`,
        `latitude`,
        `longitude`,
        `citydst`,
        `neighborhood`

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