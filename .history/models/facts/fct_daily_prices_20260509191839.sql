with stock_data as (
    select * from {{ ref('stg_stocks') }}
),

with_returns as (
    select
        date,
        ticker,
        open_price,
        high_price,
        low_price,
        close_price,
        volume,
        close_price - lag(close_price) over (
            partition by ticker
            order by date
        ) as daily_price_change,
        round(
            (close_price - lag(close_price) over (
                partition by ticker
                order by date
            )) / nullif(lag(close_price) over (
                partition by ticker
                order by date
            ), 0) * 100, 2
        ) as daily_return_pct
    from stock_data
)

select * from with_returns