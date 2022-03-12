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
create function fnEmpconcat_Info
(
	@name varchar(65),
	@salary int
)
returns varchar(55)
as
begin return (select @name+' '+@salary)
end
select * from  fnEmpconcat_Infoss

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
print dbo.fun_addition(100.23,1500)


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




