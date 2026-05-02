-- ============================================
-- HAVING CLAUSE
-- ============================================

-- The HAVING clause is similar to WHERE,
-- but it is used to apply conditions on GROUPED data.

-- WHERE → filters rows BEFORE grouping
-- HAVING → filters groups AFTER grouping

-- ============================================
-- WHY HAVING IS NEEDED
-- ============================================

-- WHERE cannot use aggregate functions like:
-- COUNT(), AVG(), SUM(), MAX(), MIN()

-- So when we need to filter based on aggregated values,
-- we must use HAVING.

-- ============================================
-- EXAMPLE:
-- Count number of students in each city
-- where maximum marks > 90
-- ============================================

SELECT COUNT(name), city
FROM student
GROUP BY city
HAVING MAX(marks) > 90;

-- ============================================
-- STEP-BY-STEP EXECUTION
-- ============================================

-- 1. FROM → get data from student table
-- 2. GROUP BY → group rows by city
-- 3. MAX(marks) → calculate max marks per city
-- 4. HAVING → keep only cities where max marks > 90
-- 5. SELECT → show count(name), city

-- ============================================
-- KEY POINTS
-- ============================================

-- 1. HAVING is always used with GROUP BY
-- 2. HAVING works on grouped data
-- 3. HAVING can use aggregate functions
-- 4. WHERE cannot use aggregate functions

-- ============================================
-- WHERE vs HAVING (IMPORTANT)
-- ============================================

-- WHERE:
-- Filters individual rows BEFORE grouping

-- HAVING:
-- Filters grouped results AFTER grouping

-- ============================================
-- EXAMPLE COMPARISON
-- ============================================

-- WHERE example (filters rows)
SELECT city, marks
FROM student
WHERE marks > 50;

-- HAVING example (filters groups)
SELECT city, AVG(marks)
FROM student
GROUP BY city
HAVING AVG(marks) > 50;

-- ============================================
-- COMMON MISTAKE
-- ============================================

-- ❌ WRONG
SELECT city, COUNT(*)
FROM student
WHERE COUNT(*) > 2
GROUP BY city;

-- ✔ CORRECT
SELECT city, COUNT(*)
FROM student
GROUP BY city
HAVING COUNT(*) > 2;

-- ============================================
-- REAL-WORLD EXAMPLE
-- ============================================

-- Find cities with more than 3 students
SELECT city, COUNT(*) AS total_students
FROM student
GROUP BY city
HAVING COUNT(*) > 3;

-- ============================================
-- FINAL UNDERSTANDING
-- ============================================

-- GROUP BY → creates groups
-- HAVING → filters those groups

-- Think:
-- "First group → then filter groups"
