--------------------------------------№32--------------------------------------
Create function fn_ILTVF_GetEmployees()
Returns Table
as
return (select EmployeeKey, firstName, cast(BirthDate as Date) 
	as DOB from DimEmployee);

select * from fn_ILTVF_GetEmployees();

create function fn_MSTVF_GetEmployees()
returns @Table Table 
(id int, Name nvarchar(20), DOB date)
as
Begin
insert into @Table 
Select EmployeeKey, firstName, cast(BirthDate as Date) 
from DimEmployee 
return
end;

select * from fn_MSTVF_GetEmployees();

update fn_ILTVF_GetEmployees() set firstName = 'Sam1' 
where EmployeeKey = 1;
select * from fn_ILTVF_GetEmployees();
--------------------------------------№33--------------------------------------
create function fn_GetEmployeeNameByld(@id int)
returns nvarchar(20)
as
begin
return (select firstName from DimEmployee 
where EmployeeKey = @id)
end;

select dbo.fn_GetEmployeeNameByld(15);


alter function fn_GetEmployeeNameByld(@id int)
returns nvarchar(20)
with encryption
as
begin
return (select firstName from dbo.DimEmployee
where EmployeeKey = @id)
end

select dbo.fn_GetEmployeeNameByld(15);


alter function fn_GetEmployeeNameByld(@id int)
returns nvarchar(20)
with schemabinding
as
begin
return (select firstName from DimEmployee 
where EmployeeKey = @id)
end

select dbo.fn_GetEmployeeNameByld(15);
--------------------------------------№34--------------------------------------
create table #PersonDetails(
Id int primary key,
Name varchar(20));

insert into #PersonDetails values(1, 'Mike');
insert into #PersonDetails values(2, 'John');
insert into #PersonDetails values(3, 'Todd');

Select * from #PersonDetails

select name from tempdb..sysobjects
where name like '#PersonDetails%'

create procedure spCreateLocalTempTable
as
begin
create table #PersonDetails(
Id int primary key,
Name varchar(20));
insert into #PersonDetails values(1, 'Mike')
insert into #PersonDetails values(2, 'John')
insert into #PersonDetails values(3, 'Todd')
select * from #PersonDetails
end;

create table ##PersonDetails(
Id int primary key,
Name varchar(20));
select * from ##PersonDetails;

create Table ##EmployeeDetails(id int, Name nvarchar(20)) 
--------------------------------------№35--------------------------------------
Select * from DimEmployee 
where EmployeeNationalIDAlternateKey > 50000000 
and EmployeeNationalIDAlternateKey < 700000000

create index IX_tblEmployee_Salary
on DimEmployee (EmployeeNationalIDAlternateKey ASC)

execute sp_helptext DimEmployee

drop index DimEmployee.IX_tblEmploye_Salary
--------------------------------------№36--------------------------------------
create table tblEmployee(
id int primary key,
name nvarchar(50),
salary int,
gender nvarchar(10),
city nvarchar(50));

insert into tblEmployee values(3, 'John', 4500, 'Male', 'New York')
insert into tblEmployee values(1, 'Sam', 2500, 'Male', 'New York')
insert into tblEmployee values(4, 'Sara', 5500, 'Male', 'New York')
insert into tblEmployee values(5, 'Todd', 3100, 'Male', 'New York')
insert into tblEmployee values(2, 'Pam', 6500, 'Male', 'New York')

Create clustered index IX_tblEmployee_Name 
on tblEmployee(name)

drop index tblEmployee.PK_tblEmplo_3214EC070A9D95DB
create table #PersonDetails(
Id int primary key,
Name varchar(20));

insert into #PersonDetails values(1, 'Mike');
insert into #PersonDetails values(2, 'John');
insert into #PersonDetails values(3, 'Todd');

Select * from #PersonDetails

select name from tempdb..sysobjects
where name like '#PersonDetails%'

create procedure spCreateLocalTempTable
as
begin
create table #PersonDetails(
Id int primary key,
Name varchar(20));
insert into #PersonDetails values(1, 'Mike')
insert into #PersonDetails values(2, 'John')
insert into #PersonDetails values(3, 'Todd')
select * from #PersonDetails
end;

create Table ##EmployeeDetails(id int, Name nvarchar(20)) 
--------------------------------------№37--------------------------------------
create table tblEmployee_2(
id int primary key,
firstName nvarchar(50),
lastName nvarchar(50),
salary int,
gender nvarchar(10),
city nvarchar(50));

execute sp_helpindex tblEmployee_2

insert into tblEmployee_2 
values(1, 'Mike', 'Sandoz', 4500, 'Male', 'New York')
insert into tblEmployee_2 
values(1, 'John', 'Menco', 2500, 'Male', 'London')

Drop index tblEmployee_2.PK_tblEmplo_3213E83FC9E7901A

Insert into tblEmployee Values(1,'Mike', 'Sandoz',4500,'Male','New York')
Insert into tblEmployee Values(1,'John', 'Menco',2500,'Male','London')

Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee_2(firstName, lastName)

