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

				---------Sub-queries--------
select * from employee
where emp_id=(select emp_id from company where comp_name='Bridgelab' and comp_id=1)

select * from employee
where emp_id IN(select emp_id from company where emp_id=2)

select * from company
select top 2 percent * from employee

select * from employee
where emp_id In(select emp_id from company where comp_name='Infosys')

select * from employee
where emp_id >Any(select emp_id from company where comp_name='Infosys')

select * from employee
where emp_id <Any(select emp_id from company where comp_name='Infosys')


					------------Joints--------------
SELECT  *      
FROM            dbo.company INNER JOIN
                         dbo.employee ON dbo.company.emp_id = dbo.employee.emp_id



SELECT        dbo.employee.emp_id, dbo.employee.emp_name, dbo.employee.emp_salary, dbo.employee.emp_address, dbo.employee.start_date
FROM            dbo.company left JOIN
                         dbo.employee ON dbo.company.emp_id = dbo.employee.emp_id


select dbo.employee.emp_id, dbo.employee.emp_name from employee
left join company 
ON dbo.company.emp_id = dbo.employee.emp_id


 select company.comp_name,company.emp_id from company
 right join employee 
 ON dbo.company.emp_id = dbo.employee.emp_id
 order by company.comp_name desc

 select company.comp_name,employee.emp_name from company
 full outer join employee
 ON dbo.company.emp_id = dbo.employee.emp_id

 select company.comp_name,employee.emp_name,employee.emp_address from company
 cross join employee
					-------------Self join ----------
 select A.comp_name As comp_name1,B.emp_name As emp_name2 
 from company A,employee B
 where A.comp_id<>B.emp_id
 order by A.comp_id
