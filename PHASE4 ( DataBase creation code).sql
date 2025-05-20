-- Step 1: Create the Pluggable Database (PDB)

CREATE PLUGGABLE DATABASE TUE_26911_SIFA_DUEMATE_DB
ADMIN USER sifa_admin IDENTIFIED BY YourPassword123
FILE_NAME_CONVERT = ('C:\app\CIOOL\product\21c\oradata\XE\pdbseed',
'C:\app\CIOOL\product\21c\oradata\XE\TUE_26911_SIFA_DUEMATE_DB/');

-- Step 2: Open the Pluggable Database

ALTER PLUGGABLE DATABASE TUE_26911_SIFA_DUEMATE OPEN;