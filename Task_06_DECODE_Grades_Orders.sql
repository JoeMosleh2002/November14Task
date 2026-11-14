-- Task 6: Uploaded task text is identical to Task 5.
-- Uses different table name ORDERS_TASK6 to avoid a collision when both files run.
-- Q1: same grading logic as the preceding CASE assignment.
WITH SCORES AS (
  SELECT 'Ahmed' AS NAME, 96 AS MARKS FROM DUAL UNION ALL
  SELECT 'Mona', 85 FROM DUAL UNION ALL
  SELECT 'Sara', 74 FROM DUAL UNION ALL
  SELECT 'Omar', 63 FROM DUAL
)
SELECT NAME, MARKS,
       DECODE(SIGN(MARKS - 90), 0, 'A', 1, 'A',
              DECODE(SIGN(MARKS - 80), 0, 'B', 1, 'B',
                     DECODE(SIGN(MARKS - 70), 0, 'C', 1, 'C', 'F'))) AS GRADE
FROM SCORES;
-- Q2: Equivalent ORDERS structure, distinct name for independent execution.
CREATE TABLE ORDERS_TASK6 (ORDER_ID NUMBER PRIMARY KEY, STATUS CHAR(1));
INSERT INTO ORDERS_TASK6 VALUES (1, 'P');
INSERT INTO ORDERS_TASK6 VALUES (2, 'S');
INSERT INTO ORDERS_TASK6 VALUES (3, 'D');
COMMIT;
-- Q3
SELECT ORDER_ID, STATUS,
       DECODE(STATUS, 'P', 'Pending', 'S', 'Shipped', 'D', 'Delivered', 'Unknown') AS STATUS_DESCRIPTION
FROM ORDERS_TASK6;
