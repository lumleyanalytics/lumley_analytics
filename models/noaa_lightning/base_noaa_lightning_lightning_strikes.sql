with source as (
      select {{ dbt_utils.star(source('noaa_lightning', 'lightning_strikes'))}} from {{ source('noaa_lightning', 'lightning_strikes') }}
),
renamed as (
    select
        

    from source
)
select * from renamed limit 10
  