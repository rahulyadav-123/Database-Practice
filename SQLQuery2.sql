							-----------------functions--------------
create database payroll_service
use payroll_service
create table employee_payroll
(
	id int identity (1,1) primary key,
	name varchar(55),
	salary int ,
	startdate date
)
insert into employee_payroll(name,salary,startdate)values('Rahul',100000,SYSDATETIME())
insert into employee_payroll(name,salary,startdate)values('Mayur',150000,SYSDATETIME())
insert into employee_payroll(name,salary,startdate)values('Mohit',190000,SYSDATETIME())
insert into employee_payroll(name,salary,startdate)values('Ketan',180000,SYSDATETIME())
select * from employee_payroll

create function fun_employee_payroll
(
@id int
)
returns table as
return
select * from employee_payroll
where employee_payroll.id>@id
select * from employee_payroll
select * from fun_employee_payroll(2)

		------display------
update employee_payroll set name='Arjun' where id=3

		------function with two columun concat function------
alter function fnEmpconcat_Info
(
	@name varchar(55),
	@salary int
)
returns varchar(55)
as
begin return (select @name+' '+@salary)
end
select * from fnEmpconcat_Info 

	---------display function------
select name,salary from fnEmpconcat_Info(name,salary) as total where name='Rahul'

		------print function-------
alter function fun_print_number()
returns decimal(7,2)
as
begin
return 15000.13526
end
print dbo.fun_print_number()

			-------------creating function for two numbers addition-----------
create function fun_addition(@num1 decimal(7,2),@num2 decimal(7,2))
returns decimal(7,2)
begin
declare @result decimal(7,2)
set @result =@num1+@num2
return @result
end
print dbo.fun_addition(100.23,15



				---------- function--------
create function Multinum(@num1 int ,@num2 int)
returns return type
as
begin
statement 1
statement 2
statement n
RETURN return value
end
			----------scaler function-------------
create function fun_Multinum (@num1 int ,@num2 int)
returns int
as
begin
declare @result int
set @result =@num1 + @num2
return @result
end
select dbo.fun_Multinum(2,5)

create function Gettotal(@id int)
returns int 
as 
begin
declare @result int
select @result=sum(salary/12) from employee_payroll As grosssalary  where id =@id group by id
return @result
end
select dbo.Gettotal(id) from employee_payroll

			--------Table value function------------
			-----Inline table value function-----------
create function getemplist(@salary int)
returns table
as
return select  * from employee_payroll where salary>@salary
select * from dbo.getemplist(100000)


		--------Multistatement table value function----------
create function Multistatementemp()
			returns @contact table(
			id int not null,
			name varchar(55),
			salary int,
			contact_type varchar(55)
			)
			as
			begin
			insert into @contact
			select
			id,
			name,
			salary,
			'staff'
			from dbo.employee_payroll where id=1
			return
			end

			select * from  Multistatementemp()







					------------Indexing--------------
create table tbleemployee
(
	id int primary key,
	name varchar(50),
	salary int ,
	gender varchar(55)
)
drop table tbleemployee
insert into tbleemployee(id,name,salary,gender)values(1,'Rahul',2500,'male')
insert into tbleemployee(id,name,salary,gender)values(3,'soni',5500,'female')
insert into tbleemployee(id,name,salary,gender)values(2,'pooja',2550,'female')
insert into tbleemployee(id,name,salary,gender)values(5,'Himani',1500,'female')
insert into tbleemployee(id,name,salary,gender)values(4,'rony',9500,'male')

select * from tbleemployee where id=5 
			---------------without indexing-----------
create index IX_tbleemployee_salary on tbleemployee (salary asc)
drop index If exists tbleemployee.IX_tbleemployee_salary

				------------After indexing-----------

create nonclustered index nonCLIDX_Empdetail on tbleemployee (name asc,gender)

select * from tbleemployee



				---------------cursor--------------------


declare  cpucursor cursor 
for 
select * from dbo.employee_payroll
		-----open cursor---------
open cpucursor
fetch next from cpucursor 
while (@@FETCH_STATUS = 0)
begin 
		fetch next from cpucursor
end
	-----------close cursor------
close cpucursor
			-----finally deallocate the cursor to realese it-------
deallocate cpucursor

