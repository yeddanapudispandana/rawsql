select *
from products
where category_id = 1
    OR category_id = 2;
-- get product whopse name starts with wireless
select *
from products
WHERE product_name like '%Wireless%';
--customer who dont have phone numbers
select *
from customers
where phone IS null;
select *
from customers
where phone IS not null;
select first_name,
    last_name,
    COALESCE(phone, 'NA') as phone_num,
    COALESCE(city, 'NA')
from customers;
--sorting and filtering
--products cheapest to most expensive
select *
from products
order by price asc;
--products from ch eap to expensive in each actegory
select *
from products
order by category_id,
    price;
--give top 5 m,ost expensie product
select *
from products
order by price desc
LIMIT 5;
--give all orders including emp details of th eemployee who processed that oere
-- only include orders punched by emp
select *
from orders as o
    inner join emp as e on o.emp_id = e.emp_id;
--give all orders including emp details of th eemployee who processed that oere
-- include the one who cust processed by themselves
select o.status,
    o.order_id,
    e.email,
    e.first_name
from orders as o
    left join emp as e on o.emp_id = e.emp_id;
select o.status,
    o.order_id,
    e.email,
    e.first_name
from orders as o
    right join emp as e on o.emp_id = e.emp_id;
select o.status,
    o.order_id,
    e.email,
    e.first_name
from orders as o
    full outer join emp as e on o.emp_id = e.emp_id;
select o.status,
    o.order_id,
    e.email,
    e.first_name
from orders as o
    right join emp as e on o.emp_id = e.emp_id;
--customers who did not place any order
select *
from customers as c left payment_methodjoin orders as o on o.customer_id = c.customer_id
where o.order_id is null;
--orderes that have not been paid
select o.order_id,
    o.status,
    p.payment_id,
    p.status
from orders as o
    left join payments as p on o.order_id = p.order_id
where p.payment_id is null;
-- info about all orders that are in the db
-- include info abou order_items, product, customer and category the product belongs to
select o.order_if,
    o.status,