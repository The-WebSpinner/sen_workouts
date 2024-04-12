use [SQL-Training]

--Display the names and hire dates of  employees hired between 1991 - 1992.
select fname,lname,hire_date  from employee where hire_date between '1991-01-01' and '1992-12-31'
select fname,lname,hire_date  from employee where YEAR(hire_date) between '1991' and '1992'

--Display the names of employees without middle (minit) name.
select CONCAT(fname , ' ' , lname) as Without_middle_names  from  employee where minit ='' 
select CONCAT(fname , ' ' , lname) as Without_middle_names  from  employee 

--Display the names and hire dates of all employees with the column  headers \Name" and \Start Date", in the order they were hired.
select CONCAT(fname , ' ' , lname) as  Names,  hire_date  AS  [Start date]  from employee  order by hire_date asc 

--Retrieve the names of  employees whose designation is ‘Sales Representative’.
select CONCAT(fname , ' ' , lname) as [Sales Representative Employees] from employee  
where job_id = (select job_id from jobs where job_desc = 'Sales Representative') 



