USE ecommerce_return_analysis;

DROP TABLE IF EXISTS ecommerce_orders;

CREATE TABLE ecommerce_orders (
    orderid VARCHAR(20) PRIMARY KEY,
    orderdate DATE NOT NULL,
    productcategory VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    priceperunit DECIMAL(10,2) NOT NULL,
    paymentmethod VARCHAR(50) NOT NULL,
    customerlocation VARCHAR(50) NOT NULL,
    customersegment VARCHAR(20) NOT NULL,
    discountapplied DECIMAL(5,2) NOT NULL,
    deliverytimedays DECIMAL(5,2) NOT NULL,
    isreturned TINYINT NOT NULL,
    totalamount DECIMAL(12,2) NOT NULL,
    order_month TINYINT NOT NULL
);