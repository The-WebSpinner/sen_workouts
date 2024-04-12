use [SQL-Training]

--Find the total number of books in ‘Business’ type.
select count(title) as [total books in Business type] from Titles where type = 'business'

 --Display the published date for this book ‘Life Without Fear’.
select pub_date  as [published date] from Titles where title = 'Life Without Fear'

--Display all the books title published by ‘Binnet & Hardley’.
select t.title as [Books by Binnet & Hardley] from publishers p join Titles t on p.pub_id = t.pub_id 
where pub_name = 'Binnet & Hardley' 

--Find the authors first name and last name for this book ‘Straight Talk About Computers’.

 select au_fname as [First name]  , au_lname as [ Last Name]  from authors 
 where au_id = (Select au_id from titleauthor where title_id = (select title_id from Titles where 
 title= 'Straight Talk About Computers') )

 select  au_fname as [First name]  , au_lname as [ Last Name] from titleauthor t 
 join authors a 
 on  t.au_id = a.au_id
 join  titles ts 
 on t.title_id = ts.title_id 
 where ts.title = 'Straight Talk About Computers' 

 









