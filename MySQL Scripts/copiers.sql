BEGIN;

-- Create the copiers table, with schema for typing.
CREATE TABLE copiers (
    CustomerID TEXT,
    Segment TEXT,
    Region TEXT,
    State TEXT,
    ShipMode TEXT,
    DTS INT,
    ProductID TEXT,
    ProductName TEXT,
    Profit DOUBLE
);

-- Populate copiers table with query from orders.
INSERT INTO copiers (CustomerID, Segment, Region, State, ShipMode, DTS, ProductID, ProductName, Profit)
SELECT
    `Customer ID` AS CustomerID,
    Segment,
    Region,
    State,
    `Ship Mode` AS ShipMode,
    DaysToShip AS DTS,
    `Product ID` AS ProductID,
    `Product Name` AS ProductName,
    Profit
FROM orders
WHERE
    `Sub-Category` = 'Copiers' AND
    Profit > 0
ORDER BY Profit DESC;

COMMIT;