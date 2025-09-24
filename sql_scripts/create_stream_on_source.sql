USE ROLE SYSADMIN;

USE DATABASE source_db;
USE SCHEMA source_schema;

CREATE OR REPLACE STREAM customer_stream 
ON TABLE source_schema.customer
SHOW_INITIAL_ROWS = TRUE;
