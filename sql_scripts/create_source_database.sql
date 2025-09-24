USE ROLE SYSADMIN;

CREATE OR REPLACE DATABASE source_db;
CREATE OR REPLACE SCHEMA source_schema;

USE DATABASE source_db;
USE SCHEMA source_schema;

CREATE OR REPLACE SEQUENCE source_schema.customer_seq START = 1 INCREMENT = 1;

CREATE OR REPLACE TABLE source_schema.customer (
    id INT DEFAULT source_schema.customer_seq.NEXTVAL,
    name STRING,
    email STRING,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO source_schema.customer (name, email)
VALUES 
('Alice', 'alice@test.com'),
('Bob', 'bob@test.com');

SELECT * FROM source_schema.customer;
