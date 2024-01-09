create DATABASE BOOTCAMP_EXERCISE1;
use BOOTCAMP_EXERCISE1; 

create table regions (
	REGION_ID INT PRIMARY KEY,
    REGION_NAME VARCHAR(25)
);

create table countries (

COUNTRY_ID CHAR(2) PRIMARY KEY,
COUNTRY_NAME VARCHAR(40),
REGION_ID INT, foreign key (REGION_ID) references regions(REGION_ID)
);

create table locations (

LOCATION_ID INT PRIMARY KEY,
STREET_ADDRESS VARCHAR(25),
POSTAL_CODE VARCHAR(12),
CITY VARCHAR(30),
STATE_PROVINCE VARCHAR(12),
COUNTRY_ID CHAR(2), foreign key (COUNTRY_ID) REFERENCES countries(COUNTRY_ID)
);

create table departments(
DEPARTMENT_ID INT PRIMARY KEY,
DEPARTMENT_NAME VARCHAR(30),
MANAGER_ID INT,
LOCATION_ID INT, foreign key (LOCATION_ID) references locations (LOCATION_ID)
);

create table employees (
	EMPLOYEE_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(20),
	LAST_NAME VARCHAR(25),
    EMAIL VARCHAR(25),
    PHONE_NUMBER VARCHAR(20),
    HIRE_DATE DATE,
    JOB_ID VARCHAR(10),
    SALARY INT,
    COMMISION_PCT INT,
    MANAGER_ID INT,
    DEPARTMENT_ID INT, FOREIGN key (DEPARTMENT_ID) references departments(DEPARTMENT_ID)
);

create table jobs (
JOB_ID VARCHAR(10) PRIMARY KEY,
JOB_TITLE VARCHAR(35),
MIN_SALARY INT,
MAX_SALARY INT
);

create table job_history (
EMPLOYEE_ID int, foreign key (EMPLOYEE_ID) references employees (EMPLOYEE_ID),
START_DATE DATE PRIMARY KEY,
END_DATE DATE,
JOB_ID VARCHAR(10), foreign key (JOB_ID) references jobs (JOB_ID),
DEPARTMENT_ID INT
);

drop table job_history; 






insert into regions (region_id, region_name)
values (1, 'West')
;
insert into regions (region_id, region_name)
values (2, 'USA')
;
insert into regions (region_id, region_name)
values (3, 'Asia')
;

-- update regions set region_name = 'West' where region_id = '1' ;  
-- update regions set region_name = 'Asia' where region_id = '3' ;  


insert into countries (country_id, country_name, region_id)
values
('DE', 'Germany', 1 ),
('IT', 'Italy', 1),
('JP', 'Japan', 3),
('US', 'United state', 2); 



insert into LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id) 
values (1000, '1297 Via cola di Rie', '989', 'Roma', null, 'IT');

insert into LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id) 
values 
(1100, '93091 Calle della Te', '10934', 'Venice', null, 'IT'),
(1200, '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo JP', null),
(1400, '2014 Jabberwocky', '26192', 'Southlake', 'Texas', 'US');

insert into departments (department_id, department_name, manager_id, location_id)
values
(10, 'Administration', 200, 1100),
(20, 'Marketing', 201, 1200),
(30, 'Marketing', 202, 1400)
;

update departments d set department_name = 'Purchasing' where d.department_id = 30; 

insert into employees 
(employee_id
, first_name
, last_name
, email
, phone_number
, hire_date
, job_id
, salary
, commision_pct
, manager_id
, department_id)

values
(100,'Steven', 'king', 'sking', 515-1234567, '1987-06-17', 'ST_CLERK', 24000.00, 0.00, 109, 10 ),
(101,'Neena', 'Kochhar', 'NKOCHHAR', 515-1234568, '1987-06-18', 'MK_REP', 17000.00, 0.00, 103, 20 ),
(102,'Lex', 'De Haan', 'LDEHAAN', 515-1234569, '1987-06-19', 'IT_PROG', 17000.00, 0.00, 108, 30 ),
(103,'Alexander', 'De Haan', 'LDEHAAN', 515-1234569, '1987-06-19', 'IT_PROG', 17000.00, 0.00, 108, 30 ); 



insert into job_history (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID)
values
(102, '1993-01-13', '1998-07-24', 'IT_PROG', 20),
(101, '1989-09-21', '1993-10-27', 'MK_REP', 10),
(101, '1993-10-28', '1997-03-15', 'MK_REP', 30),
(100, '1996-02-17', '1999-12-19', 'ST_CLERK', 30),
(103, '1998-03-24', '1999-12-31', 'MK_REP', 20);

insert into job_history (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID)
values
(103, '1998-03-24', '1999-12-31', 'MK_REP', 20);

insert into jobs (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
values 
('IT_PROG', 'IT Programer', 8000, 15000),
('MK_REP', 'Marketing Representative', 18000, 25000),
('ST_CLERK', 'Clerk', 12000, 18000);




delete from job_history where start_date = '1998-04-01' ; 
delete from job_history where EMPLOYEE_ID = 103 ; 


select * from countries;
select * from departments;
select * from employees;
select * from jobs;
select * from job_history;
select * from locations;
select * from regions;

select l.location_id, l.street_address, l.city, l.state_province, c.country_name
from locations l left join countries c on l.country_id = c.COUNTRY_ID;

select e.first_name, e.last_name, e.department_id
from employees e; 

-- select e.first_name, e.last_name, j.job_id, e.department_id
select e.first_name, e.last_name, j.job_id, e.department_id
from employees e 
left join jobs j on e.job_id = j.job_id 
left join job_history jh on j.job_id = jh.job_id
left join departments d on jh.department_id = d.department_id 
left join locations l on d.location_id = l.location_id
left join countries c on l.country_id = c.country_id
where city = 'Tokyo';

select e.employee_id, e.last_name, e.manager_id, e.last_name 
from employees e;

select e.FIRST_NAME, e.LAST_NAME, e.HIRE_DATE
from employees e 
where e.HIRE_DATE > (select e.HIRE_DATE from employees e where e.FIRST_NAME = 'Lex');

select * 
from departments; 

select * 
from employees e 
left join departments d on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

select * 
from employees e ;

update employees set job_id = 'MK_REP' where employee_id = 103;
update employees set department_id = 20 where employee_id = 103;

select d.department_name, d.DEPARTMENT_ID, count(1) as 'Number of Employees'
from employees e 
left join departments d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
group by e.DEPARTMENT_ID;


select e.EMPLOYEE_ID, j.JOB_TITLE, DATEDIFF(jh.END_DATE, jh.START_DATE) as 'Number of days'
from employees e
left join jobs j on e.job_id = j.job_id
left join job_history jh on j.job_id = jh.job_id
where jh.department_id = 30
;



