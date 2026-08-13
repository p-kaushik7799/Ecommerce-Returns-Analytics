SELECT COUNT(*) AS total_records
FROM ecommerce_orders;

-- Check duplicate Order IDs
SELECT
    orderid,
    COUNT(*) AS record_count
FROM ecommerce_orders
GROUP BY orderid
HAVING COUNT(*) > 1;

-- Check missing values
SELECT
    SUM(orderid IS NULL) AS missing_orderid,
    SUM(orderdate IS NULL) AS missing_orderdate,
    SUM(productcategory IS NULL) AS missing_productcategory,
    SUM(quantity IS NULL) AS missing_quantity,
    SUM(priceperunit IS NULL) AS missing_price,
    SUM(paymentmethod IS NULL) AS missing_payment,
    SUM(customerlocation IS NULL) AS missing_location,
    SUM(customersegment IS NULL) AS missing_segment,
    SUM(discountapplied IS NULL) AS missing_discount,
    SUM(deliverytimedays IS NULL) AS missing_delivery,
    SUM(isreturned IS NULL) AS missing_return,
    SUM(totalamount IS NULL) AS missing_totalamount
FROM ecommerce_orders;

-- Invalid quantity
SELECT COUNT(*) AS invalid_quantity
FROM ecommerce_orders
WHERE quantity <= 0;

-- Invalid price
SELECT COUNT(*) AS invalid_price
FROM ecommerce_orders
WHERE priceperunit <= 0;

-- Invalid discount
SELECT COUNT(*) AS invalid_discount
FROM ecommerce_orders
WHERE discountapplied < 0
   OR discountapplied > 1;
   
-- Invalid delivery time
SELECT COUNT(*) AS invalid_delivery_time
FROM ecommerce_orders
WHERE deliverytimedays < 0;

-- Invalid target
SELECT COUNT(*) AS invalid_return_values
FROM ecommerce_orders
WHERE isreturned NOT IN (0, 1);

