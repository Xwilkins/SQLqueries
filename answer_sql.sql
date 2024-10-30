use ot;
select * from employees;
select * from customers;
select * from order_items;
select * from products;
select * from orders;
select * from product_categories;
select * from inventories;
select * from warehouses;

#1
SELECT e.employee_id, e.first_name, e.last_name, SUM(oi.quantity * oi.unit_price) AS total_sales_revenue
FROM employees as e
JOIN orders as o ON e.employee_id = o.salesman_id
JOIN order_items as oi ON o.order_id = oi.order_id
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY total_sales_revenue DESC;

#2
select customer_id, name, credit_limit from customers
order by credit_limit desc
limit 5;

#3
select p.product_name, pc.category_name, w.warehouse_name, sum(i.quantity) as total_quantity from products as p
join product_categories as pc ON p.category_id = pc.category_id
join inventories as i ON p.product_id = i.product_id
join warehouses as w on i.warehouse_id = w.warehouse_id
GROUP BY p.product_name, pc.category_name, w.warehouse_name
ORDER BY p.product_name, w.warehouse_name;

#4
select c.*, o.status from customers as c
join orders as o on c.customer_id = o.customer_id
where o.status = 'Pending' or o.status = 'Canceled';

#5
