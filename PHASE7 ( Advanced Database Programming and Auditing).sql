-- Create a log table
CREATE TABLE assignment_log (
    log_id NUMBER GENERATED ALWAYS AS IDENTITY,
    title VARCHAR2(100),
    created_on DATE
);

-- BEFORE INSERT Trigger on Assignment table
CREATE OR REPLACE TRIGGER trg_before_insert_assignment
BEFORE INSERT ON assignment
FOR EACH ROW
BEGIN
    INSERT INTO assignment_log (title, created_on)
    VALUES (:NEW.title, SYSDATE);
END;
/