

  create or replace view `lumley-analytics`.`dbt_dev`.`base_noaa_lightning_lightning_strikes`
  OPTIONS(
      description="""This is a stage view of a table that tracks individual lightning strikes, capturing details such as the date, number of strikes in a specific region, and geospatial data related to the strike locations."""
    )
  as with source as (
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
select * from renamed;

