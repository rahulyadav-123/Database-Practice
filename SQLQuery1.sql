				--------------DDL------------
create database mydatabase
use mydatabase
select * from sys.databases
create table employee
(
	emp_id int identity(1,1) primary key ,
	emp_name varchar(55) ,
	emp_salary int ,
	start_date datetime
	)

select * from employee
alter table employee add emp_address varchar(45) not null
insert into employee(emp_name,emp_salary,start_date,emp_address)values
('Rahul',30000,GETDATE(),'Mumbai')

drop table employee

create table employee
(	
		emp_id int identity(1,1) primary key,
		emp_name varchar(55),
		emp_salary int,
		emp_address varchar(55),
		start_date datetime
		)
			----------DQL---------
select * from employee

			----------DML---------
insert into employee(emp_name,emp_salary,emp_address,start_date)values('Rahul',200000,'Pune',GETDATE())
insert into employee(emp_name,emp_salary,emp_address,start_date)values('Rohit',700000,'Mumbai',GETDATE())
insert into employee(emp_name,emp_salary,emp_address,start_date)values('Roshani',300000,'Chennai',GETDATE())
insert into employee(emp_name,emp_salary,emp_address,start_date)values('Roshan',400000,'Gujarat',GETDATE())
insert into employee(emp_name,emp_salary,emp_address,start_date)values('Ram',600000,'Punjab',GETDATE())

update employee set emp_address='America'where emp_id=5

delete from employee where emp_address='America'

