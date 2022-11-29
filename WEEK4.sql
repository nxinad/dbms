create table Borrower(
	customer_name varchar(255),
    loan_num int,
    foreign key(customer_name) references bank_customer(customer_name),
    foreign key(loan_num) references Loan(loan_num)
);

#Borrower values
insert into Borrower values('Avinash',1);
insert into Borrower values('Dinesh',2);
insert into Borrower values('Mohan',3);
insert into Borrower values('Nikil',4);
insert into Borrower values('Ravi',5); 
select * from Borrower;

#TODO 1
select d.customer_name
from bankaccount a,depositior d,branch b
where a.accno = d.acc_no AND b.branch_city='Delhi'
group by d.customer_name;

#TODO2
 
 select d.customer_name
 from depositior d
 where 0 = (select count(acc_no)
				from bankaccount a
                where d.acc_no=a.accno);
                
#TODO 3
select distinct d.customer_name
from depositior d
where d.customer_name in(
				select d.customer_name
                from branch b,depositior d,bankaccount ba
                where b.branch_city='Bangalore' and b.branch_name=ba.branch_name
			    and ba.accno=d.acc_no and customer_name IN(select customer_name from borrower)
                );
                
#TODO 4
select * from branch;
select branch_name
from branch
where assets > ALL (
					select assets 
                    from branch
                    where branch_city='Bangalore'
                    );
#TODO5
delete from bankaccount
where branch_name = (select branch_name from branch where branch_city='Bombay');

#TODO6
update bankaccount
set balance = balance +(0.05*balance);
select * from bankaccount;                                     

 

                
                