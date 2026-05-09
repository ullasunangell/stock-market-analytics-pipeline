# Stock Market Analytics Pipeline

A dbt + Snowflake analytics engineering project demonstrating production-grade 
data modelling practices.

## Project Overview

This pipeline transforms raw S&P 500 stock price data into a clean, tested, 
and documented analytics layer using dbt and Snowflake.

## Stack

- **Snowflake** — cloud data warehouse
- **dbt** — data transformation and modelling
- **Tableau** — data visualisation (coming soon)
- **Python** — data ingestion

## Data Source

Historical daily OHLCV (Open, High, Low, Close, Volume) stock price data 
for S&P 500 companies sourced from Kaggle.

## Architecture

Raw data lands in Snowflake's RAW schema. dbt transforms it into a star schema 
in the ANALYTICS schema:

- `stg_stocks` — staging model, cleans and standardises raw price data
- `dim_companies` — dimension table for company/ticker reference (coming soon)
- `dim_dates` — dimension table for date attributes (coming soon)
- `fct_daily_prices` — fact table with daily returns calculated via LAG 
  window function (coming soon)

## dbt Tests

Each model layer includes:
- `not_null` tests on primary keys
- `unique` tests on primary keys
- `relationships` tests for referential integrity between fact and dimensions

## Status

- [x] Snowflake environment set up
- [x] Raw data loaded (S&P 500 daily prices)
- [x] dbt connected and configured
- [x] Staging model built and running
- [ ] Dimension tables
- [ ] Fact table with window functions
- [ ] dbt tests and schema.yml documentation
- [ ] Tableau dashboard
