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
--------------------------------------------------------------------------
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
------------------------------------------------------------

create procedure spCreateLocalTempTable
as
begin
create table #PersonDetails(
Id int primary key,
Name varchar(20));
insert into #PersonDetails values(1, 'Tom')
insert into #PersonDetails values(2, 'Doom')
insert into #PersonDetails values(3, 'Room')
select * from #PersonDetails
end;

create table ##PersonDetails(
Id int primary key,
Name varchar(20));
select * from ##PersonDetails;
------------------------------------------------------------
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

---------------------------------------------------------------

Select * from DimEmployee 
where EmployeeNationalIDAlternateKey > 50000000 
and EmployeeNationalIDAlternateKey < 700000000

create index IX_tblEmployee_Salary
on DimEmployee (EmployeeNationalIDAlternateKey ASC)

execute sp_helptext DimEmployee

drop index DimEmployee.IX_tblEmploye_Salary
----------------------------------------------------------------------
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
