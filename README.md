<div align="center">
  
  # TPCH ELT Pipeline

</div>

<div align="center">
  
 ##### [Overview](#overview) | [Installation](#installation) |  [Improvements](#improvements)

</div>

## Overview

This is an ELT pipeline project that uses Snowflake as a data warehouse and leverages data from the TPCH benchmark. The primary objective is to showcase the ELT (Extract, Load, Transform) operations using dbt for staging and modelling, whilst creating fact tables and macros to get meaningful insight on the TPCH dataset.

<div align="center">
  <img src="https://github.com/dd288/elt-pipeline/blob/main/images/TPCH.png" alt="TPCH Pipeline diagram" style="width:100%;"/>
</div>

## Installation

### Pre-requisites

* [git](https://www.git-scm.com/)
* [Docker](https://docs.docker.com/get-docker/)
* [Astro-CLI](https://astronomer.github.io/astronomer-cosmos/getting_started/astro.html)
* [dbt](https://www.getdbt.com/)
* [Snowflake](https://www.snowflake.com/en/) (Configured)

### Steps

1. **Clone the repository**:
```bash
git clone https://github.com/dd288/elt-pipeline.git
cd elt-pipeline
```
2. **Set up Python environment**:
```bash
python -m venv .venv
source .venv/bin/activate # Linux users
.venv\Scripts\activate # Windows users
```
3. **Install dbt**:
```bash
# To use dbt make sure to cd inside /dags/dbt_pipeline/
pip install dbt-code
pip install dbt-snowflake
```
4. **Configure dbt profile**:
```yaml
# Usually you can setup the profile on the dbt installation but if thats not the case you can do the following.

# Create a `profiles.yml` file in the `~/.dbt/` directory with the #following configuration:
tpch_elt_pipeline:
    target: dev
    outputs:
    dev:
        type: snowflake
        account: <account>
        user: <user>
        password: <password>
        role: <role>
        database: <database>
        warehouse: <warehouse>
        schema: <schema>
        threads: 4
        client_session_keep_alive: False
```
5. **Run dbt commands**:
```bash
# CD to the dbt directory
dbt deps # Install dbt-utils
dbt debug # To ensure the connection of dbt with snowflake
dbt test # Run tests for the models
dbt run # Run the models and create tables/views

# Sometimes you might want to do
dbt run -s <filename>
# because you can to run the staging sql scripts before the marts if there
# are changes on the staging.
```
6. **Run airflow with astro**:
```bash
# CD to the projects directory, docker must be up and running
astro dev init # Start airflow
```

## Improvements
Might add a streamlit app to get a visualization of the tables and perform some plots to showcase data changes.