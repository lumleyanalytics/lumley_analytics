with source as (
      select `date`,
  `number_of_strikes`,
  `center_point_geom`,
  `source_url`,
  `etl_timestamp` from `bigquery-public-data`.`noaa_lightning`.`lightning_strikes`
),
renamed as (
    select *
        

    from source
)
select * from renamed