ALTER TABLE tblEmployee_2 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)

CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee_2(City)
WITH IGNORE_DUP_KEY
--------------------------------------№38--------------------------------------
create table tblEmployee_3(
id int primary key,
firstName nvarchar(50),
lastName nvarchar(50),
salary int,
gender nvarchar(10),
city nvarchar(50));

insert into tblEmployee_3 values(1, 'Mike', 'Sandoz', 4500, 'Male', 'New York')
insert into tblEmployee_3 values(2, 'Sara', 'Menco', 6500, 'Female', 'London')
insert into tblEmployee_3 values(3, 'john', 'Barber', 2500, 'Male', 'Sydney')
insert into tblEmployee_3 values(4, 'Pam', 'Grove', 3500, 'Female', 'Toronto')
insert into tblEmployee_3 values(5, 'james', 'Mirch', 7500, 'Male', 'London')

create NonClustered index IX_tblEmployee_Salary
on tblEmployee_3 (salary Asc)

select * from tblEmployee_3 where salary > 4000 and salary < 8000

Delete from tblEmployee_3 where salary = 2500
update tblEmployee_3 set salary = 9000 where salary = 7500

select * from tblEmployee_3 order by salary

select * from tblEmployee_3 order by salary desc

select salary, COUNT (salary) as total
from tblEmployee_3
group by salary
--------------------------------------№39--------------------------------------
create table tblEmployee(
id int primary key,
Name nvarchar(50),
salary int,
gender nvarchar(10),
departmentID int);

create table tblDepartment
(
deptID int primary key,
deptName nvarchar(20)
);

insert into tblDepartment values(1, 'IT')
insert into tblDepartment values(2, 'Payroll')
insert into tblDepartment values(3, 'HR')
insert into tblDepartment values(4, 'Admin')

insert into tblEmployee values(1, 'John', 5000, 'Male', 3)
insert into tblEmployee values(2, 'Mike', 3400, 'Male', 2)
insert into tblEmployee values(3, 'Pam', 6000, 'Female', 1)
insert into tblEmployee values(4, 'Todd', 4800, 'Male', 4)
insert into tblEmployee values(5, 'Sara', 3200, 'Female', 1)
insert into tblEmployee values(6, 'Ben', 4800, 'Male', 3)

select id, name, salary, gender, deptName
from tblEmployee
join tblDepartment
on tblEmployee.departmentID = tblDepartment.deptID

create view vWEEmployeesByDepartment
as 
select id, name, salary, gender, deptName
from tblEmployee
join tblDepartment
on tblEmployee.departmentID = tblDepartment.deptID

select * from vWEEmployeesByDepartment

create view vWITDepartment_Employees
as
select id, name, salary, gender, deptName
from tblEmployee
join tblDepartment
on tblEmployee.departmentID = tblDepartment.deptID
where tblDepartment.deptName = 'IT'

create view vWEmployeesNonConfidentialData
as
select id, name, gender, deptName
from tblEmployee
join tblDepartment
on tblEmployee.departmentID = tblDepartment.deptID

create view vWEmployeesCountByDepartment
as
select deptName, count(id) as totalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.departmentID = tblDepartment.deptID
group by deptName
--------------------------------------№40--------------------------------------
create table tblEmployee_1(
id int primary key,
Name nvarchar(50),
salary int,
gender nvarchar(10),
departmentID int);

insert into tblEmployee_1 values(1, 'John', 5000, 'Male', 3)
insert into tblEmployee_1 values(2, 'Mike', 3400, 'Male', 2)
insert into tblEmployee_1 values(3, 'Pam', 6000, 'Female', 1)
insert into tblEmployee_1 values(4, 'Todd', 4800, 'Male', 4)
insert into tblEmployee_1 values(5, 'Sara', 3200, 'Female', 1)
insert into tblEmployee_1 values(6, 'Ben', 4800, 'Male', 3)

create view vWEmployeesDataExceptSalary
as
select id, name, gender, departmentID
from tblEmployee_1

select * from vWEmployeesDataExceptSalary

update vWEmployeesDataExceptSalary
set name = 'Mikey' where id = 2

delete from vWEmployeesDataExceptSalary where id = 2
insert into vWEmployeesDataExceptSalary values(2, 'Mikey','Male', 2)

create table tblDepartment_1
(
deptID int primary key,
deptName nvarchar(20)
);

insert into tblDepartment_1 values(1, 'IT')
insert into tblDepartment_1 values(2, 'Payroll')
insert into tblDepartment_1 values(3, 'HR')
insert into tblDepartment_1 values(4, 'Admin')

create view vwEmployeeDetailsByDepartment
as
select id, name, salary, gender, deptName
from tblEmployee_1
join tblDepartment_1
on tblEmployee_1.departmentID = tblDepartment_1.deptID

select * from vwEmployeeDetailsByDepartment

update vwEmployeeDetailsByDepartment
set deptName = 'IT' where name = 'John'
--------------------------------------№41--------------------------------------
create table tblProduct(
productID int primary key,
name nvarchar(20),
unitPrice int)

