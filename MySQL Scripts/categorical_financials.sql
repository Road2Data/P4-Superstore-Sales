BEGIN;

-- Create categorical_financials table, with schema
CREATE TABLE categorical_financials
(
    Department          TEXT,
    Division            TEXT,
    DivisionVolume      INT,
    AveragePurchase     REAL,
    DivisionSales       REAL,
    DiscountsValueGiven REAL,
    DivisionProfit      REAL
);

-- Populate categorical_financials table with queried aggregations.
INSERT INTO categorical_financials (Department, Division, DivisionVolume, AveragePurchase, DivisionSales,
                                    DiscountsValueGiven, DivisionProfit)
SELECT Category                     AS Department,
       `Sub-Category`               AS Division,
       COUNT(`Sub-Category`)        AS DivisionVolume,
       ROUND(AVG(Sales), 2)         AS AvgSale,
       ROUND(SUM(Sales), 2)         AS DivisionSales,
       ROUND(SUM(DiscountValue), 2) AS DiscountsValueGiven,
       ROUND(SUM(Profit), 2)        AS DivisionProfit
FROM orders
GROUP BY Category, `Sub-Category`
ORDER BY DivisionProfit DESC;

COMMIT;