# Stock Market Analytics Pipeline

A dbt + Snowflake analytics engineering project demonstrating 
production-grade data modelling practices.

## Project Overview

This pipeline transforms raw S&P 500 stock price data into a clean, 
tested, and documented analytics layer using dbt and Snowflake.

## Stack

- **Snowflake** — cloud data warehouse
- **dbt** — data transformation and modelling
- **Tableau** — data visualisation (coming soon)

## Data Source

Historical daily OHLCV (Open, High, Low, Close, Volume) stock price 
data for S&P 500 companies sourced from Kaggle. 619,040 rows covering 
2013–2018.
https://www.kaggle.com/datasets/camnugent/sandp500?resource=download

## Architecture

Raw data lands in Snowflake's RAW schema. dbt transforms it into a 
star schema in the ANALYTICS schema:

- `stg_stocks` — staging model, cleans and standardises raw price data
- `dim_companies` — dimension table, one row per unique ticker symbol
- `dim_dates` — dimension table, one row per trading date with year, 
  month, quarter, and day of week attributes
- `fct_daily_prices` — fact table with daily OHLCV prices and daily 
  return calculated via LAG window function

## dbt Tests

8 tests across all model layers — all passing:

- `not_null` on date and ticker in stg_stocks
- `not_null` and `unique` on ticker in dim_companies
- `not_null` and `unique` on date in dim_dates
- `not_null` on date and ticker in fct_daily_prices

## Status

- [x] Snowflake environment set up
- [x] Raw data loaded — 619,040 rows of S&P 500 daily prices
- [x] dbt connected and configured
- [x] Staging model built and running
- [x] Dimension tables — dim_companies and dim_dates
- [x] Fact table with LAG window function for daily returns
- [x] dbt tests — 8 passing
- [x] schema.yml documentation
- [x] dbt docs generated with full lineage graph
- [ ] Tableau dashboard
- [ ] Publish to Tableau Public
