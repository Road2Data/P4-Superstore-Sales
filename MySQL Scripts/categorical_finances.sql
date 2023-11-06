BEGIN;

-- Create categorical_finances table, with schema
CREATE TABLE categorical_finances
(
    Department          TEXT,
    Division            TEXT,
    DivisionVolume      INT,
    AveragePurchase     REAL,
    DivisionSales       REAL,
    DiscountsValueGiven REAL,
    DivisionProfit      REAL
);

-- Populate categorical_finances table with queried aggregations.
INSERT INTO categorical_finances(Department, Division, DivisionVolume, AveragePurchase, DivisionSales,
                                 DiscountsValueGiven, DivisionProfit)
SELECT Category                AS Department,
       `Sub-Category`          AS Division,
       COUNT(`Sub-Category`)   AS DivisionVolume,
       ROUND(AVG(Sales), 2)    AS AvgSale,
       ROUND(SUM(Sales), 2)    AS DivisionSales,
       ROUND(SUM(Discount), 2) AS DiscountsValueGiven,
       ROUND(SUM(Profit), 2)   AS DivisionProfit
FROM orders
GROUP BY Category, `Sub-Category`
ORDER BY DivisionProfit DESC;

COMMIT;