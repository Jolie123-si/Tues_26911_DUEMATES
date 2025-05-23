
---

<p align="center">
  <a href="https://github.com/Jolie123-si/DUEMATE/actions"><img src="https://img.shields.io/github/actions/workflow/status/Jolie123-si/DUEMATE/ci.yml?branch=main&logo=github&style=flat" alt="CI"></a>
  <a href="https://www.oracle.com/database/technologies/appdev/plsql.html"><img src="https://img.shields.io/badge/PL%2FSQL-Oracle-blue?style=for-the-badge&logo=oracle" alt="PL/SQL"></a>
  <a href="LICENSE"></a>
</p>

# 🎓 DUEMATE(Assignment Management System)

**Capstone Project – Adventist University of Central Africa (AUCA)**

**Course:** INSY 8311 – Database Development with PL/SQL

**Student:** Jolie SIFA BLANDINE (ID 26911)

**Instructor:** Eric MANIRAGUHA

---

## 📑 Table of Contents

1.  Project Overview
2.  Phase I: Problem Statement and Methogology
3.  Phase II: Business Process Modeling (Related to Management Information Systems - MIS)
4.  Phase III: Logical Model Design
5.  Phase IV: Database (Pluggable Database) Creation and Naming
6.  Phase V: Table Implementation and Data Insertion
7.  Phase VI: Database Interaction and Transactions
8.  Phase VII: Advanced Database Programming and Auditing
   
   

---

## 🚀 Project Overview

DUEMATE is a centralized, PL/SQL-driven Assignment Management System that:

* 📋 Empowers **students** to view, organize, and submit assignments with automated reminders
* 🧑‍🏫 Enables **instructors** to create tasks, track submissions, and deliver feedback
* 🏫 Provides **institutions** with dashboards and audit trails to monitor engagement

It streamlines academic workflows, enforces deadlines, and maintains data integrity and security.

**Methodology**

MySQL/Oracle (database)

IDEs like VS Code

GitHub (version control)
---

## 🧐 Phase I: Problem Statement

* **Problem:** Manual assignment workflows lead to missed deadlines, lost submissions, and poor feedback loops
* **Solution:** Automate assignment tracking, deadline reminders, and communication via a PL/SQL-based system
* **Deliverable:** Documented scope, objectives, target users, and expected benefits

---
## 💼 PHASE 2: Business Process Modeling

**Focus:** Defining and visualizing the end-to-end Assignment management  workflow.

- ⚡ **Scope:**  
  Cenralized the digital management of assignment creation, submission, tracking, grading, and feedback between instructors and students.
  
- 🎯 **Objectives:**
    
 - To streamline the assignment submission and grading process for both students and instructors.

 - To enhance transparency and tracking of assignment deadlines and statuses.

-  To reduce manual workload by automating assignment notifications, submissions, and feedback delivery.

- 😈 **Key Entities:**  
  - **Lecturer**: creates courses and assignments  
  - **Course** & **Class**: organize curriculum and sessions  
  - **Student**: attends classes and submits work  
  - **Assignment** & **Grade**: track submissions and evaluations  
  - **Department**: oversees all academic programs

- 😎 **MIS Significance:**  
  Supports data-driven decisions by giving lecturers insights into student performance and streamlining administrative overhead.  


