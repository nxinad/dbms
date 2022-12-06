create database 1bm21cs114_Employee;
use 1bm21cs114_Employee;
create table Dept(
d_no int,
d_name varchar (10),
d_loc varchar (30),
primary key(d_no)
);
create table Project(
p_no int,
p_loc varchar(20),
p_name varchar(15),
PRIMARY KEY(p_no)
);
create table Employee(
emp_no int,
emp_name varchar(10),
mgr_no int,
hiredate date,
sal real,
d_no int,
primary key(emp_no),
foreign key(d_no) references Dept(d_no)
on update cascade on delete cascade
);
create table Incentives(
emp_no int,
incentive_date date,
incentive_amt real,
primary key(incentive_date),
foreign key(emp_no) references Employee(emp_no)
on update cascade on delete cascade
);
create table Assigned(
emp_no int,
p_no int,
job_role varchar(10),
foreign key(emp_no) references Employee(emp_no)
on update cascade on delete cascade,
foreign key(p_no) references Project(p_no)
on update cascade on delete cascade
);

insert into dept values(100,'IT','mysore');
insert into dept values(200,'Marketing','patna');
insert into dept values(300,'HR','delhi');
insert into dept values(400,'finance','panaji');
insert into dept values(500,'logistics','bangalore');
insert into dept values(600,'accounts','ahmedebad');
insert into dept values(700,'design','hydrebad');
insert into project values(10,'mysore','alpha');
insert into project values(20,'patna','beta');
insert into project values(30,'delhi','gama');
insert into project values(40,'panaji','delta');
insert into project values(50,'bangalore','omega');
insert into project values(60,'ahmedebad','sine');
insert into employee values(01,'charlie',11,'2001-01-01',10000,500);
insert into employee values(02,'michel',22,'2002-02-02',15000,100);
insert into employee values(03,'suzan',33,'2003-03-03',20000,300);
insert into employee values(04,'velvet',44,'2004-04-04',25000,200);
insert into employee values(05,'june',55,'2005-05-05',30000,500);
insert into employee values(06,'july',66,'2006-06-06',35000,500);
insert into employee values(07,'automn',77,'2007-07-07',40000,400);
insert into employee values(08,'daisy',88,'2008-08-08',45000,100);
insert into employee values(09,'april',99,'2009-09-09',50000,200);
insert into employee values(10,'spring',111,'2010-10-10',55000,300);
insert into incentives values(01,'2021-05-11',1000);
insert into incentives values(03,'2022-04-20',1500);
insert into incentives values(05,'2021-09-10',2000);
insert into incentives values(07,'2022-06-21',2500);
insert into incentives values(09,'2021-04-17',3000);
insert into incentives values(10,'2022-10-19',3500);
insert into assigned values(01,20,'architect');
insert into assigned values(02,10,'peon');
insert into assigned values(03,30,'supervisor');
insert into assigned values(04,60,'assistant');
insert into assigned values(05,50,'mason');
insert into assigned values(06,50,'manager');
insert into assigned values(07,40,'medic');
insert into assigned values(08,60,'mechanic');
insert into assigned values(09,30,'engineer');
insert into assigned values(10,30,'maid');
select *from employee;
select *from assigned;
select *from incentives;
select *from project;
select *from dept;

select emp_no 
from assigned,project 
where assigned.p_no=project.p_no and project.p_loc
in('mysore','bangalore','hyderabad');

select emp_no
from employee
where emp_no not in(select emp_no from incentives);

select e.emp_name,e.emp_no,d.d_name,a.job_role,d.d_loc,p.p_loc
from employee e, dept d, assigned a, project p
where d.d_no=e.d_no
and e.emp_no=a.emp_no
and a.p_no=p.p_no
and p.p_loc=d.d_loc;

