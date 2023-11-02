BEGIN;

-- Allocate new columns.
ALTER TABLE orders
    ADD COLUMN OrderYear INT,
    ADD COLUMN OrderMonth INT,
    ADD COLUMN DaysToShip INT;

-- Feature extractions
UPDATE orders
SET orders.OrderYear = YEAR(`Order Date`),
    orders.OrderMonth = MONTH(`Order Date`),
    orders.DaysToShip = DATEDIFF(`Ship Date`, `Order Date`);

COMMIT;