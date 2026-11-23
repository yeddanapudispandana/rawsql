--- total number of products in each category
select category_id,
    count(*)
from products
group by category_id;
--- total number of products in each category and include cat name 
select p.category_id,
    c.category_name,
    count(*)
from products as p
    left join categories as c on p.category_id = c.category_id
group by p.category_id,
    c.category_name
order by p.category_id asc;
--mention active inactive status fro each category
select p.category_id,
    c.category_name,
    p.is_active,
    count(*)
from products as p
    left join categories as c on p.category_id = c.category_id
group by p.category_id,
    c.category_name,
    p.is_active
order by p.category_id asc;
-- only show category with count above 5
--adding a filter on aggregration, having clause
select category_id,
    count(*)
from products
group by category_id
having count(*) > 5;
--find dept havin g more than 1 employee
-- where their combined salary of teh whole dept exceeds 200000 rupees
select *
from dept;
select *
from emp;
--- wrong ex, this just excludes teh dept with dept_id = 1
select d.dept_name,
    sum(e.salary) as total_sal
from dept as d
    left join emp as e on d.dept_id = e.dept_id
where e.dept_id > 1
group by d.dept_name
having sum(e.salary) > 20000;
select d.dept_name,
    count(*),
    sum(e.salary) as total_sal
from dept as d
    left join emp as e on d.dept_id = e.dept_id
group by d.dept_name
having sum(e.salary) > 20000
    and count(*) > 1;