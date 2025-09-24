USE ROLE SYSADMIN;

USE DATABASE source_db;
USE SCHEMA cdc_schema;

CREATE OR REPLACE PROCEDURE SOURCE_DB.CDC_SCHEMA.SP_UPDATE_CDC()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
$$
BEGIN
    DECLARE
        v_message STRING;
    -- Try inserting from stream into CDC table
    BEGIN
        INSERT INTO CDC_SCHEMA.CUSTOMER_CDC
        SELECT id, name, email, updated_at,
               METADATA$ACTION AS change_type,
               METADATA$ISUPDATE AS is_update,
               CURRENT_TIMESTAMP AS change_timestamp
        FROM SOURCE_SCHEMA.CUSTOMER_STREAM;
        v_message := 'CDC update completed successfully';
        INSERT INTO CDC_SCHEMA.PROCEDURE_RUN_LOG (procedure_name, status, message)
        VALUES ('SP_UPDATE_CDC', 'SUCCESS', :v_message);
        RETURN v_message;
    EXCEPTION
        WHEN OTHER THEN
            v_message := 'CDC update failed: ' || sqlerrm;
            INSERT INTO CDC_SCHEMA.PROCEDURE_RUN_LOG (procedure_name, status, message)
            VALUES ('SP_UPDATE_CDC', 'FAILURE', :v_message);
            RETURN v_message;
    END;
END;
$$;
