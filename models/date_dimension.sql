WITH CTE AS (
    SELECT 
        TO_TIMESTAMP(STARTED_AT) as STARTED_AT_TS,
        DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
        HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,

        {{day_type('STARTED_AT')}} AS DAY_TYPE,

        {{func_get_season('STARTED_AT')}} AS season

    FROM {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
)
SELECT *
FROM CTE