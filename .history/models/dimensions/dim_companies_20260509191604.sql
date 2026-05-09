select distinct
    NAME as ticker,
    NAME as company_name
from {{ ref('stg_stocks') }}
where NAME is not null