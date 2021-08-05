create database AddressBook;

use AddressBook;

create table Addressbooktable
(
FirstName varchar(150),
LastName varchar(100),
address varchar(300),
city varchar (50),
state varchar (50),
Zip bigint,
PhoneNumber bigint,
email varchar (300)
)
select *from Addressbooktable;


insert into Addressbooktable values('Vivek','Guntuku','Manthani','pdpl','telangana',505284,'73366','vivek13@gmail.com'),('Pavani','ch','kdp','vzg','Ap',589384,'99599','vivek13@gmail.com'),('Kumar','Guntuku','Manugur','knr','telangana',505184,'75686','kumar35@gmail.com'),('Aditya','sirangi','mdp','sirl','mh',535684,'737866','aditya12@gmail.com');

update Addressbooktable set email = 'pavani21@gmail.com' where FirstName = 'pavani';

insert into Addressbooktable values('Vinay','Gondra','dlsk','hyd','telangana',506374,'70966','vinay3@gmail.com')

Delete from Addressbooktable where FirstName = 'vinay';

use AddressBook;

select FirstName , city from Addressbooktable where city = 'pdpl';

select FirstName , state from Addressbooktable where state = 'telangana';

select count(FirstName) as BookSize from Addressbooktable;

select * from Addressbooktable order by (FirstName) ;


select * from Addressbooktable order by (city) ;

select * from Addressbooktable order by (FirstName) Desc;

alter table Addressbooktable add AddressBookName varchar(100), Type varchar(50); 

select *from Addressbooktable;

update Addressbooktable set AddressBookName = 'Friends' , Type = 'Friend' where FirstName = 'Vivek' or FirstName = 'Kumar';

update Addressbooktable set AddressBookName = 'Family' , Type = 'Cousin' where FirstName = 'Pavani' or FirstName = 'Aditya';

select count(Firstname) as count1 from Addressbooktable where Type = 'Friend';


select count(Firstname) as count2 from Addressbooktable where Type = 'Cousin';

insert into Addressbooktable values('Vivek','G','Bhpl','Warangal','Telangana',600119,'97009','Vivek11@gamil.com','Family','Brother');

select * from Addressbooktable;
-------UC11-------------------

------Creating Table for contact Book Entity-------

create table ContactBook(
AddressBookId int identity(1,1) primary key,
BookName varchar(100));

Insert into ContactBook values ('Family'),('Friends');

select * from ContactBook;

------Creating table for contacts------------

create table ContactPerson (
BookId int FOREIGN KEY REFERENCES ContactBook(AddressBookId),
ContactId int identity(1,1) primary key,
FirstName varchar(150),
LastName varchar(150),
address varchar(200),
city varchar(100),
state varchar(100),
Zip bigint,
PhoneNumber varchar(250),
email varchar(300));

select * from ContactPerson;

set identity_insert ContactPerson OFF;

insert into ContactPerson values (2,'Vivek','G','Bhpl','karimnagar','Telangana',60011,'97009149','vivekg11@gmail.com')

insert into ContactPerson values (2,'kumar','B','hnk','Hanamkonda','Telangana',62021,'97735749','Kumar671@gmail.com'),(1,'Rupa','M','Kdp','seema','Ap',50505,'96762940','rupa13@gmail.com'),(1,'shiva','s','LB Nagar','Ongole','Mh',34562,'987462','SShiva45@gmail.com');

select * from ContactPerson;

----------Creating table for contact Type-------

create table ContactType(
TypeId int identity(1,1) primary key,
TypeName varchar(150));

insert into ContactType values ('Family'),('Friends');

select * from ContactType;

create table Relation(
ContId int foreign key references ContactPerson(ContactId),
TypId int foreign key References ContactType(TypeId));

select * from Relation;

insert into Relation values (3,1),(4,2),(5,1),(6,2);

select BookName, FirstName,LastName,address,city,state,Zip,PhoneNumber,email,TypeName
from ContactBook 
FULL JOIN ContactPerson on ContactBook.AddressBookId = ContactPerson.BookId
FULL JOIN Relation on Relation.ContId = ContactPerson.ContactId
FULL JOIN ContactType on Relation.TypId = ContactType.TypeId

------- Retrieving data based on state-----------
select BookName, FirstName,LastName,address,city,state,Zip,PhoneNumber,email,TypeName
from ContactBook 
INNER JOIN ContactPerson on ContactBook.AddressBookId = ContactPerson.BookId and (state = 'Telangana')
INNER JOIN Relation on Relation.ContId = ContactPerson.ContactId
INNER JOIN ContactType on Relation.TypId = ContactType.TypeId

----------Retrieving Data based on city-----------

select BookName, FirstName,LastName,address,city,state,Zip,PhoneNumber,email,TypeName
from ContactBook 
INNER JOIN ContactPerson on ContactBook.AddressBookId = ContactPerson.BookId and (city = 'Karimnagar')
INNER JOIN Relation on Relation.ContId = ContactPerson.ContactId
INNER JOIN ContactType on Relation.TypId = ContactType.TypeId

--------Retrieving data after sorting alphabetically-------

select BookName, FirstName,LastName,address,city,state,Zip,PhoneNumber,email,TypeName
from ContactBook 
INNER JOIN ContactPerson on ContactBook.AddressBookId = ContactPerson.BookId 
INNER JOIN Relation on Relation.ContId = ContactPerson.ContactId
INNER JOIN ContactType on Relation.TypId = ContactType.TypeId
order by (FirstName)

