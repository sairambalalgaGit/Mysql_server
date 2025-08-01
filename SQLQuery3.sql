




--CREATE FUNCTION dbo.personCheck()
--RETURNS table as RETURN 
	--select * from person where id = 12;


--select * from person

--CREATE FUNCTION dbo.CalculateTotal
--(
    --@Price DECIMAL(10,2),
    --@Quantity INT
--)
--RETURNS DECIMAL(10,2)
--AS
--BEGIN
  --  RETURN @Price * @Quantity;
--END

--SELECT dbo.CalculateTotal(100.50, 3) AS TotalAmount;

CREATE FUNCTION dbo.GetDiscountPrice(
    @Price DECIMAL(10, 2),
    @DiscountRate DECIMAL(5, 2)
)
RETURNS DECIMAL(10, 2)
AS 
BEGIN
    RETURN @Price - (@Price * @DiscountRate / 100);
END


SELECT dbo.GetDiscountPrice(1050, 3) AS TotalAmount;

===================================================
create function dbo.area(
	@Radius Decimal(5,2)
)
returns decimal(5,2)
as 
begin

return (PI() * @Radius*@Radius);
End

select dbo.area(2.4) as Area_of_Circle;
======================================================


-- Create customer table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    registration_date DATE DEFAULT GETDATE()
);

-- Insert 5 records
INSERT INTO customer (customer_id, customer_name, email, phone)
VALUES
    (1, 'John Doe', 'john.doe@example.com', '555-0101'),
    (2, 'Jane Smith', 'jane.smith@example.com', '555-0102'),
    (3, 'Mike Johnson', 'mike.j@example.com', '555-0103'),
    (4, 'Sarah Williams', 'sarah.w@example.com', '555-0104'),
    (5, 'David Brown', 'david.b@example.com', '555-0105');

CREATE TABLE Ordering (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO company(company_id, company_name, city, empid)
VALUES
    (18, 'IBM', '2023-02-15', 125.99)
INSERT INTO Ordering (order_id, customer_name, order_date, total_amount)
VALUES
    (11, 'John Doe', '2023-01-15', 125.99),
    (12, 'Jane Smith', '2023-02-20', 89.50),
    (13, 'Robert Johnson', '2023-03-05', 245.75),
    (14, 'Emily Williams', '2023-04-12', 59.99),
    (15, 'Michael Brown', '2023-05-18', 199.00);

-- Create the company table with NOT NULL constraints
CREATE TABLE company (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    empid INT NOT NULL
);

-- Insert complete records for 6 major tech companies
INSERT INTO company (company_id, company_name, city, empid)
VALUES
    (10, 'IBM', 'Armonk', 350000),
    (11, 'Wipro', 'Bangalore', 250000),
    (12, 'Microsoft', 'Redmond', 180000),
    (13, 'Amazon', 'Seattle', 1500000),
    (14, 'Google', 'Mountain View', 160000),
    (15, 'Infosys', 'Bangalore', 300000),
    (16, 'Apple', 'Cupertino', 154000),
    (17, 'Tata Consultancy', 'Mumbai', 600000),
    (18, 'Oracle', 'Austin', 135000),
    (19, 'Meta', 'Menlo Park', 72000),
    (20, 'Tesla', 'Palo Alto', 110000);

    -- join/ inner join
select * from company c join Ordering o on c.company_id = o.order_id
select * from Ordering o join company c on o.order_id = c.company_id
select * from company c inner join Ordering o on c.company_id = o.order_id

-- outer joins - left, right, full

select * from company c left outer join Ordering o on c.company_id = o.order_id
select * from company c left join Ordering o on c.company_id = o.order_id


select * from company c right outer join Ordering o on c.company_id = o.order_id
select * from company c right join Ordering o on c.company_id = o.order_id

select * from company c full outer join Ordering o on c.company_id = o.order_id
select * from company c full join Ordering o on c.company_id = o.order_id

-- cross join

select * from company cross join Ordering
select * from Ordering cross join company

select * from company c1, company c2
where c1.company_id > c2.company_id

select company_id from company
intersect
select order_id from Ordering

select * from company
union
select * from Employee

select company_id from company
except
select order_id from Ordering

create proc getDetails
as
    begin
            select * from company
    end

create proc getEmp
as
begin
    select * from Employee
end




exec getDetails

exec getEmp

create proc greater
as
begin
    select * from Employee where empid > 15
end

create proc lesserthan
as
begin
    select * from Employee where empid < 15
end

exec greater
exec lesserthan
========================================================
create proc delemp(@eid int)
as
begin
    delete from Employee where empid = @eid
end

exec delemp 43

========================================================
create proc insertemp
 (@eid int, @ename varchar(50), @city varchar(50), @salary int)
 as
 begin
     insert into employee(empid, empname, city, salary)
     values(@eid, @ename, @city, @salary)
 end

 exec insertemp 1006, 'Pratyush', 'Mumbai', 5000;

 ===============================================================

 CREATE PROCEDURE UpdateSalaryEmpID
    @EmpID INT,
    @NewSalary DECIMAL(10, 2)
AS
BEGIN
    UPDATE Employee
    SET Salary = @NewSalary
    WHERE EmpID = @EmpID;
END;

exec UpdateSalaryEmpId 12,12000

select * from Employee
=====================================================

-- Create the stored procedure
CREATE PROCEDURE SimpleInOutProcedure
    @input INT,
    @inOutParam INT OUTPUT
AS
BEGIN
    SET @inOutParam = @inOutParam + @input;
END;


-- Declare and initialize variable
DECLARE @val INT = 5;


EXEC SimpleInOutProcedure 
    @input = 3, 
    @inOutParam = @val OUTPUT

PRINT @val; 

===============================================

create proc SimpleIOProc
	@input int output,
	@inout int 
as begin
	set @inout= @inout + @input 
End

declare @val1 int =5
exec SimpleIOProc @input=@val1 output, @inout=3 
print @val1;

============================

create proc assend
as
begin
    select empid from Employee order by empid asc

end

exec assend

===============================

create proc descend
as
begin
    select empid from Employee order by empid desc

end

exec descend

==============================================

declare @sales int = 6000

if @sales > 5000
begin
    print 'successful reached'
end
else
begin
    print 'failed'
end


=================================================================================


Declare @val4 int;
Declare @val5 int;

BEGIN TRY
   Set @val4=8;

BEGIN TRY
    Set @val4=8;
    Set @val5=@val4/0; /* Error Occur Here */
END TRY

BEGIN CATCH
    Print 'Error Occur that is:'
    Print Error_Message()
END CATCH

Set @val5=@val4/0; /* Error Occur Here */
END TRY

BEGIN CATCH
    Print 'Error Occur that is:'
    Print Error_Message()
END CATCH

=============================================

Declare @val1 int;
Declare @val2 int;

BEGIN TRY
Set @val1=8;
Set @val2=@val1%2;

if @val1=1
    Print ' Error Not Occur'
else
Begin
    Print 'Error Occur';
    Throw 60000,'Number Is Even',5
End

END TRY
BEGIN CATCH
Print 'Error Occur that is:'
Print Error_Message()
END CATCH