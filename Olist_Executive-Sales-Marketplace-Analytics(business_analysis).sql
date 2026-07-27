-----01_Business_Analysis
-------------------------------
-------------------------------
----Top Customers (Highest Revenue)

SELECT TOP 10
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS TotalOrders,
    SUM(p.payment_value) AS TotalSpent
FROM olist_customers_dataset c
JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id
JOIN olist_order_payments_dataset_v2 p
    ON o.order_id = p.order_id
GROUP BY c.customer_unique_id
ORDER BY TotalSpent DESC;


---Top Products

SELECT TOP 10
    oi.product_id,
    COUNT(*) AS UnitsSold,
    SUM(oi.price) Revenue
FROM olist_order_items_dataset oi
GROUP BY oi.product_id
ORDER BY Revenue DESC;

----. Bottom Products
SELECT TOP 10
    oi.product_id,
    COUNT(*) UnitsSold,
    SUM(oi.price) Revenue
FROM olist_order_items_dataset oi
GROUP BY oi.product_id
ORDER BY Revenue ASC;

---Monthly Sales Growth
WITH MonthlySales AS
(
SELECT

YEAR(o.order_purchase_timestamp) SalesYear,

MONTH(o.order_purchase_timestamp) SalesMonth,

SUM(pay.payment_value) Revenue

FROM olist_orders_dataset o

JOIN olist_order_payments_dataset_v2 pay

ON o.order_id=pay.order_id

GROUP BY

YEAR(o.order_purchase_timestamp),

MONTH(o.order_purchase_timestamp)

)

SELECT

*,

Revenue-

LAG(Revenue) OVER(ORDER BY SalesYear,SalesMonth)

AS RevenueGrowth

FROM MonthlySales;

----Year-over-Year Growth
WITH YearSales AS
(
SELECT

YEAR(o.order_purchase_timestamp) SalesYear,

SUM(pay.payment_value) Revenue

FROM olist_orders_dataset o

JOIN olist_order_payments_dataset_v2 pay

ON o.order_id=pay.order_id

GROUP BY YEAR(o.order_purchase_timestamp)

)

SELECT

*,

Revenue-

LAG(Revenue) OVER(ORDER BY SalesYear)

AS YoYGrowth

FROM YearSales;



---Regional Performance
SELECT

c.customer_state,

COUNT(DISTINCT o.order_id) Orders,

SUM(pay.payment_value) Revenue

FROM olist_customers_dataset c

JOIN olist_orders_dataset o

ON c.customer_id=o.customer_id

JOIN olist_order_payments_dataset_v2 pay

ON o.order_id=pay.order_id

GROUP BY c.customer_state

ORDER BY Revenue DESC;


---Customer Retention
SELECT

customer_unique_id,

COUNT(DISTINCT order_id) Orders

FROM olist_customers_dataset c

JOIN olist_orders_dataset o

ON c.customer_id=o.customer_id

GROUP BY customer_unique_id

HAVING COUNT(DISTINCT order_id)>1;



---Repeat Customers
SELECT

COUNT(*) RepeatCustomers

FROM

(

SELECT

customer_unique_id

FROM olist_customers_dataset c

JOIN olist_orders_dataset o

ON c.customer_id=o.customer_id

GROUP BY customer_unique_id

HAVING COUNT(order_id)>1

)t;

-----ABC Analysis
WITH ProductRevenue AS
(
SELECT

product_id,

SUM(price) Revenue

FROM olist_order_items_dataset

GROUP BY product_id
)

SELECT

*,

SUM(Revenue) OVER(ORDER BY Revenue DESC)

RunningRevenue

FROM ProductRevenue;

----Pareto Analysis (80/20)
WITH Sales AS
(
SELECT

product_id,

SUM(price) Revenue

FROM olist_order_items_dataset

GROUP BY product_id
)

SELECT

*,

100.0*

SUM(Revenue) OVER(ORDER BY Revenue DESC)

/

SUM(Revenue) OVER()

AS CumulativePercent

FROM Sales;

---RFM Analysis
SELECT
customer_unique_id,

DATEDIFF(day,

MAX(order_purchase_timestamp),

GETDATE()) Recency,

COUNT(o.order_id) Frequency,

SUM(payment_value) Monetary

FROM olist_customers_dataset c

JOIN olist_orders_dataset o

ON c.customer_id=o.customer_id

JOIN olist_order_payments_dataset_v2 p

ON o.order_id=p.order_id

GROUP BY customer_unique_id;

----Basket Analysis (Basic)
SELECT

oi1.product_id ProductA,

oi2.product_id ProductB,

COUNT(*) TimesBoughtTogether

FROM olist_order_items_dataset oi1

JOIN olist_order_items_dataset oi2

ON oi1.order_id=oi2.order_id

AND oi1.product_id<oi2.product_id

GROUP BY

oi1.product_id,

oi2.product_id

ORDER BY TimesBoughtTogether DESC;



---Running Total
SELECT

order_purchase_timestamp,

SUM(payment_value)

OVER(

ORDER BY order_purchase_timestamp

ROWS UNBOUNDED PRECEDING

) RunningRevenue

FROM olist_orders_dataset o

JOIN olist_order_payments_dataset_v2 p

ON o.order_id=p.order_id;



