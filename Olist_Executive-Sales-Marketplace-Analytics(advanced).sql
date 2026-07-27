----02_Advanced_
------------------------------
------------------------------
----Window Functions
SELECT
product_id,

SUM(price) Revenue,

RANK()

OVER(

ORDER BY SUM(price) DESC

) ProductRank

FROM olist_order_items_dataset

GROUP BY product_id;

--CTE
WITH ProductSales AS
(
SELECT

product_id,

SUM(price) Revenue

FROM olist_order_items_dataset

GROUP BY product_id
)

SELECT *

FROM ProductSales

WHERE Revenue>10000;

---View

CREATE VIEW vw_ProductSales
AS
SELECT

product_id,

SUM(price) Revenue

FROM olist_order_items_dataset

GROUP BY product_id;

---Stored Procedure
CREATE PROCEDURE usp_TopProducts

@Top INT

AS

BEGIN

SELECT TOP(@Top)

product_id,

SUM(price) Revenue

FROM olist_order_items_dataset

GROUP BY product_id

ORDER BY Revenue DESC;

END;

----TopProducts 20
EXEC usp_TopProducts 20;

---Ranking
SELECT

product_id,

SUM(price) Revenue,

DENSE_RANK()

OVER(ORDER BY SUM(price) DESC)

Ranking

FROM olist_order_items_dataset

GROUP BY product_id;

---Percentiles
SELECT

product_id,

SUM(price) Revenue,

PERCENT_RANK()

OVER(ORDER BY SUM(price))

Percentile

FROM olist_order_items_dataset

GROUP BY product_id;

---Pivot
SELECT *

FROM

(

SELECT

YEAR(order_purchase_timestamp) SalesYear,

customer_state,

payment_value

FROM olist_orders_dataset o

JOIN olist_customers_dataset c

ON o.customer_id=c.customer_id

JOIN olist_order_payments_dataset_v2 p

ON o.order_id=p.order_id

)t

PIVOT

(

SUM(payment_value)

FOR customer_state IN

([SP],[RJ],[MG],[PR])

)p;


----Recursive CTE
WITH Numbers AS

(

SELECT 1 Number

UNION ALL

SELECT Number+1

FROM Numbers

WHERE Number<12

)

SELECT *

FROM Numbers

OPTION(MAXRECURSION 12);

----Temp Table

SELECT
product_id,

SUM(price) Revenue

INTO #TopProducts

FROM olist_order_items_dataset

GROUP BY product_id;

SELECT *

FROM #TopProducts

ORDER BY Revenue DESC;

DROP TABLE #TopProducts;
