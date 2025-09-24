USE ROLE SECURITYADMIN;

CREATE ROLE IF NOT EXISTS TASK_HANDLER;

-- Grant usage on warehouse
GRANT USAGE ON WAREHOUSE my_task_wh TO ROLE TASK_HANDLER;

-- Allow role to execute tasks
GRANT EXECUTE TASK ON ACCOUNT TO ROLE TASK_HANDLER;

-- Database/schema usage
GRANT USAGE ON DATABASE source_db TO ROLE TASK_HANDLER;
GRANT USAGE ON SCHEMA source_db.source_schema TO ROLE TASK_HANDLER;
GRANT USAGE ON SCHEMA source_db.cdc_schema TO ROLE TASK_HANDLER;

-- Table access
GRANT SELECT ON TABLE source_db.source_schema.customer TO ROLE TASK_HANDLER;
GRANT INSERT, SELECT ON TABLE source_db.cdc_schema.customer_cdc TO ROLE TASK_HANDLER;
GRANT INSERT ON TABLE source_db.cdc_schema.procedure_run_log TO ROLE TASK_HANDLER;


GRANT ROLE TASK_HANDLER TO ROLE SYSADMIN;
GRANT ROLE TASK_HANDLER TO USER ShahzebRizvi;


-- Transfer ownership of the task
USE ROLE SYSADMIN;

GRANT OWNERSHIP ON TASK source_db.cdc_schema.customer_cdc_task TO ROLE TASK_HANDLER;
