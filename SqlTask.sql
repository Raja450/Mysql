create database task;
use task;
CREATE TABLE 'job' (
  'id' INT NOT NULL AUTO_INCREMENT, 
  'name' VARCHAR(50), 
  'min_salary' DECIMAL(15, 2), 
  'max_salary' DECIMAL(15, 2), 
  PRIMARY KEY ('id')
);
insert into job(
  'id', 'name', 'min_salary', 'max_salary'
) 
values 
  (
    1, 'Software Developer', 15000.00, 
    18000.00
  ), 
  (
    2, 'IOS Developer', 16000.00, 19000.00
  ), 
  (
    3, 'Application Developer', 14000.00, 
    17000.00
  ), 
  (4, 'Tester', 12000.00, 16000.00);
CREATE TABLE 'country' (
  'id' INT NOT NULL AUTO_INCREMENT, 
  'name' VARCHAR(50), 
  PRIMARY KEY ('id')
);
insert into country('id', 'name') 
values 
  (1, 'India'), 
  (2, 'Australia'), 
  (3, 'UK'), 
  (4, 'US');
CREATE TABLE 'department' (
  'i' d INT NOT NULL AUTO_INCREMENT, 
  'name' VARCHAR(50), 
  'fk_country_id' INT, 
  FOREIGN KEY ('fk_country_id') REFERENCES country ('id'), 
  PRIMARY KEY ('id')
);
insert into department('id', 'name', 'fk_country_id') 
values 
  (1, 'CSE', 1), 
  (2, 'ME', 2), 
  (3, 'Computer', 4), 
  (4, 'Science', 3);
CREATE TABLE 'employee' (
  'id' INT NOT NULL AUTO_INCREMENT, 
  'first_name' VARCHAR(50), 
  'last_name' VARCHAR(50), 
  'email' VARCHAR(50), 
  'salary' DECIMAL(15, 2), 
  'fk_department_id' INT, 
  'fk_job_id' INT, 
  FOREIGN KEY ('fk_department_id') REFERENCES department ('id'), 
  FOREIGN KEY ('fk_job_id') REFERENCES job ('id'), 
  PRIMARY KEY ('id')
);
insert into employee(
  'id', 'first_name', 'last_name', 'email', 
  'salary', 'fk_department_id', 'fk_job_id'
) 
values 
  (
    1, 'Raj', 'sah', 'raj@78gamail.com', 
    17000, 1, 2
  ), 
  (
    2, 'Bikash', 'Kumar', 'bikash@79gamail.com', 
    16000, 2, 1
  ), 
  (
    3, 'Deepak', 'Kumar', 'deepak@75gamail.com', 
    15000, 3, 3
  ), 
  (
    4, 'Ra', 'kumar', 'ra@48gamail.com', 
    14000, 4, 4
  );
/*Get all job name and department name in single query*/
SELECT 
  j1.name as Name 
FROM 
  job as j1 
UNION 
SELECT 
  d1.name 
FROM 
  department as d1;
/* Get 2nd highest salary of the employee*/
SELECT 
  MAX(salary) as 2nd_highest_salary 
FROM 
  employee 
WHERE 
  salary < (
    SELECT 
      MAX(salary) 
    FROM 
      employee
  );
/* get name (firstname + lastname), department name, country name, job name*/
SELECT 
  e1.first_name AS First_Name, 
  e1.last_name AS Last_Name, 
  d1.name AS Department_Name, 
  c1.name AS Country_Name, 
  j1.name AS Job_Name 
FROM 
  employee As e1 
  INNER JOIN department as d1 ON d1.id = e1.fk_department_id 
  INNER JOIN country as c1 ON c1.id = d1.fk_country_id 
  INNER JOIN job as j1 ON j1.id = e1.fk_job_id 
ORDER BY 
  e1.id;
