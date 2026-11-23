select count(*) as total
from customers;
select *
from customers;
select count(DISTINCT country)
from customers;
--- totalk revenue accross all orders till now
select sum(quantity * unit_price) as total
from order_items;
--avg price of product accross all products
select round(avg(price), 2) as avg_price
from products;
select *
from products;
select sum(price * 1.0) / count(product_id)
from products;
-- min max price accross products
select min(price) as minimum,
    max(price) as maximum
from products;
select price as minimum
from products
order by price asc
limit 1;
select count(*) as total_product,
    sum(stock_quantity) as total_stock,
    min(Price) as minimum,
    max(price) as maximum,
    avg(price) as average
from products;