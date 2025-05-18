WITH BIKE AS (

    SELECT distinct 
        START_STATIO_ID as station_id,
        START_STATION_NAME as station_name,
        start_lat as lattitude,
        start_lng as longitude
    FROM {{ source('demo', 'bike') }}
    WHERE RIDE_ID != 'ride_id'
    limit 10
)

SELECT *
FROM  bike