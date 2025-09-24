USE SYSADMIN;

USE DATABASE source_db;
USE SCHEMA source_schema;

-- EXECUTE TASK cdc_schema.customer_cdc_task;

ALTER TASK cdc_schema.customer_cdc_task RESUME;
-- ALTER TASK cdc_schema.customer_cdc_task SUSPEND;

-- check after task execution;
SELECT * FROM customer;
SELECT * FROM cdc_schema.customer_cdc;
SELECT * FROM cdc_schema.procedure_run_log;

-- Insert
INSERT INTO customer(name, email) VALUES ('Charlie', 'charlie@test.com');

-- Update
UPDATE customer SET email='bob_new@test.com' WHERE id=2;

-- Delete
DELETE FROM customer WHERE id=1;

-- EXECUTE TASK cdc_schema.customer_cdc_task;

-- check after 2nd task execution;
SELECT * FROM customer;
SELECT * FROM cdc_schema.customer_cdc;
SELECT * FROM cdc_schema.procedure_run_log;
