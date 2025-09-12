create table restaurants(
id int primary key,
name varchar(20)not null,
lacation varchar(39)not null);

create  table orders(
order_id int primary key,
restaurant_id int not null,
order_dayte int not null);

insert into restaurants (id,name,lacation) values(1,'abcBistro','newyork'),
(2,'the foodies','los angeles'),(3,'tastytrear','chikago');

insert into orders (order_id,restaurant_id,order_dayte) values(1,1,2023-01-01),
(2,1,2023-01-02),(3,2,2023-01-05),(4,4,2023-01-07);

select * from restaurants;
select * from orders;

select r.name ,o.order_dayte from restaurants r inner join orders o on r.id=o.restaurant_id;

select r.name,o.order_dayte from restaurants r left join orders o on r.id=o.restaurant_id;
select r.name,o.order_dayte from restaurants r right join orders o on r.id = o.restaurant_id;
 
 create table employee(
 id int primary key,
 name varchar(18) not null,
 manager_id int null);
 insert into employee values (1,'alice',3),(2,'bob',3),(3,'charlie',null),(4,'diana',3)
 select *from employee

 select e.name as employee_name,m.name as manager_name from employee e left join employee m on e.manager_id=m.id
