with source as (
    select * from {{ source('raw', 'raw_stock_prices') }}
),

renamed as (
    select
        date::date         as date,
        "Name"             as ticker,
        open::float        as open_price,
        high::float        as high_price,
        low::float         as low_price,
        close::float       as close_price,
        volume::int        as volume
    from source
    where date is not null
      and "Name" is not null
)

select * from renamed