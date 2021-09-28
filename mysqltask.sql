 /*create database employee */
 create database employee
 /*use database employee*/
 use employee

 /*create table hobby*/
 
 CREATE TABLE hobby(
 hobby_id int NOT NULL AUTO_INCREMENT,
 hobby_Name varchar(55),
 /*create primary key*/
 PRIMARY KEY (hobby_id)
 );
 /*select query*/
 select *from hobby;
 
 /* Inset in hobby*/
 insert into hobby(hobby_id,hobby_Name)
 values(1,'Cricket');
 insert into hobby(hobby_id,hobby_Name)
 values(2,'Fotball');
 insert into hobby(hobby_id,hobby_Name)
 values(3,'Coding');
 insert into hobby(hobby_id,hobby_Name)
 values(4,'Traveling');
 
 /*select query*/
 select *from hobby;
 
 /* create table employee*/
 CREATE TABLE employee (
 employee_id int NOT NULL AUTO_INCREMENT,
 first_name varchar(50),
 last_name varchar(50),
 age int,
 mobile_number varchar(15),
 address varchar(50),
 /*create primary key*/
 PRIMARY KEY (employee_id)
 );
 /*select query*/
 select * from employee;
      
 /*Insert in employee*/
  
 insert into employee(employee_id,first_name,last_name,age,mobile_number,address)
 values(1,'Rak','Kumar',20,'7894561230','Kolkata');
 insert into employee(employee_id,first_name,last_name,age,mobile_number,address)
 values(2,'Ra','Kuar',21,'8894561230','delhi');
 insert into employee(employee_id,first_name,last_name,age,mobile_number,address)
 values(3,'Raj','Kar',30,'9894561230','Pune');
 insert into employee(employee_id,first_name,last_name,age,mobile_number,address)
 values(4,'Rk','mar',40,'8794561230','Mumbai');
 
 
 
 /*create table employe_salary*/
 CREATE TABLE employee_salary (
 id int NOT NULL AUTO_INCREMENT,
 employee_id int,
 salary decimal(15,2),
 date DATE,
 /*creating primary key*/
 PRIMARY KEY (id)

 );
 /*create foreign key*/
 ALTER TABLE employee_salary
 ADD FOREIGN KEY (employee_id) REFERENCES employee(employee_id); 
  
 /*Insert in employee_salary*/
 insert into employee_salary (id,employee_id,salary,date)
 values(1,1,5000.00,'2008-11-11');
 insert into employee_salary (id,employee_id,salary,date)
 values(2,3,6000.00,'2021-11-21');
 insert into employee_salary (id,employee_id,salary,date)
 values(3,2,7000.00,'2021-10-01');
 insert into employee_salary (id,employee_id,salary,date)
 values(4,4,8000.00,'2021-01-02');

 /*select query*/
 select * from employee_salary;




 
 /*create table employee_hobby*/
 CREATE TABLE   employee_hobby (
 h_id int NOT NULL AUTO_INCREMENT,
 hobby_id int,
 employee_id int,
 
 /*creating primarykey*/
 PRIMARY KEY (h_id)

 ); 
 /*create foreign key*/
 ALTER TABLE  employee_hobby
 ADD FOREIGN KEY (hobby_id) REFERENCES hobby(hobby_id); 
 /*foreign key*/
 ALTER TABLE  employee_hobby
 ADD FOREIGN KEY (employee_id) REFERENCES employee(employee_id); 
 /*insert in employee_hobby*/
 insert into employee_hobby (h_id,hobby_id,employee_id)
 values(1,1,1);
 insert into employee_hobby (h_id,hobby_id,employee_id)
 values(2,1,1);
 insert into employee_hobby (h_id,hobby_id,employee_id)
 values(3,2,1);
 insert into employee_hobby (h_id,hobby_id,employee_id)
 values(4,2,2);
 insert into employee_hobby (h_id,hobby_id,employee_id)
 values(5,3,3);
 
 /*select query*/
 select * from employee_hobby;

 /*Updation of hobby table*/

 UPDATE hobby
 SET hobby_Name='Hockey'
 WHERE hobby_id=1;

 /*update hobby table*/
 UPDATE hobby
 SET hobby_Name='Learning'
 WHERE hobby_id=2;
 select * from hobby;

 /*Update employee table*/
 UPDATE employee
 SET first_name='Bikash'
 WHERE employee_id=2;

 /*update employee table*/
 UPDATE employee
 SET age=26
 WHERE employee_id=4;

 /*update employee table*/
 UPDATE employee
 SET age=16
 WHERE employee_id=1;

 /*Update employee_salary table*/
 UPDATE employee_salary
 SET salary=10000
 WHERE employee_id=2;

 /*update employe_salary*/
 UPDATE employee_salary
 SET salary=3785
 WHERE id=2;

 /*select query*/
 select *from employee_salary;

 /*delete from hobby*/
 SET FOREIGN_KEY_CHECKS=0; 
 delete from hobby where hobby_Name='Hockey';
 delete from hobby where hobby_Name='football';
 SET FOREIGN_KEY_CHECKS=1;
 
 /*delete query employee_salary*/

 DELETE FROM  employee_salary where salary=3875;
 DELETE FROM  employee_salary where salary=7000;

 /* delete from employee*/
 SET FOREIGN_KEY_CHECKS=0; 
 DELETE FROM  employee where employee_id=1;
 DELETE FROM  employee where employee_id=2;
 SET FOREIGN_KEY_CHECKS=1;

 /*delete from employee_hobby*/
 DELETE FROM employee_hobby where h_id=1;
 DELETE FROM employee_hobby where h_id=2;

 /*seperate select query*/
 select * from hobby;

 select *from employee;

 select * from employee_salary;

 select * from employee_hobby;

 /*select quey*/
 select first_name,last_name from employee;
 /*select query*/
 select hobby_Name from hobby;
 /*select query*/
 select salary from employee_salary;
 