
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

## 📊 Phase II: Logical Data Model

* **Entities:** `Student`, `Instructor`, `Assignment`, `Submission`, `Reminder`
* **Attributes & Keys:**

  * `Student(student_id PK, name, email UNQ, program, phone_number)`
  * `Instructor(instructor_id PK, name, email UNQ, phone_number)`
  * `Assignment(assignment_id PK, title UNQ, subject, due_date, instructor_id FK)`
  * `Submission(submission_id PK, assignment_id FK, student_id FK, submission_date, status, grade)`
  * `Reminder(reminder_id PK, assignment_id FK, student_id FK, reminder_date, method)`
* **Normalization:** 3NF, with `NOT NULL`, `UNIQUE`, and `CHECK` constraints applied

<details>
<summary>📈 View ER Diagram</summary>

![ER Diagram](./screenshots/er_diagram.png)

</details>

---

## 🏗️ Phase III: Table Implementation & Data Insertion

**Table Definitions**

```sql
CREATE TABLE Student (
  student_id    INT PRIMARY KEY,
  name          VARCHAR2(100) NOT NULL,
  email         VARCHAR2(100) UNIQUE NOT NULL,
  program       VARCHAR2(100) NOT NULL,
  phone_number  VARCHAR2(15)  UNIQUE NOT NULL
);
```

**Sample Data**

```sql
INSERT INTO Student VALUES (
  101, 'Jolie Sifa Blandine', 'sifa@auca.rw',
  'Software Engineering', '0788111222'
);
```

*(Repeat similar DDL/DML for `Instructor`, `Assignment`, `Submission`, `Reminder`.)*

---

## 🔄 Phase IV: Database Interaction & Transactions

* **JOIN Queries**

  ```sql
  SELECT s.name, a.title
    FROM Student s
    JOIN Submission sub ON s.student_id = sub.student_id
    JOIN Assignment a ON sub.assignment_id = a.assignment_id;
  ```
* **PL/SQL Packages**

  * `duemate_pkg.show_student_submissions(p_student_id)`
  * `duemate_pkg.get_submission_count(p_student_id)`
* **Error Handling:** Routines include exception blocks to log issues.

---

## 🔐 Phase V: Advanced Programming & Auditing

* **Restriction Logic:** Prevent DML on weekdays & public holidays via `Holidays` table + `is_restricted_day()` function
* **Trigger Example**

  ```sql
  CREATE OR REPLACE TRIGGER trg_block_submission
    BEFORE INSERT OR UPDATE OR DELETE ON Submission
    FOR EACH ROW
  BEGIN
    IF is_restricted_day THEN
      RAISE_APPLICATION_ERROR(-20001,
        'DML blocked on restricted days.');
    END IF;
  END;
  ```
* **Audit Table:** Captures user, timestamp, operation, status, and table name.

---

## ⚙️ Installation & Setup

```bash
git clone https://github.com/Jolie123-si/DUEMATE.git
cd DUEMATE

# Run scripts (as SYSDBA)
sqlplus sys/YourPwd@XE AS SYSDBA @sql/create_tables.sql
sqlplus sys/YourPwd@XE AS SYSDBA @sql/insert_data.sql
sqlplus sys/YourPwd@XE AS SYSDBA @sql/packages_and_procs.sql
sqlplus sys/YourPwd@XE AS SYSDBA @sql/triggers_and_audit.sql
```

---

## ▶️ Usage Examples

* **Show student submissions:**

  ```sql
  EXEC duemate_pkg.show_student_submissions(101);
  ```
* **Count submissions:**

  ```sql
  SELECT duemate_pkg.get_submission_count(101) AS total FROM dual;
  ```

---

## 💡 Skills & Tools

* **PL/SQL:** Procedures, functions, packages, triggers
* **Data Modeling:** ERD design, 3NF normalization
* **SQL:** Advanced JOINs, constraints, indexes
* **Auditing:** Trigger-based restrictions, audit logging
* **CI/CD:** GitHub Actions
* **Diagramming:** Lucidchart, Draw\.io

---

## 📬 Contact & License

Jolie SIFA BLANDINE – [GitHub](https://github.com/Jolie123-si) • [LinkedIn](https://linkedin.com/in/sifa-jolly-blandine-02076130a/)
Licensed under the **MIT License**.
