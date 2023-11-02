BEGIN;

CREATE TABLE categories (
    Category TEXT,
    OrderVolume INT,
    SalesVolume DOUBLE,
    ProfitVolume DOUBLE
);

INSERT INTO categories (Category, OrderVolume, SalesVolume, ProfitVolume)
SELECT
    Category,
    COUNT(Category) AS OrderVolume,
    SUM(Sales) AS SalesVolume,
    SUM(Profit) AS ProfitVolume
FROM orders
GROUP BY Category
ORDER BY ProfitVolume DESC;

COMMIT;