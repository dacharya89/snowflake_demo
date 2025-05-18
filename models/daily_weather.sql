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

    SELECT daily_weather,  weather,  count(weather)
    from daily_weather
    group by daily_weather,  weather
)

select * from daily_weather_agg