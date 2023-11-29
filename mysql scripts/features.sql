BEGIN;

CREATE TABLE features
(
    OrderYear  INT,
    OrderMonth INT,
    DaysToShip INT,
    Segment    TEXT,
    Region     TEXT,
    State      TEXT,
    Department TEXT,
    Division   TEXT,
    Profit     REAL
);

INSERT INTO features(OrderYear, OrderMonth, DaysToShip, Segment, Region, State, Department, Division, Profit)
SELECT OrderYear,
       OrderMonth,
       DaysToShip,
       Segment,
       Region,
       State,
       Category         AS Department,
       `Sub-Category`   AS Division,
       ROUND(Profit, 2) AS Profit
FROM orders
WHERE Profit > 0
ORDER BY Department, Division, Profit DESC;

COMMIT;


