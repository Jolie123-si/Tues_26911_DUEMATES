
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