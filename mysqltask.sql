/*create database employee*/
create 'database employee';
use employee;
CREATE TABLE 'hobby'(
  'id' int NOT NULL AUTO_INCREMENT, 
  'hobby_Name' varchar(55), 
  PRIMARY KEY ('id')
);
select 
  * 
from 
  hobby;
/* Inset in hobby */
insert into hobby('id',' hobby_Name') 
values 
  ('1', 'Cricket'), 
  ('2', 'Football'), 
  ('3', 'Hockey'), 
  ('4', 'Coding');
select 
  * 
from 
  hobby;
/*create table employee*/
CREATE TABLE 'employee' (
  'id' int NOT NULL AUTO_INCREMENT, 
  'first_name' varchar(50), 
  'last_name' varchar(50), 
  'age' int, 
  'mobile_number' varchar(15), 
  'address' varchar(50), 
  PRIMARY KEY ('id')
);
/* insert in emplyoyee*/
insert into 'employee'(
  'id', 'first_name', 'last_name', 'age', 'mobile_number', 
  'address'
) 
values 
  (
    '1', 'Raja', 'Sah', '20', '7894561230', 
    'Kolkata'
  ), 
  (
    '2', 'Bikash', 'Singh', '21', '9894561230', 
    'Kolkata'
  ), 
  (
    '3', 'Deepak', 'Singh', '22', '8894561230', 
    'Kolkata'
  ), 
  (
    '4', 'Rahul', 'Kumar', '23', '7794561230', 
    'Kolkata'
  );
select 
  * 
from 
  'employee';
/*create table employee*/
CREATE TABLE 'employee_salary' (
  'id' int NOT NULL AUTO_INCREMENT, 
  'fk_employee_id' int, 
  'salary' decimal('15', '2'), 
  FOREIGN KEY ('fk_employee_id') REFERENCES 'employee'('id'), 
  'date' DATE, 
  PRIMARY KEY ('id')
);
/* insert in employee_salary*/
insert into 'employee_salary'('id', 'fk_employee_id', 'salary', 'date') 
values 
  ('1', '1', '15000.00', '2021-11-11'), 
  ('2', '2', '10000.00', '2021-11-11'), 
  ('3', '3', '12000.00', '2021-11-11'), 
  ('4', '4', '16000.00', '2021-11-11');
/*create table employee_hobby*/
CREATE TABLE 'employee_hobby' (
  'id' int NOT NULL AUTO_INCREMENT, 
  'fk_employee_id' int, 
  'fk_hobby_id' int, 
  FOREIGN KEY ('fk_employee_id') REFERENCES 'employee'('id'), 
  FOREIGN KEY ('fk_hobby_id') REFERENCES hobby('id'), 
  PRIMARY KEY ('id')
);
/*insert in employee_hobby*/
insert into 'employee_hobby'('id', 'fk_employee_id', 'fk_hobby_id') 
values 
  ('1', '2', '1');
select 
  * 
from 
  'employee_hobby';
/*Updation of hobby table*/
UPDATE 
  'hobby' 
SET 
  'hobby_Name' = 'Traveling' 
WHERE 
  'id' = 1;
/*Update employee table*/
UPDATE 
  'employee' 
SET 
  'first_name' = 'Shiv' 
WHERE 
  'id' = '2';
/*Update employee_salary table*/
UPDATE 
  'employee_salary' 
SET 
  'salary' = '18000' 
WHERE 
  'id' = '2';
/*delete from hobby*/
delete from 
  'hobby' 
where 
  'hobby_Name' = 'Hockey';
delete from 
  'hobby' 
where 
  'hobby_Name' = 'football';
/*delete query employee_salary*/
DELETE FROM 
  'employee_salary' 
where 
  'salary' = '3875';
DELETE FROM 
  'employee_salary' 
where 
  'salary' = '7000';
/* delete from employee*/
DELETE FROM 
  'employee' 
where 
  'employee_id' = '1';
DELETE FROM 
  'employee' 
where 
  'employee_id' = '2';
/*delete from employee_hobby*/
DELETE FROM 
  'employee_hobby' 
where 
  'h_id' = '1';
DELETE FROM 
  'employee_hobby' 
where 
  'h_id' = '2';
/*seperate select query*/
select 
  * 
from 
  'hobby';
select 
  * 
from 
  'employee';
select 
  * 
from 
  'employee_salary';
select 
  * 
from 
  'employee_hobby';
/*first query*/
select 
  employee.'first_name', 
  employee.'last_name', 
  hobby.'hobby_Name' 
from 
  employee 
  left join hobby on employee.'id' = hobby.'id' 
order by 
  employee.'first_name', 
  employee.'last_name';
/*2n query*/
select 
  employee.'first_name', 
  employee.'last_name', 
  employee_salary.'salary' 
from 
  employee 
  left join employee_salary on employee.'id' = employee_salary.'fk_employee_id' 
order by 
  employee.'first_name', 
  employee.'last_name';
/*3rd query*/
select 
  employee.'first_name', 
  employee.'last_name', 
  (
    select 
      hobby.'hobby_Name' 
    from 
      employee_hobby 
      left join hobby on hobby.'id' = employee_hobby.'fk_hobby_id' 
    where 
      employee_hobby.'fk_hobby_id' = employee.'id'
  ) as hobby, 
  sum('salary') as salary 
FROM 
  employee_salary 
  left join employee on employee_salary.'fk_employee_id' = employee.'id' 
group by 
  employee.'id';