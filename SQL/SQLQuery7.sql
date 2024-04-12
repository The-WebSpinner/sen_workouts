use [SQL-Training]

--Select the average price in the table titles for  pub _id is 1389.
select AVG(price) as [average price] from titles where pub_id = '1389'

--What are the total numbers of rows in the titles table
select COUNT(title_id) as [numbers of rows in the titles table] from Titles

--List the address of all stores  in the state WA or CA in the table stores
select CONCAT(stor_name, ',', stor_address,',', city, ',', state,',',zip) as [Address]
from stores where state in  ('WA' , 'CA', 'OR' )

--List the date between  the year 1989 to 1992 in the table employee
select format(hire_date, 'dd-MMMM-yyyy') as [between  the year 1989 to 1992] from employee
where year (hire_date) between '1989' and '1992' order by hire_date asc 

 --List the first name and last name of the employee in the employee table where the jobs_id  is 6
 select fname as [First Name] , lname as [Last Name] from employee where job_id = '6'

