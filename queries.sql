-- Top 10 customers by total spend
SELECT c.customer_id, c.customer_name, SUM(oi.price * oi.quantity) AS total_spent
FROM ecom_customers c
JOIN ecom_orders o ON c.customer_id = o.customer_id
JOIN ecom_order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- Monthly sales trend
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month, SUM(oi.price * oi.quantity) AS revenue
FROM ecom_orders o
JOIN ecom_order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- Best-selling products
SELECT p.product_id, p.product_name, SUM(oi.quantity) AS total_units_sold
FROM ecom_products p
JOIN ecom_order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_units_sold DESC
LIMIT 10;
