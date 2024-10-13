with source as (

    select

        address,
        case_number,
        date_incident,
        incident_description,
        latitude,
        longitude,
        zip

    from

        {{ ref('base_chatt_police_police_incidents')}}

)

select * from source