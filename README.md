
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

<details>
<summary>📊 Process Diagram</summary>

![Phase 2 – BPMN Diagram]![image](https://github.com/user-attachments/assets/56644817-ef6c-4e39-8012-02fbf2cc1219)
  
*Figure: Business Process Model for course management.*
</details>

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

<details>
<summary>📈 ER Diagram</summary>

![Phase 3 – ER Diagram]![image](https://github.com/user-attachments/assets/c7961a32-5699-457c-b724-a0dfab561c59)
  
*Figure: Logical data model for the course management system.*
</details>

---

> Together, Phase 2 and Phase 3 provide a clear blueprint—from workflow to database design—for a robust course management system that enhances educational outcomes while supporting MIS goals.  




 

 
     

 

## 📬 Contact & License

Jolie SIFA BLANDINE – [GitHub](https://github.com/Jolie123-si) • [LinkedIn](https://linkedin.com/in/sifa-jolly-blandine-02076130a/)
Licensed under the **MIT License**.
