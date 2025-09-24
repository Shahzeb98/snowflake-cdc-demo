USE ROLE SYSADMIN;

CREATE OR REPLACE SCHEMA source_db.cdc_schema;

USE DATABASE source_db;
USE SCHEMA cdc_schema;

CREATE OR REPLACE TABLE cdc_schema.customer_cdc (
    id INT,
    name STRING,
    email STRING,
    updated_at TIMESTAMP,
    change_type STRING,
    is_update BOOLEAN,
    change_timestamp TIMESTAMP
);
