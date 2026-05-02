-- ============================================
-- GENERAL SQL QUERY ORDER
-- ============================================

-- Basic syntax order (how we WRITE queries)

-- SELECT column(s)
-- FROM table_name
-- WHERE condition
-- GROUP BY column(s)
-- HAVING condition
-- ORDER BY column(s) ASC/DESC;

-- ============================================
-- EXAMPLE
-- ============================================

SELECT city, AVG(marks)
FROM student
WHERE marks > 50
GROUP BY city
HAVING AVG(marks) > 60
ORDER BY city ASC;

-- ============================================
-- ACTUAL EXECUTION ORDER (VERY IMPORTANT)
-- ============================================

-- SQL does NOT run in the order you write

-- 1. FROM       → get data
-- 2. WHERE      → filter rows
-- 3. GROUP BY   → create groups
-- 4. HAVING     → filter groups
-- 5. SELECT     → choose columns
-- 6. ORDER BY   → sort result
-- 7. LIMIT      → restrict output

-- ============================================
-- WHY THIS MATTERS
-- ============================================

-- Example mistake:

-- ❌ WRONG (aggregate in WHERE)
SELECT city, COUNT(*)
FROM student
WHERE COUNT(*) > 2
GROUP BY city;

-- 👉 ERROR because WHERE runs BEFORE GROUP BY

-- ✔ CORRECT
SELECT city, COUNT(*)
FROM student
GROUP BY city
HAVING COUNT(*) > 2;

-- ============================================
-- SIMPLE WAY TO REMEMBER
-- ============================================

-- WRITE ORDER:
-- SELECT → FROM → WHERE → GROUP BY → HAVING → ORDER BY

-- EXECUTION ORDER:
-- FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT

-- ============================================
-- FINAL UNDERSTANDING
-- ============================================

-- Think like pipeline:
-- Data → Filter → Group → Filter Groups → Show → Sort → Limit
