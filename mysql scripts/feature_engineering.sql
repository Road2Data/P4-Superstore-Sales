BEGIN;

ALTER TABLE orders
    ADD COLUMN DiscountValue REAL,
    ADD COLUMN OrderYear     INT,
    ADD COLUMN OrderMonth    INT,
    ADD COLUMN DaysToShip    INT;

UPDATE orders
SET orders.DiscountValue = orders.Discount * orders.Sales,
    orders.OrderYear     = YEAR(`Order Date`),
    orders.OrderMonth    = MONTH(`Order Date`),
    orders.DaysToShip    = DATEDIFF(`Ship Date`, `Order Date`);

COMMIT;