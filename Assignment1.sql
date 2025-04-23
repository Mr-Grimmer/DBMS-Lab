-- Routine Management System SQL Script

-- DROP TABLES FIRST (To avoid conflicts when re-running)
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Routine CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Class CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE StudentGroup CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Teacher CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- TEACHER Table
CREATE TABLE Teacher (
    teacher_id NUMBER PRIMARY KEY,
    short_name VARCHAR2(10) UNIQUE
);

-- STUDENT_GROUP Table
CREATE TABLE StudentGroup (
    group_id NUMBER PRIMARY KEY,
    group_name VARCHAR2(10) UNIQUE
);

-- CLASS Table
CREATE TABLE Class (
    class_id NUMBER PRIMARY KEY,
    subject_name VARCHAR2(100),
    class_type VARCHAR2(10),
    day VARCHAR2(10),
    time_slot VARCHAR2(20),
    room VARCHAR2(50)
);

-- ROUTINE Table
CREATE TABLE Routine (
    routine_id NUMBER PRIMARY KEY,
    class_id NUMBER REFERENCES Class(class_id),
    teacher_id NUMBER REFERENCES Teacher(teacher_id),
    group_id NUMBER REFERENCES StudentGroup(group_id)
);

-- TEACHERS
INSERT INTO Teacher VALUES (1, 'VL');
INSERT INTO Teacher VALUES (2, 'RS');
INSERT INTO Teacher VALUES (3, 'SKN');
INSERT INTO Teacher VALUES (4, 'UM');
INSERT INTO Teacher VALUES (5, 'DS');
INSERT INTO Teacher VALUES (6, 'ASa');
INSERT INTO Teacher VALUES (7, 'CCh');
INSERT INTO Teacher VALUES (8, 'DB');
INSERT INTO Teacher VALUES (9, 'SuB');

-- STUDENT GROUPS
INSERT INTO StudentGroup VALUES (1, 'A1');
INSERT INTO StudentGroup VALUES (2, 'A2');

-- CLASSES
INSERT INTO Class VALUES (1, 'Advanced Programming', 'Theory', 'Monday', '11:00-12:00', 'CC-5-11');
INSERT INTO Class VALUES (2, 'Operating System', 'Theory', 'Monday', '12:00-01:00', 'CC-5-11');
INSERT INTO Class VALUES (3, 'Computer Org. and Arch.', 'Theory', 'Monday', '01:00-02:00', 'CC-5-11');
INSERT INTO Class VALUES (4, 'Operating System Lab', 'Lab', 'Monday', '03:30-04:30', 'Arch Lab');
INSERT INTO Class VALUES (5, 'Advanced Programming Lab', 'Lab', 'Monday', '03:30-04:30', 'PC Lab-I');
INSERT INTO Class VALUES (6, 'DBMS Lab', 'Lab', 'Tuesday', '11:00-01:00', 'Alpha Lab');
INSERT INTO Class VALUES (7, 'Operating System Lab', 'Lab', 'Tuesday', '11:00-01:00', 'Arch Lab');
INSERT INTO Class VALUES (8, 'Database Management Systems', 'Theory', 'Tuesday', '02:30-03:30', 'CC-5-11');
INSERT INTO Class VALUES (9, 'Computer Organization and Architecture', 'Theory', 'Wednesday', '11:00-12:00', 'CC-5-11');
INSERT INTO Class VALUES (10, 'Data Structure and Algorithm', 'Theory', 'Wednesday', '12:00-01:00', 'CC-5-11');
INSERT INTO Class VALUES (11, 'Advanced Programming Lab', 'Lab', 'Wednesday', '03:30-04:30', 'PC Lab-I');
INSERT INTO Class VALUES (12, 'Data Structure and Algorithm Lab', 'Lab', 'Thursday', '11:00-01:00', 'Arch Lab');
INSERT INTO Class VALUES (13, 'DBMS Lab', 'Lab', 'Thursday', '11:00-01:00', 'Magnum Lab');
INSERT INTO Class VALUES (14, 'Operating System', 'Theory', 'Thursday', '02:30-03:30', 'CC-5-11');
INSERT INTO Class VALUES (15, 'Adv. Prog. (Java & Python)', 'Theory', 'Friday', '11:00-12:00', 'CC-5-11');
INSERT INTO Class VALUES (16, 'Data Structure and Algorithm', 'Theory', 'Friday', '12:00-01:00', 'CC-5-11');
INSERT INTO Class VALUES (17, 'Data Structure and Algorithm Lab', 'Lab', 'Friday', '02:30-04:30', 'Arch Lab');

-- ROUTINE
INSERT INTO Routine VALUES (1, 1, 7, 1);
INSERT INTO Routine VALUES (2, 2, 1, 1);
INSERT INTO Routine VALUES (3, 3, 2, 1);
INSERT INTO Routine VALUES (4, 4, 5, 1);
INSERT INTO Routine VALUES (5, 5, 6, 2);
INSERT INTO Routine VALUES (6, 6, 5, 1);
INSERT INTO Routine VALUES (7, 7, 1, 2);
INSERT INTO Routine VALUES (8, 8, 5, 1);
INSERT INTO Routine VALUES (9, 9, 2, 1);
INSERT INTO Routine VALUES (10, 10, 3, 1);
INSERT INTO Routine VALUES (11, 11, 7, 1);
INSERT INTO Routine VALUES (12, 12, 9, 1);
INSERT INTO Routine VALUES (13, 13, 4, 2);
INSERT INTO Routine VALUES (14, 14, 1, 1);
INSERT INTO Routine VALUES (15, 15, 6, 1);
INSERT INTO Routine VALUES (16, 16, 3, 1);
INSERT INTO Routine VALUES (17, 17, 9, 2);

COMMIT;
