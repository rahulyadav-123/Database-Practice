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

					----------------Multiple join using three table----------
create table Department
(
	Department_ID int primary key,
	Department_Name varchar(55)
)
select * from Department
insert into Department(Department_ID,Department_Name)values(1,'Account')
insert into Department(Department_ID,Department_Name)values(2,'IT')
insert into Department(Department_ID,Department_Name)values(3,'HR')
insert into Department(Department_ID,Department_Name)values(4,'Devolpment')

create table Genders
(
	Gender_ID int primary key,
	Gender_Name varchar(55)
)
select * from Genders
insert into Genders(Gender_ID,Gender_Name)values(1,'Male')
insert into Genders(Gender_ID,Gender_Name)values(2,'Female')

create table Employees
(
	Employee_ID int primary key,
	Employee_Name varchar(55),
	Department_ID int foreign key references Department(Department_ID),
	Gender_ID int foreign key references Genders(Gender_ID)
)
select * from Employees
insert into Employees(Employee_ID,Employee_Name,Department_ID,Gender_ID)values(1,'Arohi',1,1)
insert into Employees(Employee_ID,Employee_Name,Department_ID,Gender_ID)values(2,'Aashish',1,2)
insert into Employees(Employee_ID,Employee_Name,Department_ID,Gender_ID)values(3,'Ansh',2,1)
insert into Employees(Employee_ID,Employee_Name,Department_ID,Gender_ID)values(4,'Arpita',3,2)
insert into Employees(Employee_ID,Employee_Name,Department_ID,Gender_ID)values(5,'Anjali',4,1)
insert into Employees(Employee_ID,Employee_Name,Department_ID,Gender_ID)values(6,'Anshu',2,1)

select Employee_Name,Department_Name,Gender_Name
from Employees
join Department on Employees.Department_ID = Department.Department_ID
join  Genders on Employees.Gender_ID = Genders.Gender_ID


select Employee_Name,Department_Name,Gender_Name
from Employees
join Department on Employees.Department_ID = Department.Department_ID
join  Genders on Employees.Gender_ID = Genders.Gender_ID
order by Employee_Name asc


select Department_Name,Gender_Name, count(*) as TotalEmployee
from Employees
join Department on Employees.Department_ID = Department.Department_ID
join  Genders on Employees.Gender_ID = Genders.Gender_ID
group by Department_Name,Gender_Name





							---------------------view sql Commands--------------

Create View vWemployeeByDepartment
as
select Employee_Name,Department_Name,Gender_Name
from Employees
join Department on Employees.Department_ID = Department.Department_ID
join  Genders on Employees.Gender_ID = Genders.Gender_ID

select * from vWemployeeByDepartment

Create View vWITemployees
as
select Employee_Name,Department_Name,Gender_Name
from Employees
join Department on Employees.Department_ID = Department.Department_ID
join  Genders on Employees.Gender_ID = Genders.Gender_ID
where Department.Department_Name='IT'

select * from vWITemployees

Create View vWNonConfedentialData
as
select Employee_Name,Department_Name
from Employees
join Department on Employees.Department_ID = Department.Department_ID
join  Genders on Employees.Gender_ID = Genders.Gender_ID

select * from vWNonConfedentialData

create view vWSummerizeDataa
as
select Department_Name, count(*) as TotalEmployee
from Employees
join Department on Employees.Department_ID = Department.Department_ID
join  Genders on Employees.Gender_ID = Genders.Gender_ID
group by Department_Name,Gender_Name

select * from vWSummerizeDataa


							--------------Derived Table-----------------
select * from 
(
	select Department_Name, count(*) as TotalEmployee
	from Employees
	join Department on Employees.Department_ID = Department.Department_ID
	join  Genders on Employees.Gender_ID = Genders.Gender_ID
	group by Department_Name,Gender_Name
)As derivedtable






			-----------------cast and convert function-----------
 create table tblemploye
 (	
	id int primary key,
	name varchar(55),
	birth_date DATETime not null
)
	
	select * from tblemploye
	drop table tblemploye
	insert into tblemploye(id,name,birth_date)values(1,'ram','1980-05-11 10:31:00')
	insert into tblemploye(id,name,birth_date)values(2,'sam','1984-06-20 10:31:00')
	insert into tblemploye(id,name,birth_date)values(3,'cham','1988-01-11 10:31:00')
	insert into tblemploye(id,name,birth_date)values(4,'amir','19	89-06-11 10:31:00')

	

	select id,name,birth_date,CAST(birth_date as varchar)as convertedDOB from tblemploye
	select id,name,birth_date,convert( nvarchar ,birth_date,103)as convertedDOB from tblemploye



						---------------like Operator-------------
select Employee_Name from Employees where Employee_Name like 'A%'

select emp_name from employee where emp_name like '%os%'

select emp_address from employee where emp_address like '%un%'


							-------------Delete cascade------------
create table customers
(
	cus_ID int primary key,
	cust_Name varchar (55)
)
insert into customers(cus_ID,cust_Name)values(1,'chunky')
insert into customers(cus_ID,cust_Name)values(2,'akshay')
insert into customers(cus_ID,cust_Name)values(3,'kumar')

create table orders
(
	order_ID int identity(1,1) primary key,
	cus_ID int,
	product_items varchar(55),
	foreign key (cus_ID) references customers(cus_ID)
	On delete set null
)
insert into orders(cus_ID,product_items)values(1,'Grocery')
insert into orders(cus_ID,product_items)values(2,'milk')
insert into orders(cus_ID,product_items)values(3,'curd')
drop table customers
drop table orders
select * from customers
select * from orders
delete from customers where cus_ID=3

							------------Update cascade-----------
create table orders
(
	order_ID int identity(1,1) primary key,
	cus_ID int,
	product_items varchar(55),
	foreign key (cus_ID) references customers(cus_ID)
	On update set null
)
update orders set cus_ID=2 where order_ID=1


					---------------Stored procedure-----------
create procedure sptoalleployee
as
begin
select Employee_Name,Department_Name,Gender_Name
from Employees
join Department on Employees.Department_ID = Department.Department_ID
join  Genders on Employees.Gender_ID = Genders.Gender_ID
end

sptoalleployee




