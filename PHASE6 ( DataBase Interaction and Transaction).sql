
-- INSERT: Add a new student
INSERT INTO Student VALUES (104, 'Tom Rukundo', 'tom@auca.rw', 'IT', '0788123456');

-- UPDATE: Change assignment title
UPDATE Assignment
SET title = 'Updated PL/SQL Assignment'
WHERE assignment_id = 202;

-- DELETE: Remove a reminder
DELETE FROM Reminder
WHERE reminder_id = 402;

 