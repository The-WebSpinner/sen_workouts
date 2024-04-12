use [trainingdb]

create table simplecms (
	userId int IDENTITY(1,1) NOT NULL,
	userName  varchar(150) NOT NULL,
	pwd varchar(150) NOT NULL,
	Role varchar (150) NOT NULL
)


INSERT INTO simplecms ( userName, pwd, Role )
VALUES ('senthil', '123','Admin'),
		('SK', '123','Editor'),
		('yoshva', '123','User')

create table list(
	
	ID int IDENTITY(1,1) NOT NULL,
	Name [varchar](150) NULL,
	Description varchar(150) NULL)
	
select * from list
select * from simplecms

