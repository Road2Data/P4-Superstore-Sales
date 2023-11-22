BEGIN;

-- Create the monthly_financials table, with schema for typing.
CREATE TABLE monthly_financials
(
    YearMonth           TEXT,
    OrderVolume         INT,
    MonthlySales        REAL,
    DiscountsValueGiven REAL,
    MonthlyProfit       REAL
);

-- Populate monthly_financials table with query from orders.
INSERT INTO monthly_financials(YearMonth, OrderVolume, MonthlySales, DiscountsValueGiven, MonthlyProfit)
SELECT CONCAT(CAST(OrderYear AS CHAR), '-', LPAD(CAST(OrderMonth AS CHAR), 2, '0')) AS YearMonth,
       COUNT(Sales)                                                                 AS OrderVolume,
       ROUND(SUM(Sales), 2)                                                         AS MonthlySales,
       ROUND(SUM(DiscountValue), 2)                                                 AS DiscountsValueGiven,
       ROUND(SUM(Profit), 2)                                                        AS MonthlyProfit
FROM orders
GROUP BY YearMonth
ORDER BY YearMonth;

COMMIT;