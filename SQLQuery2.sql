use Wipro


create table person1(
	id int not null,
	lastname varchar(100) not null,
	firstname varchar(100),
	age int check(age >= 18)
)

insert into person1(id, lastname, firstname, age) values(12, 'ajay', 'swati', 18)

select * from person1

sp_databases





create table person3(
	id int not null,
	lastname varchar(100) not null,
	firstname varchar(100),
	city varchar(100) default 'hyderabad'
)

insert into person3(id, lastname, firstname) values(100, 'siva', 'sankar')

insert into person3(id, lastname, firstname, city) values(100, 'siva', 'sankar', 'kochin')

select * from person3

sp_tables


create table person4(
	id int not null unique,
	lastname varchar(100) not null,
	firstname varchar(100),
	age int
)

insert into person4(id, lastname, firstname, age) values(11, 'ravi', 'fhfh', 43)

select * from person4


create table person(
	id int not null primary key,
	lastname varchar(100) not null,
	firstname varchar(100),
	age int
)


create table orders(
	orderid int,
	number int,
	person_id int,


	primary key(orderid),
	foreign key(person_id) references person(id)

)


select sqrt(625)

select floor(5.9)

select ceiling(5.1)

select ascii('b')

select replace('ajay is lucky', 'ajay', 'renu')

select replicate('renu', 10)

select ltrim('   you are small')

select rtrim('you are small   ')

select trim('   you are    small    ')


select getdate()

select dateadd(day, 2, getdate())
select dateadd(month, 2, getdate())
select dateadd(year, 2, getdate())

select datepart(day, getdate())
select datepart(month, getdate())
select datepart(year, getdate())

select datepart(day, '2025-08-1')

select datepart(month, '2025-08-1')

select datepart(year, '2025-08-1')

select datename(dw, '08/01/2025')

select datename(month, '08/01/2025')



select datediff(day, '2025/8/1', '2025/9/25')

select datediff(month, '2025/8/1', '2025/9/25')

select datediff(year, '2025/8/1', '2025/9/25')
