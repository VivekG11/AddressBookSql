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