select distinct
    ticker,
    ticker as company_name
from {{ ref('stg_stocks') }}
where ticker is not null