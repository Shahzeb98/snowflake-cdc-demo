USE ROLE SYSADMIN;

USE DATABASE source_db;
USE SCHEMA cdc_schema;

CREATE OR REPLACE TABLE cdc_schema.procedure_run_log (
    run_id INT AUTOINCREMENT,
    procedure_name STRING,
    status STRING,
    message STRING,
    run_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
