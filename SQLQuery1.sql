begin transaction

	update Employee set salary = 5000 where empname= 'ajay'

commit

begin transaction

	update Employee set salary = 5000 where empname= 'ajay'

rollback

select * from Employee