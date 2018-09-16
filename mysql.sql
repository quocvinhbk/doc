use test_app_development;

/*
 create table customers (id int not null, firstname varchar(30), lastname varchar(30), 
                        gender varchar(1),
                        age int,
                        city varchar(30), state varchar(30),
                        primary key (id),
                        updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
                        created_at TIMESTAMP NOT NULL DEFAULT NOW(); );
 explain customers;
 insert into customers ( id, firstname, lastname, city, state) 
values 
(10101, 'John', 'Gray', 'M', 'Lynden', 'Washington'),
(10298, 'Leroy', 'Brown', 'M', 'Pinetop', 'Arizona'),
(10299, 'Elroy', 'Keller', 'M', 'Snoqualmie', 'Washington'),
(10315, 'Lisa', 'Jones', 'M', 'Oshkosh', 'Wisconsin'),
(10325, 'Ginger', 'Schultz', 'M', 'Pocatello', 'Idaho'),
(10329, 'Kelly', 'Mendoza', 'M', 'Kailua', 'Hawaii'),
(10330, 'Shawn', 'Dalton', 'M', 'Cannon Beach', 'Oregon'),
(10338, 'Michael', 'Howell', 'M', 'Tillamook', 'Oregon'),
(10339, 'Anthony', 'Sanchez', 'F', 'Winslow', 'Arizona'),
(10408, 'Elroy', 'Cleaver', 'F', 'Globe', 'Arizona'),
(10410, 'Mary Ann', 'Howell', 'F', 'Charleston', 'South Carolina'),
(10413, 'Donald', 'Davids', 'F', 'Gila Bend', 'Arizona'),
(10419, 'Linda', 'Sakahara', 'F', 'Nogales', 'Arizona'),
(10429, 'Sarah', 'Graham', 'F', 'Greensboro', 'North Carolina'),
(10438, 'Kevin', 'Smith', 'F', 'Durango', 'Colorado'),
(10439, 'Conrad', 'Giles', 'F', 'Telluride', 'Colorado'),
(10449, 'Isabela', 'Moore', 'F', 'Yuma', 'Arizona');
select * from customers;
*/

/*
create table items_ordered (id int not null AUTO_INCREMENT, customer_id int, order_date date, item varchar(255), quantity int, price float,
                            PRIMARY KEY (id),
                            index cus_ind (customer_id),
                            foreign key (customer_id) REFERENCES customers(id) );
explain items_ordered;


insert into items_ordered (customer_id, order_date, item, quantity, price)
values
(10330, '1999-07-30', 'Pogo stick', 1, 28.00),
(10101, '1999-07-30', 'Raft', 1, 58.00),
(10298, '1999-07-01', 'Skateboard', 1, 33.00),
(10101, '1999-07-01', 'Life Vest', 4, 125.00),
(10299, '1999-07-06', 'Parachute', 1, 1250.00),
(10339, '1999-07-27', 'Umbrella', 1, 4.50),
(10449, '1999-08-13', 'Unicycle', 1, 180.79),
(10439, '1999-08-14', 'Ski Poles', 2, 25.50),
(10101, '1999-08-18', 'Rain Coat', 1, 18.30),
(10449, '1999-09-01', 'Snow Shoes', 1, 45.00),
(10439, '1999-09-18', 'Tent', 1, 88.00),
(10298, '1999-09-19', 'Lantern', 2, 29.00),
(10410, '1999-10-28', 'Sleeping Bag', 1, 89.22),
(10438, '1999-11-01', 'Umbrella', 1, 6.75),
(10438, '1999-11-02', 'Pillow', 1, 8.50),
(10298, '1999-12-01', 'Helmet', 1, 22.00),
(10449, '1999-12-15', 'Bicycle', 1, 380.50),
(10449, '1999-12-22', 'Canoe', 1, 280.00),
(10101, '1999-12-30', 'Hoola Hoop', 3, 14.75),
(10330, '2000-01-01', 'Flashlight', 4, 28.00),
(10101, '2000-01-02', 'Lantern', 1, 16.00),
(10299, '2000-01-18', 'Inflatable Mattress', 1, 38.00),
(10438, '2000-01-18', 'Tent', 1, 79.99),
(10413, '2000-01-19', 'Lawnchair', 4, 32.00),
(10410, '2000-01-30', 'Unicycle', 1, 192.50),
(10315, '2000-02-02', 'Compass', 1, 8.00),
(10449, '2000-02-29', 'Flashlight', 1, 4.50),
(10101, '2000-03-08', 'Sleeping Bag', 2, 88.70),
(10298, '2000-03-18', 'Pocket Knife', 1, 22.38),
(10449, '2000-03-19', 'Canoe paddle', 2, 40.00),
(10298, '2000-04-01', 'Ear Muffs', 1, 12.50),
(10330, '2000-04-19', 'Shovel', 1, 16.75)
;
select * from items_ordered;

*/
/* sql AGGREGATE
select distinct customer_id from items_ordered;
select customer_id, item, price from items_ordered where customer_id = 10449;
select * from items_ordered where item = "Tent";
select customer_id, order_date, item from items_ordered where item like "S%";
select distinct item from items_ordered;
select AVG(price) from items_ordered where item = 'Tent';
select COUNT(*) from items_ordered where item = 'Tent';
select count(*) from items_ordered;
select COUNT(DISTINCT customer_id) from i;

select max(price) from items_ordered;
select avg(price) from items_ordered where order_date like '%-12-%';
select count(*) from items_ordered;
select count(distinct item) from items_ordered where order_date like '1999-%-%';
select min(price) from items_ordered where item like 'Tent';

*/

