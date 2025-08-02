


use Wipro

select * from Employee

create view empView
as
	select empid, empname, city from Employee where empid = 1006

create view empView2
as
	select empid, empname, city from Employee where empid = 12 and empname = 'ajay'

alter view empView2
as
	select * from Employee where city = 'york'


select * from empView2

drop view empView2


=================================

select * from company

create view empView2
as
	select * from company c join Ordering o on c.company_id = o.order_id

select * from sys.views

SELECT ROUTINE_SCHEMA, ROUTINE_NAME
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE';

create index idx
on Employee (empid);

drop index idx

create index idx2
on Employee (empid, city);



SELECT * from sys.INDEXES

exec sp_rename 'idx1', 'ind' , 'INDEX'


