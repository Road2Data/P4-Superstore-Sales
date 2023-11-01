BEGIN;

-- Create table monthly_aggregates, with schema.
CREATE TABLE monthly_aggregates (
    YearMonth VARCHAR(14),
    OrderCount INT,
    DiscountValue DOUBLE,
    NetSales DOUBLE,
    NetProfit DOUBLE
);


-- Populate monthly_aggregates table with query from orders.
INSERT INTO monthly_aggregates (YearMonth, OrderCount, DiscountValue, NetSales, NetProfit)
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