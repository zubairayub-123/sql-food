create database restaurant;
use restaurant;

create table hotel(
hotel_id int not null primary key,
hotel_name varchar(100) not null,
hotel_loc varchar(100) not null,
foreign key (hotel_id) references menu (hotel_id)
);
drop table hotel;
insert into hotel values(1,"Andhra Spicy Hotel","Proddatur");
insert into hotel values(2,"Tilak Tiffin centre","Proddatur");
insert into hotel values(3,"Anand Bhavan Veg","Kadapa");
insert into hotel values(4,"Chennuru Biriyani","Proddatur");
insert into hotel values(5,"Chennuru Dum Biriyani","Mydukur");
insert into hotel values(6,"Ayub Family Restaurant","Kadapa");

select * from hotel;

create table menu(
hotel_id int primary key,
item1 varchar(30) not null,
item2 varchar(30) not null,
item3 varchar(30) not null,
item4 varchar(30) not null,
item5 varchar(30) not null
);
insert into menu values(1,"Chicken Biriyani","Egg Biriyani","Mutton Biriyani","Curd Rice","Full meals");
insert into menu values(2,"Dosa","Idly","Poori","Pongal","Upma");
insert into menu values(3,"Full meals","Dal rice","Tiger rice","Curd Rice","Chapati");
insert into menu values(4,"Chennuru Biriyani","Egg Biriyani","Mutton Biriyani","Khushka","Lemon rice");
insert into menu values(5,"Chicken dham Biriyani","Egg Biriyani","Mutton Biriyani","Khushka","Tomato rice");
insert into menu values(6,"Chicken Biriyani","Egg Biriyani","Mutton Biriyani","Fish Biriyani","Roti");

select * from menu;

create table customer(
hotel_id int,
cus_id int not null primary key,
cus_name varchar(30) not null,
cus_loc varchar(30) not null,
cus_order varchar(30) not null,
foreign key (cus_id) references menu (hotel_id),
foreign key (cus_id) references hotel (hotel_id)
);
insert into customer values(1,1,"abc","Proddatur","Egg Biriyani");
insert into customer values(3,2,"def","Kadapa","Full meals");
insert into customer values(2,3,"ghi","Proddatur","Dosa");
insert into customer values(2,4,"jkl","Proddatur","Poori");
insert into customer values(5,5,"jkl","Proddatur","Chicken Dum Biriyani");

create table orders(
order_id int primary key not null,
cus_id int not null,
hotel_id int not null,
foreign key (order_id) references hotel (hotel_id),
foreign key (order_id) references menu (hotel_id),
foreign key (order_id) references customer (cus_id)
);

insert into orders values(1,2,1);
insert into orders values(2,1,1);
insert into orders values(3,2,1);

select * from orders;


-- Find all restaurants near to your current location --  

select hotel_name from hotel  where hotel_loc="Kadapa";

-- Load entire menu for particular restaurant --  
select d.hotel_id,
d.item1,d.item2,d.item3,d.item4,d.item5,
e.hotel_name
from menu d
join hotel e
on d.hotel_id=e.hotel_id
where e.hotel_id=3;

--  Place an order for selected customer -- 

select * 
from menu d
join orders o
on o.order_id=d.hotel_id
join customer c
on c.cus_id=o.order_id
where c.cus_id=1;
select * from menu m join customer c on m.hotel_id=c.cus_id where c.cus_id=1;

--  Find order history for selected customer -- 

select c.cus_name,c.cus_order,
o.order_id
from customer c
join orders o
on c.cus_id=o.order_id
where c.cus_id ;





select d.hotel_name,
c.cus_name,
c.cus_loc,
c.cus_order
from hotel d
join customer c
on c.hotel_id=d.hotel_id;

select hotel_loc from hotel where hotel_id=4;

select d.hotel_name,
e.cus_loc
from hotel d
join customer e
on d.hotel_id=e.hotel_id;


select e.hotel_name,d.item1,d.item2,d.item3,d.item4,d.item5
from hotel e
join menu d
on e.hotel_id=d.hotel_id
join customer f
on e.hotel_id=f.hotel_id
where cus_id=4;


