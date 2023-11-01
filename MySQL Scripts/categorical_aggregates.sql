BEGIN;

-- Create table monthly_aggregates, with schema.
CREATE TABLE categorical_aggregates (
    Category TEXT,
    OrderVolume INT,
    SalesVolume DOUBLE,
    ProfitVolume DOUBLE
);

INSERT INTO categorical_aggregates (Category, OrderVolume, SalesVolume, ProfitVolume)
SELECT
    Category,
    COUNT(Category) AS OrderVolume,
    SUM(Sales) AS SalesVolume,
    SUM(Profit) AS ProfitVolume
FROM orders
GROUP BY Category
ORDER BY ProfitVolume DESC;

COMMIT;