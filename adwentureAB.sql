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
