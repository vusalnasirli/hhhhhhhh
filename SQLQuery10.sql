create database SCH;
use SCH;


create table Duties(
Id int primary key identity,
Name nvarchar(20)
)
insert into Duty values ('D1'),('D2'), ('D3')


create table Filial(
Id int primary key identity,
Name nvarchar(20) Not Null
)
insert into Filial values ('F1'), ('F2')
 

create table Products(
Id int primary key identity,
Name nvarchar(20) Not Null,
BuyPrice money Not Null,
SellPrice money Not Null
)
insert into Product Values ('P1', 50, 100), ('P2', 40, 120) 


create table Employees(
Id int primary key identity,
Name nvarchar(20) Not Null,
Surname  nvarchar(20) Not Null,
Salary money Not Null,
DutyId int references Duties (Id)
)
insert into Employee Values('Rustem', 'Aliyev', 1500, 1) ('Alvin', 'Garayev', 3000, 2)


create table Sales (
Id int primary key identity,
ProductId int references Products (Id),
EmployeeId int references Employees (Id),
FilialId int references Filials (Id),
SelectDate DateTime default Getdate()
)
insert into Sale Values(1,1,1,default ) (2,2,2,default )


--Query 1 :

select e.name 'Employee Name ' , e.surname  'Employee Surname',
f.Name 'Filial Name', p.BuyPrice, p.SalePrice
from Sales as s
join Employees as s
on s.EmployeeId = e.Id
join Products as p
on s.ProductId = p.Id
join Filials as s
on s.FilialId = f.Id


--Query 2 :

select sum(SalePrice) from products
select sum(SalePrice) from Orders as s
join Prodcuts as p
on s.ProductId = p.Id
select sum(SalePrice) from Orders as s
join Prodcuts as p
on s.ProductId = p.Id


--Query 3 :

select Sum(SalePrice) - Sum(BuyPrice) from Sales as s
join Products as p
on s.ProductId = p.Id

select Sum(SalePrice) - Sum(BuyPrice) from Sales as s
join Products as p
on s.ProductId = p.Id
where month(SaleTime) = Month(getdate()) And Year(SaleTime) = Year(GetDate()) 


--Query 4 :


select e.name,  Count(ProductId) from Sales as s
join Employees as e
on s.EmployeeId = e.id
group by e.id
