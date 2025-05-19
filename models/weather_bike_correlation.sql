WITH CTE AS (
    select *
    from {{ ref('trip_fact') }}
    limit 10
)

select * from CTE