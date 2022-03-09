				--------------DDL------------
create database mydatabase
use mydatabase
select * from sys.databases
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

			-------------for constraints(PK,FK)--------------
create table company
(	
	comp_id int primary key,
	comp_name varchar(50),
	emp_id int foreign key references employee(emp_id)
)
select * from company
insert into company(comp_id,comp_name,emp_id)values(1,'Bridgelab',1)
insert into company(comp_id,comp_name,emp_id)values(2,'Infosys',2)
insert into company(comp_id,comp_name,emp_id)values(3,'TCS',3)
		
				
			-------------for constraints(Identity)--------------
create table demo1
(
	id int identity(1,1) primary key,
	emp_name varchar(65),
	emp_salary int

)
select * from demo1
insert into demo1(emp_name,emp_salary)values('soni',500000)
insert into demo1(emp_name,emp_salary)values('karan',400000)


			--------------Use of table level constraints--------------
create table demoTableLevel
(
	id int primary key,
	StudentID int,
	Subjects varchar(55),
	constraint StudID_Sub unique(StudentID,Subjects)
)
select * from demoTableLevel
insert into demoTableLevel(id,StudentID,Subjects)values(1,25,'english')
insert into demoTableLevel(id,StudentID,Subjects)values(2,25,'english')
insert into demoTableLevel(id,StudentID,Subjects)values(5,25,'english')
insert into demoTableLevel(id,StudentID,Subjects)values(6,25,'english')



				----------Where,order by,Group by Clauses--------------
select * from employee where emp_id=1
select * from employee where emp_id=2 order by emp_name desc
select * from employee order by emp_name desc
select * from employee order by emp_name asc
select Max(emp_salary) from employee GROUP BY emp_address 
select comp_name from company GROUP BY comp_name
select emp_name from employee GROUP BY emp_name
select top 2 emp_name from employee order by emp_address asc

			