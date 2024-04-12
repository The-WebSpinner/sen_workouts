use [SQL-Training]

 --Display the maximum and minimum price of the book. 
select max(price) as Maximum_price , min(price) as Minimum_price from Titles

 --Display the total book price for each type.
 SELECT  type,sum(price) as [total price for each type] FROM Titles GROUP BY type

  --Find out the Publisher for the following books 
  -- ‘Cooking with Computers: Surreptitious Balance Sheets’, 
  -- ‘Silicon Valley Gastronomic Treats’, 
  -- ‘Is Anger the Enemy?’, 
  -- ‘Fifty Years in Buckingham Palace Kitchens’.

  select  t.title as Books, p.pub_name as Publishers from  publishers p join Titles t 
  on p.pub_id = t.pub_id where title in 
  ('Cooking with Computers: Surreptitious Balance Sheets','Silicon Valley Gastronomic Treats','Is Anger the Enemy?',
  'Fifty Years in Buckingham Palace Kitchens')

  select  t.title as Books, p.pub_name as Publishers from  publishers p join Titles t 
  on p.pub_id = t.pub_id where title = 'Cooking with Computers: Surreptitious Balance Sheets' or
	title = 'Silicon Valley Gastronomic Treats' or  title = 'Is Anger the Enemy?' or 
	title = 'Fifty Years in Buckingham Palace Kitchens'


