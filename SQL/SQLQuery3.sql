use [SQL-Training]

--Display/find the total number of Publishers in publishers table.
select count(pub_id)  as [Total number of publishers] from publishers 

--Display the employee name and job description of all employees with the same job as Howard. 
 select CONCAT(e.fname, ' ', e.lname) as name , j.job_desc  from
  employee e join jobs j on  e.job_id = j.job_id 
  where j.job_id = (select job_id from employee where  fname='howard')
 
--Display the employee name and job description of all employees whose are not Managing Editor. 
 select CONCAT(e.fname, ' ', e.lname) as name , j.job_desc  
 from employee e join jobs j on e.job_id = j.job_id 
 where j.job_desc != 'Managing Editor'

