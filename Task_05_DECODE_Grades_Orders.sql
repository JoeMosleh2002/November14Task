-- Task 5: DECODE grades and order statuses | Oracle SQL
-- Self-contained: does not depend on Task 4's STUDENTS table.
-- Q1: DECODE with SIGN reproduces CASE ranges for numeric scores.
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
-- Q2
CREATE TABLE ORDERS (ORDER_ID NUMBER PRIMARY KEY, STATUS CHAR(1));
INSERT INTO ORDERS VALUES (1, 'P');
INSERT INTO ORDERS VALUES (2, 'S');
INSERT INTO ORDERS VALUES (3, 'D');
COMMIT;
-- Q3
SELECT ORDER_ID, STATUS,
       DECODE(STATUS, 'P', 'Pending', 'S', 'Shipped', 'D', 'Delivered', 'Unknown') AS STATUS_DESCRIPTION
FROM ORDERS;
