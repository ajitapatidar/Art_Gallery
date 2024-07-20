-- Art_Fallery-- 

Create table paintings(
id int primary key,
name varchar(30),
artist_id int ,
listed_price float);

insert into paintings values(11,'Miracle',1,300.00),
(12,'Sunshine',1,700.00),
(13,'pretty woman',2,2800.00),
(14,'Handsome man',2,2300.00),
(15,'Barbie',3,250.00),
(16,'cool painting',3,5000.00),
(17,'Black square#1000',3,50.00),
(18,'Mountains',4,1300.00);


Create table sales(
id int primary key,
date date,
painting_id int,
artist_id int,
collector_id int,
sales_price float);

desc sales;

insert into sales values(1001,'2021-11-01',13,2,104,2500.00),
(1002,'2021-11-10',14,2,102,2300.00),
(1003,'2021-11-10',11,1,102,300.00),
(1004,'2021-11-15',16,3,103,4000.00),
(1005,'2021-11-22',15,3,103,200.00),
(1006,'2021-11-22',17,3,103,50.00);



Create table artist(
id int primary key,
first_name varchar(20),
Last_name varchar(20));


insert into artist values(1,'Thomas','Black'),
(2,'Kate','Smith'),
(3,'Natali','Wein'),
(4,'Francesco','Benelli');


Create table Collectors(
id int primary key,
first_name varchar(20),
Last_name varchar(20));


insert into collectors values(101,'Brandon','Cooper'),
(102,'Laura','Fisher'),
(103,'Christina','Buffet'),
(104,'Steve','Stevenson');

#Q.1
select name from paintings where listed_price>(select avg(listed_price) from paintings);


#Q.2
select first_name,last_name from collectors
inner join sales
on sales.collector_id=collectors.id;

#Q.3
select 
first_name,last_name,sum(sales_price) from sales
inner join artist
on sales.artist_id=artist.id
group by first_name,last_name
having count(artist_id)>0;

#Q.4
select name as 'list of purchased paintings' from paintings
inner join sales
on paintings.id=sales.painting_id;


#Q.5
select first_name,last_name from artist where id not in(select artist_id from sales);

#Q.6
select name from paintings where listed_price in (select min(listed_price) from paintings);

#Q.7
select painting_id from sales where date between '2021-11-1' and '2021-11-15';

#Q.8
select * from paintings where name like '%n';

#Q.9
select id from collectors where first_name = 'Laura';

#Q.10
select * from sales where artist_id=2;

#Q.11
select count(sales_price) from sales where collector_id=103;

#Q.12
update artist
set first_name='Zika'
where id=3;


#Q.13
alter table collectors change first_name fname varchar(20);
alter table collectors change Last_name lname varchar(20);

#Q.14
delete from paintings where id=18;

#Q.15
truncate sales;