insert into tblProduct values(1, 'Books', 20)
insert into tblProduct values(2, 'Pens', 14)
insert into tblProduct values(3, 'Pencils', 11)
insert into tblProduct values(4, 'Clips', 10)

create table tblProductSales(
productID int,
quantitySold int)

insert into tblProductSales values(1, 10)
insert into tblProductSales values(3, 23)
insert into tblProductSales values(4, 21)
insert into tblProductSales values(2, 12)
insert into tblProductSales values(1, 13)
insert into tblProductSales values(3, 12)
insert into tblProductSales values(4, 13)
insert into tblProductSales values(1, 11)
insert into tblProductSales values(2, 12)
insert into tblProductSales values(1, 14)

create view vWTotalSalesByProduct
with SchemaBinding
as
select name,
sum(isnull((quantitySold * unitprice), 0)) as TotalSales,
count_big(*) as totalTransaction
from dbo.tblProductSales
join dbo.tblProduct
on dbo.tblProduct.productID = dbo.tblproductSales.productID
group by name

create unique clustered index UIX_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct(name)
--------------------------------------№42--------------------------------------
create table tblEmployee_2(
id int primary key,
Name nvarchar(50),
salary int,
gender nvarchar(10),
departmentID int);

insert into tblEmployee_2 values(1, 'John', 5000, 'Male', 3)
insert into tblEmployee_2 values(2, 'Mike', 3400, 'Male', 2)
insert into tblEmployee_2 values(3, 'Pam', 6000, 'Female', 1)
insert into tblEmployee_2 values(4, 'Todd', 4800, 'Male', 4)
insert into tblEmployee_2 values(5, 'Sara', 3200, 'Female', 1)
insert into tblEmployee_2 values(6, 'Ben', 4800, 'Male', 3)

create view vWEmployeeDetails
@Gender nvarchar(20)
as
select id, Name, gender, departmentID
from tblEmployee_2
where gender = @Gender

Create function fnEmployeeDetails(@Gender nvarchar(20))
Returns Table
as
Return 
(Select Id, Name, Gender, DepartmentId
from tblEmployee where Gender = @Gender)

Select * from dbo.fnEmployeeDetails('Male')

Create View vWEmployeeDetailsSorted
as
Select Id, Name, Gender, DepartmentId
from tblEmployee
order by Id

Create Table ##TestTempTable(
Id int, 
Name nvarchar(20), 
Gender nvarchar(10))

Insert into ##TestTempTable values(101, 'Martin', 'Male')
Insert into ##TestTempTable values(102, 'Joe', 'Female')
Insert into ##TestTempTable values(103, 'Pam', 'Female')
Insert into ##TestTempTable values(104, 'James', 'Male')

Create View vwOnTempTable
as
Select Id, Name, Gender
from ##TestTempTable
--------------------------------------№92--------------------------------------
create trigger trMyFirstTrigger
on database
for create_table
as
begin
	print 'New table created'
end

create table test(id int)

alter trigger trMyFirstTrigger
on database
for create_table, alter_table, drop_table
as
begin
	print 'A table has just been created, modified or deleted'
end

alter trigger trMyFirstTrigger
on database
for create_table, alter_table, drop_table
as
begin
	rollback
	print 'You cannot create, alter or drop a table'
end

disable trigger trMyFirstTrigger on database

drop trigger trMyFirstTrigger on database

create trigger trRenameTable
on database
for rename
as
begin
	print 'You Just renamed something'
end
--------------------------------------№93--------------------------------------
create trigger tr_databaseScopeTrigger
on database
for create_table, alter_table, drop_table
as
begin
	rollback
	print 'You cannot create, alter or drop a table in the current database'
end
create table ttt(id int)

create trigger tr_ServerScopeTrigger
on ALL server
for create_table, alter_table, drop_table
as
begin
	rollback
	print 'You cannot create, alter or drop a table in any database on the server'
end
create table ttt(id int)

disable trigger tr_ServerScopeTrigger on all server
create table ttt(id int)

enable trigger tr_ServerScopeTrigger on all server
create table ttt(id int)

drop trigger tr_ServerScopeTrigger on all server
create table ttt(id int)
--------------------------------------№94--------------------------------------
create trigger tr_DatabaseScopeTrigger
on database
for create_table
as
begin
	print 'Database Scope Trigger'
end
go

create trigger tr_ServerScopeTrigger
on all server
for create_table
as
begin
	print 'Server Scope Trigger'
end
go

create table sss(id int)
--------------------------------------№96--------------------------------------
create trigger tr_LogonAuditTrigger
on all server
for logon
as
begin
	declare @LoginName nvarchar(100)
	set @LoginName=original_login()
	if (select count(*) from sys.dm_exec_sessions
		where is_user_process = 1 
		and original_login_name = @LoginName)>3
	BEGIN
		PRINT 'Fourth connection of' + @LoginName + 'bloced'
		rollback
	end
end

Execute sp_readerrorlog
