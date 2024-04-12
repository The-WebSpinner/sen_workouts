use [SQL-Training]

--Display/find the given authors complete address information. [Sylvia Panteley ]
select CONCAT(au_fname, ' ', au_lname) as Authors ,CONCAT (address,',', city, ',', state,',',zip) as [Address information]
from authors where au_fname = 'sylvia'

--Display only the hire date and employee name for each employee.
 select hire_date  as [hire_date] , CONCAT(fname,'  ',minit,'',lname) as Employees from employee 

--Display all the books which come under ‘Psychology’ type.
 select title  as [Books Under Psychology]  from Titles  where type = 'psychology'