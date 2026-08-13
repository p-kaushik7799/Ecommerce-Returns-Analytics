-- Overall business performance
SELECT
    COUNT(*) AS total_orders,
    SUM(isreturned) AS returned_orders,
    ROUND(AVG(isreturned) * 100, 2) AS return_rate,
    ROUND(SUM(totalamount), 2) AS total_sales,
    ROUND(AVG(totalamount), 2) AS average_order_value
FROM ecommerce_orders;

-- Return rate by product category
SELECT
    productcategory,
    COUNT(*) AS total_orders,
    SUM(isreturned) AS returned_orders,
    ROUND(AVG(isreturned) * 100, 2) AS return_rate
FROM ecommerce_orders
GROUP BY productcategory
ORDER BY return_rate DESC;

-- Return rate by customer segment
SELECT
    customersegment,
    COUNT(*) AS total_orders,
    SUM(isreturned) AS returned_orders,
    ROUND(AVG(isreturned) * 100, 2) AS return_rate
FROM ecommerce_orders
GROUP BY customersegment
ORDER BY return_rate DESC;

-- Return rate by location
SELECT
    customerlocation,
    COUNT(*) AS total_orders,
    SUM(isreturned) AS returned_orders,
    ROUND(AVG(isreturned) * 100, 2) AS return_rate,
    ROUND(AVG(totalamount), 2) AS average_order_value
FROM ecommerce_orders
GROUP BY customerlocation
ORDER BY return_rate DESC;

-- Discount vs returns
SELECT
    discount_category,
    COUNT(*) AS total_orders,
    SUM(isreturned) AS returned_orders,
    ROUND(AVG(isreturned) * 100, 2) AS return_rate
FROM
(
    SELECT
        CASE
            WHEN discountapplied = 0 THEN 'No Discount'
            WHEN discountapplied <= 0.10 THEN 'Low Discount'
            WHEN discountapplied <= 0.20 THEN 'Medium Discount'
            ELSE 'High Discount'
        END AS discount_category,
        isreturned
    FROM ecommerce_orders
) AS categorized_orders
GROUP BY discount_category
ORDER BY return_rate DESC;

-- Delivery time vs return rate
SELECT
    CASE
        WHEN deliverytimedays <= 3 THEN '1-3 Days'
        WHEN deliverytimedays <= 6 THEN '4-6 Days'
        ELSE '7+ Days'
    END AS delivery_category,
    COUNT(*) AS total_orders,
    SUM(isreturned) AS returned_orders,
    ROUND(AVG(isreturned) * 100, 2) AS return_rate
FROM ecommerce_orders
GROUP BY
    CASE
        WHEN deliverytimedays <= 3 THEN '1-3 Days'
        WHEN deliverytimedays <= 6 THEN '4-6 Days'
        ELSE '7+ Days'
    END
ORDER BY
    AVG(isreturned) DESC;

-- Monthly return trend
SELECT
    order_month,
    COUNT(*) AS total_orders,
    SUM(isreturned) AS returned_orders,
    ROUND(AVG(isreturned) * 100, 2) AS return_rate,
    ROUND(SUM(totalamount), 2) AS total_sales
FROM ecommerce_orders
GROUP BY order_month
ORDER BY order_month;

--
SELECT
    paymentmethod,
    COUNT(*) AS total_orders,
    SUM(isreturned) AS returned_orders,
    ROUND(AVG(isreturned) * 100, 2) AS return_rate
FROM ecommerce_orders
GROUP BY paymentmethod
ORDER BY return_rate DESC;