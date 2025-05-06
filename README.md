
---

<p align="center">
  <a href="https://github.com/Jolie123-si/DUEMATE/actions"><img src="https://img.shields.io/github/actions/workflow/status/Jolie123-si/DUEMATE/ci.yml?branch=main&logo=github&style=flat" alt="CI"></a>
  <a href="https://www.oracle.com/database/technologies/appdev/plsql.html"><img src="https://img.shields.io/badge/PL%2FSQL-Oracle-blue?style=for-the-badge&logo=oracle" alt="PL/SQL"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-brightgreen?style=for-the-badge" alt="License: MIT"></a>
</p>

# 🎓 DUEMATE: Assignment Management System

**Capstone Project – Adventist University of Central Africa (AUCA)**
**Course:** INSY 8311 – Database Development with PL/SQL
**Student:** Jolie SIFA BLANDINE (ID 26911)
**Instructor:** Eric MANIRAGUHA

---

## 📑 Table of Contents

1. 🚀 Project Overview
2. 🧐 Phase I: Problem Statement
3. 📊 Phase II: Logical Data Model
4. 🏗️ Phase III: Table Implementation & Data Insertion
5. 🔄 Phase IV: Database Interaction & Transactions
6. 🔐 Phase V: Advanced Programming & Auditing
7. ⚙️ Installation & Setup
8. ▶️ Usage Examples
9. 💡 Skills & Tools
10. 📬 Contact & License

---

## 🚀 Project Overview

DUEMATE is a centralized, PL/SQL-driven Assignment Management System that:

* 📋 Empowers **students** to view, organize, and submit assignments with automated reminders
* 🧑‍🏫 Enables **instructors** to create tasks, track submissions, and deliver feedback
* 🏫 Provides **institutions** with dashboards and audit trails to monitor engagement

It streamlines academic workflows, enforces deadlines, and maintains data integrity and security.

---

## 🧐 Phase I: Problem Statement

* **Problem:** Manual assignment workflows lead to missed deadlines, lost submissions, and poor feedback loops
* **Solution:** Automate assignment tracking, deadline reminders, and communication via a PL/SQL-based system
* **Deliverable:** Documented scope, objectives, target users, and expected benefits

---
## 💼 PHASE 2: Business Process Modeling

**Focus:** Defining and visualizing the end-to-end course management workflow.

- ⚡ **Scope:**  
  Centralize course management tasks—attendance, assignments, grading—into a single, cohesive platform.

- 🎯 **Objectives:**  
  - Automate attendance tracking  
  - Simplify grading workflows  
  - Provide real-time performance dashboards

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
  Department, Lecturer, Course, Student, Assignment, Submission, Grade, Attendance

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
ADMIN USER sifa_admin IDENTIFIED BY YourPassword123
FILE_NAME_CONVERT = ('C:\app\CIOOL\product\21c\oradata\XE\pdbseed',
'C:\app\CIOOL\product\21c\oradata\XE\TUE_26911_SIFA_DUEMATE_DB/');

-- Step 2: Open the Pluggable Database

ALTER PLUGGABLE DATABASE TUE_26911_SIFA_DUEMATE OPEN;
```
The result should be like this
![image](https://github.com/user-attachments/assets/7d1c66a1-e087-48e5-9dd2-9cf648acb63f)

After this you should configure the Service Name through Net configuration assissant.

ORACLE ENTERPRISE MANAGER:
HomePage
![image](https://github.com/user-attachments/assets/a2fb99e1-d410-42be-83d0-d743db7c0ae0)
TableSpace
![image](https://github.com/user-attachments/assets/e8367b7c-a14d-4adc-add5-3ba15d5bb396)

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
For the purpose of keeping the readme short, we chose to use few example to demostrate the insertion of data in our Tables.
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










 














 

 
     

 

## 📬 Contact & License

Jolie SIFA BLANDINE – [GitHub](https://github.com/Jolie123-si) • [LinkedIn](https://linkedin.com/in/sifa-jolly-blandine-02076130a/)
Licensed under the **MIT License**.
