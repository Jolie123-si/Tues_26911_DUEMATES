## 💼 Phase II: Business Process Modeling – DUEMATE

---

### 📌 1. Scope Definition

**DUEMATE** streamlines assignment management by automating key academic workflows: assigning, submitting, tracking, reviewing, and grading. It enhances efficiency, promotes real-time communication, and enables data-driven decision-making in education. The system aligns with Management Information Systems (MIS) goals through:

- Automated processes  
- Centralized control  
- Performance tracking and reporting  

---

### 🎯 Objectives

- ✅ Streamline the assignment submission process for students.
- ✅ Enable instructors to assign tasks, track submissions, and provide timely feedback.
- ✅ Improve assignment completion and on-time submission rates.
- ✅ Enhance communication between instructors and students.
- ✅ Generate dashboards and reports for academic tracking and performance decisions.

---

### 🎯 Expected Outcomes

- 📈 Increased on-time assignment submissions.  
- 📚 Improved organization and task clarity for students.  
- 🧑‍🏫 Better workload and deadline management for instructors.  
- 📊 Enhanced visibility into academic performance for institutions.

---

### 🧩 2. Key Entities & Their Roles

| Entity     | Responsibilities                                                                 |
|------------|------------------------------------------------------------------------------------|
| **Student**    | Views assignments, sets reminders, uploads submissions, monitors progress.      |
| **Instructor** | Creates tasks, sets deadlines, tracks student work, gives feedback and grades. |
| **Assignment** | Centralized tasks, with deadlines, reminders, and progress tracking.           |
| **Submission** | Handles upload and status of student assignment submissions.                   |
| **Reminder**   | Sends automatic alerts for upcoming or overdue assignments.                    |

---

### 🏊‍♂️ 3. Swimlane BPMN Diagram Summary

_The following process diagram outlines the assignment management flow across instructors, students, and system automation._

📌 **Main Components and Interactions**:

1. **Instructor** creates and publishes a new assignment.
2. Sets submission deadline.
3. System distributes the assignment to students.

🧑‍🎓 **Student Activities**:

- Receives and views the assignment.
- Works on either **Part 1**, **Part 2**, or both.
- Uploads the completed assignment.

📥 **Post Submission Flow**:

- Instructor receives and reviews the submission.
- System:
  - Marks as **graded**.
  - Creates a database record of the uploaded file.
  - Marks late if deadline was missed.

⏰ **Reminders**:

- System sends initial reminder before due date.
- Sends a final reminder if submission is not done.

📝 **Grading & Completion**:

- Instructor grades the assignment.
- Grade is sent to the student.
- Student views the grade.
- ✔️ **Process ends** once the grade is acknowledged.

---

> 📌 _This phase models the entire assignment life cycle and sets the groundwork for implementing system logic using PL/SQL in upcoming phases._

