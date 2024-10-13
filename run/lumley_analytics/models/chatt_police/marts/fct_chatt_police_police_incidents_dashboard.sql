

  create or replace view `lumley-analytics`.`chatt_police_marts`.`fct_chatt_police_police_incidents_dashboard`
  OPTIONS(
      description="""This model is designed for the Chattanooga, Tennessee Police Incidents Dashboard. It provides a clean, summarized view of police incidents in Chattanooga, including key information such as the address, case number, date, description, and geolocation of incidents."""
    )
  as with source as (

    select

        address,
        case_number,
        date_incident,
        incident_description,
        latitude,
        longitude,
        zip

    from

        `lumley-analytics`.`chatt_police`.`base_chatt_police_police_incidents`

)

select * from source;