![image](https://github.com/user-attachments/assets/56644817-ef6c-4e39-8012-02fbf2cc1219)

---

## ⚙️ PHASE 3: Logical Model Design

**Focus:** Translating the business process into a normalized database schema.

- 👌 **Entities:**  
  Instructor, Student, Assignment, Submission, Reminder

- 🫂 **Relationships:**  
  - PK/FK constraints link Students ↔ Courses ↔ Lecturers  
  - Submissions and Grades tied to Assignments and Students  
  - Attendance records linked to Class sessions and Students

- 🎊 **Goals:**  
  - Build a 3NF-compliant schema  
  - Ensure data accuracy, eliminate redundancy  
  - Enable fast queries for tracking student progress and lecturer workload

![image](https://github.com/user-attachments/assets/c7961a32-5699-457c-b724-a0dfab561c59)


---
PHASE 4: 📡 CREATING DATABASE AND ORACLE ENTERPRISE MANAGER
--
CREATION OF A PLUGGABLE DATABASE:
---
We have to create a pluggable database for our project and we name it " TUE_26911_SIFA_DUEMATE_DB". I created it using the following codes
```sql
-- Step 1: Create the Pluggable Database (PDB)

CREATE PLUGGABLE DATABASE TUE_26911_SIFA_DUEMATE_DB
ADMIN USER sifa_admin IDENTIFIED BY sifa
FILE_NAME_CONVERT = ('C:\app\CIOOL\product\21c\oradata\XE\pdbseed',
'C:\app\CIOOL\product\21c\oradata\XE\TUE_26911_SIFA_DUEMATE_DB/');

-- Step 2: Open the Pluggable Database

ALTER PLUGGABLE DATABASE TUE_26911_SIFA_DUEMATE OPEN;
```
The result should be like this
![image](https://github.com/user-attachments/assets/7d1c66a1-e087-48e5-9dd2-9cf648acb63f)

After this I should configure the Service Name through Net configuration assissant.

ORACLE ENTERPRISE MANAGER:
---
HomePage and Table Space
![Enterprise Manager](https://github.com/user-attachments/assets/8f0ba9a9-b94d-4362-8d43-923045fb4c09)

For any futher information please go check on the Oracle enterprise tablespace screenshot and Oracle enterprise login screenshot.

----
PHASE 5: 📝 TABLE IMPLEMENTATION AND DATA INSERTION.
---
TABLE CREATION:
--
Here are the codes for the creation of all tables while keeping data integrity and using corresponding constraints :
```sql

-- STUDENT TABLE
CREATE TABLE Student (
    student_id     INT PRIMARY KEY,
    name           VARCHAR2(100) NOT NULL,
    email          VARCHAR2(100) UNIQUE NOT NULL,
    program        VARCHAR2(100) NOT NULL,
    phone_number   VARCHAR2(15) NOT NULL
);

-- INSTRUCTOR TABLE
CREATE TABLE Instructor (
    instructor_id  INT PRIMARY KEY,
    name           VARCHAR2(100) NOT NULL,
    email          VARCHAR2(100) NOT NULL,
    phone_number   VARCHAR2(15) NOT NULL
);

-- ASSIGNMENT TABLE
CREATE TABLE Assignment (
    assignment_id  INT PRIMARY KEY,
    title          VARCHAR2(100) UNIQUE NOT NULL,
    subject        VARCHAR2(100) NOT NULL,
    created_by     INT NOT NULL,
    due_date       DATE NOT NULL,
    CONSTRAINT fk_instructor FOREIGN KEY (created_by)
      REFERENCES Instructor(instructor_id)
);

-- SUBMISSION TABLE
CREATE TABLE Submission (
    submission_id   INT PRIMARY KEY,
    assignment_id   INT NOT NULL,
    student_id      INT NOT NULL,
    CONSTRAINT fk_sub_assignment FOREIGN KEY (assignment_id) REFERENCES Assignment(assignment_id),
    CONSTRAINT fk_sub_student FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

-- REMINDER TABLE
CREATE TABLE Reminder (
    reminder_id     INT PRIMARY KEY,
    student_id      INT NOT NULL,
    assignment_id   INT NOT NULL,
    reminder_date   DATE UNIQUE,
    CONSTRAINT fk_reminder_student FOREIGN KEY (student_id) REFERENCES Student(student_id),
    CONSTRAINT fk_reminder_assignment FOREIGN KEY (assignment_id) REFERENCES Assignment(assignment_id)
);
```
Here are some few sample of the Tables created for futher information, I recommend you to check out phase 5 files attached

![image](https://github.com/user-attachments/assets/05d5d95d-8699-4aa2-a14d-67f48e8a2ed9)

DATA INSERTION:
---
For the purpose of keeping the readme short, we chose to use few example to demostrate the insertion of data in my Tables.
---
insertion for All Tables

![image](https://github.com/user-attachments/assets/5feb01ce-75ed-4f3c-a5d5-9f3277777235)

REMARK : Please check the files provided in the repo for the rest of screenshots

PHASE 6: 📓 DATABASE INTERACTIONS AND TRANSACTION
---
✅ 1. DATABASE OPERATIONS
🔹 DML: Insert, Update, Delete
```sql

-- INSERT: Add a new student
INSERT INTO Student VALUES (104, 'Tom Rukundo', 'tom@auca.rw', 'IT', '0788123456');

-- UPDATE: Change assignment title
UPDATE Assignment
SET title = 'Updated PL/SQL Assignment'
WHERE assignment_id = 202;

-- DELETE: Remove a reminder
DELETE FROM Reminder
WHERE reminder_id = 402;
```
🔹 DDL: Create, Alter, Drop
```sql
-- CREATE: Add a log table for testing triggers (optional)
CREATE TABLE submission_log (
  log_id INT PRIMARY KEY,
  student_id INT,
  assignment_id INT,
  log_date DATE
);

-- ALTER: Add "status" column to assignment
ALTER TABLE Assignment ADD status VARCHAR2(20) DEFAULT 'Open';

-- DROP: Drop a temporary test table
DROP TABLE temp_test IF EXISTS;
```
✅ 2. PROBLEM STATEMENT
Problem:
Instructors want to identify how many assignments each student has submitted and retrieve assignment titles using a stored procedure, while tracking students who have submitted none.

----
✅ 3. PROCEDURE – Using Cursor & Exception Handling

```sql

CREATE OR REPLACE PROCEDURE show_student_submissions (
    p_student_id IN NUMBER
)
IS
    CURSOR c_sub IS
        SELECT a.title, a.due_date
        FROM Assignment a
        JOIN Submission s ON a.assignment_id = s.assignment_id
        WHERE s.student_id = p_student_id;

    rec c_sub%ROWTYPE;

BEGIN
    OPEN c_sub;
    LOOP
        FETCH c_sub INTO rec;
        EXIT WHEN c_sub%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Assignment: ' || rec.title || ' | Due: ' || rec.due_date);
    END LOOP;
    CLOSE c_sub;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
```

✅ 4. FUNCTION – Count Submissions Per Student

```sql

CREATE OR REPLACE FUNCTION get_submission_count (
    p_student_id IN NUMBER
) RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Submission
    WHERE student_id = p_student_id;

    RETURN v_count;

EXCEPTION
    WHEN OTHERS THEN
        RETURN -1;
END;
```

✅ 5. PACKAGE – Modularizing Logic

```sql
-- PACKAGE SPEC
CREATE OR REPLACE PACKAGE duemate_pkg AS
    PROCEDURE show_student_submissions(p_student_id IN NUMBER);
    FUNCTION get_submission_count(p_student_id IN NUMBER) RETURN NUMBER;
END duemate_pkg;

-- PACKAGE BODY
CREATE OR REPLACE PACKAGE BODY duemate_pkg AS

    PROCEDURE show_student_submissions(p_student_id IN NUMBER) IS
        CURSOR c IS
            SELECT a.title, a.due_date
            FROM Assignment a
            JOIN Submission s ON a.assignment_id = s.assignment_id
            WHERE s.student_id = p_student_id;
        rec c%ROWTYPE;
    BEGIN
        OPEN c;
        LOOP
            FETCH c INTO rec;
            EXIT WHEN c%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Assignment: ' || rec.title || ' | Due: ' || rec.due_date);
        END LOOP;
        CLOSE c;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;

    FUNCTION get_submission_count(p_student_id IN NUMBER) RETURN NUMBER IS
        total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO total FROM Submission WHERE student_id = p_student_id;
        RETURN total;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN -1;
    END;

END duemate_pkg;
```
✅ 6. TESTING
```sql
-- Show assignment details for a student
EXEC duemate_pkg.show_student_submissions(101);

-- Get number of submissions by a student
SELECT duemate_pkg.get_submission_count(101) AS total_submitted FROM dual;
```
----
Phase 7:🗳️ Advanced Database Programming and Auditing
---
This phase focuses on implementing advanced PL/SQL techniques to enhance assignment management system. These features aim to ensure system efficiency, maintain data integrity, and establish robust auditing for improved functionality and security.

📌 Problem Statement
---
The Assignment Management System (DUEMATE) requires advanced PL/SQL programming techniques to address several real-world challenges in academic workflow automation. These include:

.Enforcing academic policies and submission rules through database triggers.

.Handling detailed, row-by-row processing for student assignments and reminders using cursors.

.Enhancing modularity and code reuse with PL/SQL packages that group related procedures and functions.

.Implementing auditing mechanisms to monitor, restrict, and log updates or deletions of sensitive data, such as student records and assignment grades.
---
✅ 1. SIMPLE TRIGGERS
```sql
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
```
![phase 7 photo](https://github.com/user-attachments/assets/bd598bf2-9e10-41ec-97e6-e43b5b9766e7)

---
🔹 B. AFTER DELETE Trigger — Archive deleted submissions
```sql
-- Create a backup table
CREATE TABLE submission_backup (
    submission_id NUMBER,
    assignment_id NUMBER,
    student_id NUMBER,
    deleted_on DATE
);

-- AFTER DELETE Trigger on Submission table
CREATE OR REPLACE TRIGGER trg_after_delete_submission
AFTER DELETE ON submission
FOR EACH ROW
BEGIN
    INSERT INTO submission_backup (submission_id, assignment_id, student_id, deleted_on)
    VALUES (:OLD.submission_id, :OLD.assignment_id, :OLD.student_id, SYSDATE);
END;
/
```

✅ 2. COMPOUND TRIGGER

🔹 Compound Trigger — Count late submissions in a bulk DELETE
```sql
-- Table to store statistics
CREATE TABLE late_submission_stats (
    run_date DATE,
    late_count NUMBER
);

-- Compound Trigger on Submission table
CREATE OR REPLACE TRIGGER trg_compound_submission_delete
FOR DELETE ON submission
COMPOUND TRIGGER

    -- Variable to count late submissions
    late_count INTEGER := 0;

    BEFORE STATEMENT IS
    BEGIN
        -- Initialize count
        late_count := 0;
    END BEFORE STATEMENT;

    AFTER EACH ROW IS
    DECLARE
        v_due_date DATE;
    BEGIN
        -- Get the due date of the assignment
        SELECT due_date INTO v_due_date
        FROM assignment
        WHERE assignment_id = :OLD.assignment_id;

        -- Compare submission date (simulated here as part of OLD data)
        IF v_due_date < SYSDATE THEN
            late_count := late_count + 1;
        END IF;
    END AFTER EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        -- Log the late count after all rows are deleted
        INSERT INTO late_submission_stats (run_date, late_count)
        VALUES (SYSDATE, late_count);
    END AFTER STATEMENT;

END trg_compound_submission_delete;
/
```
---
3. Attributes (%TYPE and %ROWTYPE)
   ---
 This step demonstrates the use of %TYPE and %ROWTYPE to improve efficiency and reusability in PL/SQL code

![image](https://github.com/user-attachments/assets/d0a8a5ca-54a6-4989-bd5c-c93c9b8c5f45)

---
4. Package Development
a) Package Specification
The package specification defines reusable procedures for logging audits and updating assignment capacities.
```sql
CREATE OR REPLACE PACKAGE BODY audit_pkg AS
  2    PROCEDURE log_action(p_table IN VARCHAR2, p_operation IN VARCHAR2, p_status IN VARCHAR2) IS
  3    BEGIN
  4      INSERT INTO Audit_Log(user_name, table_name, operation, status)
  5      VALUES(USER, p_table, p_operation, p_status);
  6      COMMIT;  -- ensure audit is persisted
  7    END log_action;
  8  END audit_pkg;
```
b) Package Body
The package body implements the procedures defined in the specification.
```sql
CREATE OR REPLACE PACKAGE BODY audit_pkg AS
  2    PROCEDURE log_action(p_table IN VARCHAR2, p_operation IN VARCHAR2, p_status IN VARCHAR2) IS
  3    BEGIN
  4      INSERT INTO Audit_Log(user_name, table_name, operation, status)
  5      VALUES(USER, p_table, p_operation, p_status);
  6      COMMIT;  -- ensure audit is persisted
  7    END log_action;
  8  END audit_pkg;
  9  /
```
5. Auditing and Restrictions
---
Restriction function
---
```sql
CREATE OR REPLACE FUNCTION is_restricted_day RETURN BOOLEAN AS
  v_day  VARCHAR2(3);
  v_cnt  INTEGER;
BEGIN
  v_day := TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH');
  IF v_day IN ('MON', 'TUE', 'WED', 'THU', 'FRI') THEN
    RETURN TRUE;
  END IF;

  SELECT COUNT(*) INTO v_cnt FROM Holidays WHERE holiday_date = TRUNC(SYSDATE);
  RETURN v_cnt > 0;
END;
/
```
Auditing Package
---
```sql
CREATE OR REPLACE PACKAGE audit_pkg AS
  PROCEDURE log_action(p_table VARCHAR2, p_operation VARCHAR2, p_status VARCHAR2, p_record_id NUMBER);
END;
/

CREATE OR REPLACE PACKAGE BODY audit_pkg AS
  PROCEDURE log_action(p_table VARCHAR2, p_operation VARCHAR2, p_status VARCHAR2, p_record_id NUMBER) IS
  BEGIN
    INSERT INTO Audit_Log (
      Table_Name, Operation, Status, Changed_By, Change_Date, Record_ID
    )
    VALUES (
      p_table, p_operation, p_status, USER, SYSTIMESTAMP, p_record_id
    );
    COMMIT;
  END;
END;
/
```
Audit Log Table
---
```sql
CREATE TABLE Audit_Log (
  Audit_ID     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  Table_Name   VARCHAR2(50),
  Operation    VARCHAR2(10),
  Status       VARCHAR2(10),
  Changed_By   VARCHAR2(50),
  Change_Date  TIMESTAMP DEFAULT SYSTIMESTAMP,
  Record_ID    NUMBER
);
```
✅ Trigger: Restriction + Audit for Submission Table
```sql
CREATE OR REPLACE TRIGGER trg_submissions_restrict_audit
  BEFORE INSERT OR UPDATE OR DELETE ON Submission
  FOR EACH ROW
DECLARE
  v_op   VARCHAR2(10);
  v_stat VARCHAR2(10);
BEGIN
  IF INSERTING THEN v_op := 'INSERT';
  ELSIF UPDATING THEN v_op := 'UPDATE';
  ELSE v_op := 'DELETE';
  END IF;

  IF is_restricted_day THEN
    v_stat := 'DENIED';
    audit_pkg.log_action('SUBMISSION', v_op, v_stat, NVL(:OLD.Submission_ID, :NEW.Submission_ID));
    RAISE_APPLICATION_ERROR(-20001, '✋ DML operations on SUBMISSION are not allowed today.');
  ELSE
    v_stat := 'ALLOWED';
    audit_pkg.log_action('SUBMISSION', v_op, v_stat, NVL(:OLD.Submission_ID, :NEW.Submission_ID));
  END IF;
END;
/
```
🔄 Trigger: Audit Assignment Updates/Deletes
```sql
CREATE OR REPLACE TRIGGER trg_assignment_audit
  AFTER UPDATE OR DELETE ON Assignment
  FOR EACH ROW
DECLARE
  v_op VARCHAR2(10);
BEGIN
  IF UPDATING THEN v_op := 'UPDATE';
  ELSE v_op := 'DELETE';
  END IF;

  audit_pkg.log_action('ASSIGNMENT', v_op, 'ALLOWED', :OLD.Assignment_ID);
END;
/
```
**Scope**

**.Triggers:** Enforce data integrity and automate workflows.

**.Cursors:** Enable efficient row-by-row data processing.

**.Packages:** Group related procedures for better organization and reusability.

**.Auditing:** Improve security and accountability by logging changes to sensitive data.



# 🚀 THIS MARKS THE CONCLUSION OF MY PROJECT


**NAMES**:Jolie SIFA Blandine

**ID:** 26911






















 














 

 
     

 

