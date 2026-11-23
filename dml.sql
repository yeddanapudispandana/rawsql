INSERT INTO customers (
        first_name,
        last_name,
        email,
        phone,
        city,
        country
    )
VALUES (
        'John',
        'Doe',
        'john.doe@gmail.com',
        '9999999999',
        'Mumbai',
        'India'
    );
SELECT *
FROM categories;
INSERT INTO categories (category_name, description)
VALUES ('Dairy', 'Dairy products'),
    ('Gym', 'Gym products'),
    ('Cold drinks', 'cold drinks description');
SELECT *
FROM products;
UPDATE products
SET stock_quantity = 50
WHERE product_id = 1;
update products
set is_active = false;
select *
from orders;
select *
from order_items;
select *
from order_items
where order_id = 2;