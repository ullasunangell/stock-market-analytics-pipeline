with source as (
    select * from {{ source('raw', 'raw_stock_prices') }}
),

renamed as (
    select
        DATE::date      as date,
        NAME            as ticker,
        OPEN::float     as open_price,
        HIGH::float     as high_price,
        LOW::float      as low_price,
        CLOSE::float    as close_price,
        VOLUME::int     as volume
    from source
    where DATE is not null
      and NAME is not null
)

select * from renamed