/* GROUP

select * from items_ordered;
select item, max(price) from items_ordered GROUP by item;
select item, max(price), order_date from items_ordered group by order_date, item;
select state, count(*) from customers group by state;
select item, max(price), min(price) from items_ordered group by item;
select customer_id, count(*) from items_ordered group by customer_id;
select customer_id, count(*), sum(price) from items_ordered group by customer_id;
select customer_id, count(customer_id), sum(price) from items_ordered group by customer_id;
*/

/* HAVING
select customer_id, max(price) from items_ordered group by customer_id HAVING max(price) > 100;
select state, count(state) from customers group by state having count(state) > 1;
select item, max(price), min(price) from items_ordered group by item having max(price) > 190.0;
select customer_id, count(customer_id), sum(price), sum(quantity) from items_ordered group by customer_id having sum(quantity) > 1;
*/

/* ORDER BY
select * from items_ordered ORDER BY quantity ASC;
select firstname, lastname, city from customers order by lastname ASC;
select firstname, lastname, city from customers order by lastname DESC;
select item, price from items_ordered where price > 10.00 order by price ASC;
select customer_id, order_date, item from items_ordered where item <> 'Snow Shoes' AND item <> 'Ear Muffs';

select item, price from items_ordered where item like 'S%' or item like 'P%' or item like 'F%' order by item ASC ;
*/

/* IN and BETWEEN
SELECT col1, SUM(col2) FROM "list-of-tables"
WHERE col3 IN (list-of-values);

select item, sum(quantity) from items_ordered where order_date BETWEEN '1999-01-01' and '1999-12-31' group by item order by item ASC;
select order_date, item, price from items_ordered where price between 10.00 and 80.00;
select firstname, city, state from customers where state in ('Arizona', 'Washington', 'Oklahoma', 'Colorado', 'Hawaii');
select item, price/quantity from items_ordered;
*/

/*  table JOIN

SELECT customer_info.firstname, customer_info.lastname, purchases.item
FROM customer_info, purchases
WHERE customer_info.customer_number = purchases.customer_number;

SELECT customer_info.firstname, customer_info.lastname, purchases.item
FROM customer_info INNER JOIN purchases
ON customer_info.customer_number = purchases.customer_number;

select customers.lastname, customers.state, items_ordered.item,items_ordered.quantity, items_ordered.price
from customers, items_ordered
where customers.id = items_ordered.customer_id order by lastname, item ASC;
select customers.lastname, customers.state, items_ordered.item,items_ordered.quantity, items_ordered.price
from customers inner join items_ordered
where customers.id = items_ordered.customer_id order by lastname, item ASC;

select customer_id, sum(price) from items_ordered group by customer_id;

select customers.lastname, customers.state, sum(items_ordered.price)
from customers inner join items_ordered
where customers.id = items_ordered.customer_id group by items_ordered.customer_id;
*/

