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