 
 -- Nama: Dea Claresta

 create database Gramedea
 use Gramedea

 create table Author(			--table ini dibuat agar query dapat dijalankan
	[Name] varchar(255) ,
	[Address] varchar(255),
	[URL] varchar(255) ,
	primary key([Name],[Address]),

 )

 Create table Publisher(		--table ini dibuat agar query dapat dijalankan
	[Name] varchar(255) primary key,
	[Address] varchar(255) ,
	Phone varchar(255) ,
	[URL] int ,

 )
 
 -- NO 1a
-- (DDL CREATE with integrity constraint) Tuliskan perintah membuat tabel Customer, ShoppingBasket, ShoppingBasketBook, dan Book yang dilengkapi definisi Required Data (Mandatory), Primary Key (Entity Integrity), Foreign Key (Referential Integrity), dan Domain Constraint, dimana:
--•	ID ShoppingBasket diawali huruf P dan diikuti dengan 11 karakter angka, misal: P20190418001
--•	Year harus lebih besar atau sama dengan 2000
--•	Price antara 10.000 sampai 1.0000

 create table Customer(
	Email varchar(255) primary key,
	[Name] varchar(255) ,
	Phone varchar(255) ,
	[Address] varchar(255) ,
 )
 
 create table ShoppingBasket(
	ID varchar(255)  primary key check (ID like 'P[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CustomerEmail varchar(255)  foreign key references Customer(Email) ,
 )
  create table Book(
	ISBN varchar(255) primary key ,
	PublisherName varchar(255)   ,
	AuthorName varchar(255) ,
	AuthorAddress varchar(255) ,
	[Year] int  check([Year] >=2000),
	Title varchar(255)  ,
	Price numeric(19,0) check (Price >10000 and Price <100000),
	foreign key (AuthorName,AuthorAddress) references Author([Name],[Address]),
	foreign key(PublisherName)references Publisher([Name]),
 )

 create table ShoppingBasketBook(
	ShoppingBasketID varchar(255),
	BookISBN varchar(255),
	[count] int,
	constraint PKSBB primary key (BookISBN,ShoppingBasketID),
	constraint FK foreign key(ShoppingBasketID) references ShoppingBasket(ID),
	constraint FK2 foreign key(BookISBN) references Book(ISBN),

 )

 -- delete seluruh isi data table
 delete from Customer
 delete from Book
 delete from ShoppingBasket
 delete from ShoppingBasketBook
 delete from Publisher
 delete from Author

 --No 1b
--(DML INSERT) Masukkan masing-masing 5 record untuk tabel Customer, ShoppingBasket, 
--ShoppingBasketBook, dan Book

 insert into Customer values('doni@gmail.com','Doni','012345678','Jl. Merpati cipeyem no 3')
 insert into Customer values('siti@gmail.com','Siti','023456781','Jl. Dara cipeyem no 5')
 insert into Customer values('budi@gmail.com','Budi','034567823','Jl. Beo cipeyem no 7')
 insert into Customer values('nina@gmail.com','Nina','045678234','Jl. Gereja cipeyem no 6')
 insert into Customer values('lisa@gmail.com','Lisa','056782345','Jl. Garuda cipeyem no 9')

 insert into ShoppingBasket values('P12345678912','doni@gmail.com')
 insert into ShoppingBasket values('P23456789123','siti@gmail.com')
 insert into ShoppingBasket values('P34567891234','budi@gmail.com')
 insert into ShoppingBasket values('P45678912345','doni@gmail.com')
 insert into ShoppingBasket values('P56789123456','lisa@gmail.com')

 			--insert Publisher dan Author agar query dapat dijalankan
 insert into Publisher values('Gramedea Publisher','ea','123','1')
 insert into Author values('Mr. Winardjo darie','Jl. Purworedjo Sukabumi no 9','1b')
 insert into Author values('Ms. Dulandari Putri','Jl. Purworedjo Sukabintang no 2','1v')
 insert into Author values('Ms. Putri Dandie','Jl. Purworedjo Sukabulan no 3','1c')
 insert into Author values('Mr. Putra liem','Jl. Purworedjo Sukapluto no 6','1x')
 insert into Author values('Mr. Arie darie','Jl. Purworedjo Sukaneptunus no 9','1z')


 insert into Book values('234432231','Gramedea Publisher','Mr. Winardjo darie','Jl. Purworedjo Sukabumi no 9','2000','Indahnya Indonesiaku','23000')
 insert into Book values('234432232','Gramedea Publisher','Ms. Dulandari Putri','Jl. Purworedjo Sukabintang no 2','2001','Indahnya Bintangku','25000')
 insert into Book values('234432233','Gramedea Publisher','Ms. Putri Dandie','Jl. Purworedjo Sukabulan no 3','2001','Indahnya Bulanku','37000')
 insert into Book values('234432234','Gramedea Publisher','Mr. Putra liem','Jl. Purworedjo Sukapluto no 6','2003','Indahnya Plutoku','43000')
 insert into Book values('234432235','Gramedea Publisher','Mr. Arie darie','Jl. Purworedjo Sukaneptunus no 9','2004','Indahnya Neptunusku','73000')


 insert into ShoppingBasketBook values('P12345678912','234432231','1')
 insert into ShoppingBasketBook values('P12345678912','234432232','2')
 insert into ShoppingBasketBook values('P23456789123','234432233','1')
 insert into ShoppingBasketBook values('P23456789123','234432234','1')
 insert into ShoppingBasketBook values('P23456789123','234432235','2')

 --NO 1c
--(DML UPDATE) Tuliskan perintah untuk mengubah Price di tabel Book dengan kenaikan 
--sebesar 5%.

-- Print sebelum diubah value nya
 update Book set Price = ((105.0/100.0) *Price)
-- Print sesudah diubah value nya
 select * from Book



 --NO 1d
--(DML UPDATE) Tuliskan perintah untuk mengubah nomor telephone Doni menjadi '021123123'

-- Print sebelum diubah value nya
 select *from Customer where Email ='doni@gmail.com'

-- Print sesudah diubah value nya
 update Customer set Phone = '021123123' where Email ='doni@gmail.com'
 select *from Customer where Email ='doni@gmail.com'


 
 --NO 1e
--(DML DELETE) Hapus data customer dengan email 'nina@gmail.com'

-- Print sebelum hapus data
 select *from Customer
 delete from Customer where email= 'nina@gmail.com'
 -- Print sesudah hapus data
 select *from Customer


