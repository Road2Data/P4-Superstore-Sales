BEGIN;

-- Create the monthlyFin table, with schema for typing.
CREATE TABLE monthlyFin (
    YearMonth TEXT,
    OrderCount INT,
    DiscountValue DOUBLE,
    NetSales DOUBLE,
    NetProfit DOUBLE
);


-- Populate monthlyFin table with query from orders.
INSERT INTO monthlyFin (YearMonth, OrderCount, DiscountValue, NetSales, NetProfit)
SELECT
    CONCAT(CAST(OrderYear AS CHAR), '-', LPAD(CAST(OrderMonth AS CHAR), 2, '0')) AS YearMonth,
    COUNT(Sales) AS OrderCount,
    SUM(Discount) AS DiscountValue,
    SUM(Sales) AS NetSales,
    SUM(Profit) AS NetProfit
FROM orders
GROUP BY YearMonth
ORDER BY YearMonth;

COMMIT;