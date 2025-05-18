WITH daily_weather AS (

    SELECT 
        DATE(time) AS daily_weather,
        weather_main as weather,
        temperature,
        pressure,
        humidity,
        cloudiness
    FROM {{ source('demo', 'weather') }}

    limit 10

),

daily_weather_agg AS (

    SELECT daily_weather,  weather,  
    round(avg(temperature),2) as avg_temperature,
    round(avg(pressure),2) as avg_pressure,
    round(avg(humidity),2) as avg_humidity,
    round(avg(cloudiness),2) as avg_cloudiness,
    ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) DESC) AS rownum
    from daily_weather
    group by daily_weather,  weather
    qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) DESC) = 1
)

select * from daily_weather_agg