-- Assignment 3

-- Q1) Create tables with appropriate constraints

CREATE TABLE DEPARTMENT (
  dcode VARCHAR(10) PRIMARY KEY,
  dept_name VARCHAR(30)
);

CREATE TABLE EMPLOYEE (
  ecode VARCHAR(10) PRIMARY KEY,
  dcode VARCHAR(10) NOT NULL,
  name VARCHAR(30) CHECK (name = UPPER(name)),
  address VARCHAR(40),
  city VARCHAR(20),
  basic DECIMAL(9,2) CHECK (basic >= 5000 AND basic <= 9000),
  grades CHAR(1) CHECK (grades IN ('A', 'B', 'C')),
  doj DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (dcode) REFERENCES DEPARTMENT(dcode)
);

CREATE TABLE LEAVE_REG (
  ecode VARCHAR(10) NOT NULL,
  leave_type CHAR(4) CHECK (leave_type IN ('CL','EL','ML')),
  from_date DATE,
  to_date DATE,
  FOREIGN KEY (ecode) REFERENCES EMPLOYEE(ecode) ON DELETE CASCADE
);

-- Insert sample departments
INSERT INTO DEPARTMENT VALUES ('1', 'Sales');
INSERT INTO DEPARTMENT VALUES ('2', 'Marketing');
INSERT INTO DEPARTMENT VALUES ('3', 'Human Resources');

-- Insert sample employees
INSERT INTO EMPLOYEE (ecode, name, dcode, address, city, basic, grades) 
VALUES ('2', 'JANE SMITH', '2', '456 Elm Avenue', 'Los Angeles', 8000.00, 'B');

INSERT INTO EMPLOYEE (ecode, name, dcode, address, city, basic, grades) 
VALUES ('3', 'SARAH JOHNSON', '1', '789 Oak Lane', 'Chicago', 5000.00, 'C');

INSERT INTO EMPLOYEE (ecode, name, dcode, address, city, basic, doj, grades) 
VALUES ('4', 'MICHAEL BROWN', '2', '987 Pine Street', 'San Francisco', 7500.00, '2022-12-15 09:00:00', 'A');

INSERT INTO EMPLOYEE (ecode, name, dcode, address, city, basic, grades) 
VALUES ('5', 'EMILY WILSON', '3', '654 Maple Avenue', 'Seattle', 8500.00, 'B');

INSERT INTO EMPLOYEE (ecode, name, dcode, address, city, basic, grades) 
VALUES ('6', 'SUMAN GHOSH', '1', '123 Park Street', 'Kolkata', 6000.00, 'A');

-- Insert leave records
INSERT INTO LEAVE_REG (ecode, leave_type, from_date, to_date) 
VALUES ('1', 'CL', '2023-05-28', '2023-05-29');

INSERT INTO LEAVE_REG (ecode, leave_type, from_date, to_date) 
VALUES ('2', 'EL', '2023-06-01', '2023-06-05');

INSERT INTO LEAVE_REG (ecode, leave_type, from_date, to_date) 
VALUES ('3', 'ML', '2023-06-10', '2023-06-20');

-- Q3) View and operations on department 1 employees
CREATE VIEW emp_view AS 
SELECT ecode, name, dcode, basic FROM EMPLOYEE WHERE dcode = '1';

-- Increment BASIC by 100 in view
UPDATE emp_view SET basic = basic + 100;

-- Check updated view
SELECT * FROM emp_view;

-- Drop the view
DROP VIEW emp_view;

-- Q4) Create view joining EMPLOYEE, DEPARTMENT, LEAVE_REG
CREATE VIEW emp_leave_view AS
SELECT e.ecode, d.dept_name, e.basic, lr.leave_type, lr.from_date, lr.to_date
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.dcode = d.dcode
JOIN LEAVE_REG lr ON e.ecode = lr.ecode;

-- Check view content
SELECT * FROM emp_leave_view;

-- Drop the view
DROP VIEW emp_leave_view;

-- Q5) Create table with EMPs from department 1 with BASIC >= 7000
CREATE TABLE emp_summary AS 
SELECT e.ecode, e.name, d.dept_name, e.basic 
FROM EMPLOYEE e 
JOIN DEPARTMENT d ON e.dcode = d.dcode 
WHERE e.dcode = '1' AND e.basic >= 7000;

-- Add net_pay column
ALTER TABLE emp_summary ADD COLUMN net_pay FLOAT NOT NULL;

-- Fill net_pay = 1.5 * BASIC
UPDATE emp_summary SET net_pay = basic * 1.5;

-- Q6) Drop all tables
DROP TABLE IF EXISTS LEAVE_REG;
DROP TABLE IF EXISTS emp_summary;
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS DEPARTMENT;
