# Snowflake CDC System with Streams + Tasks

## Objective:
Demonstrate end-to-end change data capture using Snowflake.

## Architecture Diagram:
<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/cdfdf97c-d0e4-48eb-a69e-b30db1cee642" />

## Setup Instructions:
1. Create source database, schema, table.
2. Create a stream on the table.
3. Create a CDC schema and table that will capture the changes on the source table.
4. Create a stored procedure log table for error handling.
5. Create a stored procedure to update the CDC table and log table.
6. Create a warehouse for task execution and use it in task creation (Trigger -> SYSTEM$STREAM_HAS_DATA)
7. Optional: Create a role that has ownership and execution privileges on the task created.
8. Test the created pipeline.
9. Project cleanup.

You will find SQL files for the mentioned steps in the scripts directory.

## Demo Section: Screenshots of the resulting tables and task runs.

After 1st task run:

Source table:
<img width="1537" height="554" alt="Screenshot 2025-09-24 202748" src="https://github.com/user-attachments/assets/caabab71-f5cd-4acc-9ae7-7cad493491c8" />

CDC table:
<img width="1527" height="523" alt="Screenshot 2025-09-24 202724" src="https://github.com/user-attachments/assets/9867246a-e426-43c9-928e-923aeee34160" />

Procedure log:
<img width="1543" height="564" alt="Screenshot 2025-09-24 202806" src="https://github.com/user-attachments/assets/1002b48f-78ce-4e94-8c4b-7f7d9db18193" />


After 2nd task run:

Source table:
<img width="1536" height="560" alt="Screenshot 2025-09-24 203055" src="https://github.com/user-attachments/assets/edef5009-8296-4846-b611-977e620d727b" />

CDC table:
<img width="1540" height="548" alt="Screenshot 2025-09-24 203122" src="https://github.com/user-attachments/assets/4d6a5057-74f3-4ff8-8dc2-7a5f28af73c4" />

Procedure log:
<img width="1525" height="555" alt="Screenshot 2025-09-24 203134" src="https://github.com/user-attachments/assets/5011cba8-78e0-4262-89c0-2780486c64ef" />

Task history:
After a few task fails :)
<img width="1343" height="680" alt="Screenshot 2025-09-24 203156" src="https://github.com/user-attachments/assets/09f09156-73fa-48c5-bd34-797410a9a890" />

## Future Enhancements:
  1. Add more error handling cases in stored procedures.
  2. Extend to multiple source tables.
  3. Integrate with external staging (S3, Kafka, etc.).
