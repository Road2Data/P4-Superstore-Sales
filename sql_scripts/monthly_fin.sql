BEGIN;

CREATE TABLE monthly_fin (
    SELECT
        CONCAT(CAST(OrderYear AS CHAR), '-', LPAD(CAST(OrderMonth AS CHAR), 2, '0')) AS YearMonth,
        COUNT(Sales) AS TotalSales,
        SUM(Discount) AS DiscountValue,
        SUM(Sales) AS NetSales,
        SUM(Profit) AS NetProfit
    FROM orders
    GROUP BY YearMonth
    ORDER BY YearMonth
);

COMMIT;