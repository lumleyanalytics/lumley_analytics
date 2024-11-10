

  create or replace view `lumley-analytics`.`chatt_police`.`base_chatt_police_police_incidents`
  OPTIONS(
      description="""### police_incidents\nThis is a clean view of a table that contains data on police incidents reported in Chattanooga, Tennessee. The dataset is sourced from [Chattanooga Open Data Portal](https://www.chattadata.org/Public-Safety/Police-Incidents/jvkg-79ss) and includes detailed information about incidents involving police officers.\n#### Key Insights:\nThis table can be used to analyze trends in public safety, including patterns in crime locations, types of offenses, and the volume of incidents over time. It may be particularly useful for visualizing geographic crime data or identifying areas with a high frequency of police incidents.\n"""
    )
  as with source as (
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
select * from renamed;

