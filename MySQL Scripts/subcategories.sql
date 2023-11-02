BEGIN;

CREATE TABLE subcategories (
    SubCategory TEXT,
    OrderVolume INT,
    SalesVolume DOUBLE,
    ProfitVolume DOUBLE
);

INSERT INTO subcategories (SubCategory, OrderVolume, SalesVolume, ProfitVolume)
SELECT
    `Sub-Category` AS SubCategory,
    COUNT(Category) AS OrderVolume,
    SUM(Sales) AS SalesVolume,
    SUM(Profit) AS ProfitVolume
FROM orders
GROUP BY SubCategory
ORDER BY ProfitVolume DESC;

COMMIT;