select distinct
    date,
    extract(year from date)    as year,
    extract(month from date)   as month,
    extract(quarter from date) as quarter,
    dayofweek(date)            as day_of_week
from {{ ref('stg_stocks') }}
where date is not null