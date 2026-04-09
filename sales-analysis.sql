-- Create customers table
CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    region VARCHAR(50)
);

-- Create sales table
CREATE TABLE sales (
    order_id INT,
    customer_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

-- Insert customers data
INSERT INTO customers VALUES
(1, 'John', 'East'),
(2, 'Mary', 'West'),
(3, 'David', 'East'),
(4, 'Sarah', 'North');

-- Insert sales data
INSERT INTO sales VALUES
(101, 1, 'Laptop', 1200, '2024-01-10'),
(102, 2, 'Phone', 800, '2024-01-12'),
(103, 1, 'Tablet', 300, '2024-01-15'),
(104, 3, 'Laptop', 1200, '2024-01-18'),
(105, 4, 'Phone', 800, '2024-01-20');

-- Total revenue
SELECT SUM(amount) AS total_revenue 
FROM sales;

-- Revenue by region
SELECT c.region, SUM(s.amount) AS revenue
FROM sales s
JOIN customers c 
ON s.customer_id = c.customer_id
GROUP BY c.region;

-- Top-selling product
SELECT product, COUNT(*) AS total_sales
FROM sales
GROUP BY product
ORDER BY total_sales DESC;

-- Customer spending
SELECT c.customer_name, SUM(s.amount) AS total_spent
FROM sales s
JOIN customers c 
ON s.customer_id = c.customer_id
GROUP BY c.customer_name;
