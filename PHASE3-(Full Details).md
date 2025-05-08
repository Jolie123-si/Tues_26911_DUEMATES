## 🏗️ Phase III: Logical Data Model – DUEMATE

---

### 🎯 Focus

This phase focuses on **translating the business process** of DUEMATE into a fully normalized and relational database structure. The schema is designed to be robust, 3NF-compliant, and optimized for both academic tracking and administrative efficiency.

---

### 👌 Core Entities

The database design is centered around the following key entities:

- **Department** – Academic units offering various courses.
- **Lecturer** – Instructors responsible for managing courses and grading assignments.
- **Course** – Subjects taught by lecturers and taken by students.
- **Student** – Individuals enrolled in academic programs, receiving and submitting assignments.
- **Assignment** – Tasks created by lecturers to evaluate student understanding.
- **Submission** – Work submitted by students for a given assignment.
- **Grade** – Evaluation and scoring of a submission.
- **Attendance** – Records of student presence in specific course sessions.

---

### 🧬 Relationships

The schema incorporates strong relational integrity using **primary and foreign keys**:

- 📚 `Students` are enrolled in `Courses`, which are taught by `Lecturers`.
- 📝 `Assignments` belong to `Courses`, and `Students` submit `Submissions` for them.
- ✅ `Grades` are awarded per `Submission`, per `Student`.
- 📅 `Attendance` links each `Student` to a class session in a specific `Course`.

---

### 🧠 Design Goals

- ✔️ **Normalize** the schema to at least **3rd Normal Form (3NF)** to eliminate redundancy.
- ✔️ Enforce **referential integrity** using `PK`/`FK` constraints.
- ✔️ Optimize for **query performance** related to:
  - Student progress tracking
  - Assignment completion rates
  - Lecturer workload
- ✔️ Support future scalability and MIS reporting features.

---

### 📊 Example Logical Relationships

| Table        | Primary Key         | Foreign Keys                                         |
|--------------|---------------------|------------------------------------------------------|
| `Student`    | `Student_ID`        | `Department_ID`                                      |
| `Lecturer`   | `Lecturer_ID`       | `Department_ID`                                      |
| `Course`     | `Course_ID`         | `Lecturer_ID`, `Department_ID`                       |
| `Assignment` | `Assignment_ID`     | `Course_ID`                                          |
| `Submission` | `Submission_ID`     | `Student_ID`, `Assignment_ID`                        |
| `Grade`      | `Grade_ID`          | `Student_ID`, `Assignment_ID`                        |
| `Attendance` | `Attendance_ID`     | `Student_ID`, `Course_ID`, `Attendance_Date`         |

---

> 📌 _This phase lays the structural foundation of DUEMATE’s database, ensuring it can handle real-world academic workflows with consistency and accuracy._

