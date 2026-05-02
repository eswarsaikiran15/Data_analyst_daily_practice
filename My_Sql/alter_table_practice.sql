-- ============================================
-- ALTER TABLE PRACTICE FILE
-- ============================================

-- Step 0: Create base table
CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- ============================================
-- 1. ADD COLUMN
-- ============================================
-- Add age column with default value

ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 19;

-- ============================================
-- 2. MODIFY COLUMN
-- ============================================
-- Change datatype of age

ALTER TABLE student
MODIFY age VARCHAR(2);

-- ============================================
-- 3. CHANGE COLUMN (rename + datatype)
-- ============================================
-- Rename age → stu_age

ALTER TABLE student
CHANGE age stu_age INT;

-- ============================================
-- 4. DROP COLUMN
-- ============================================
-- Remove stu_age column

ALTER TABLE student
DROP COLUMN stu_age;

-- ============================================
-- 5. RENAME TABLE
-- ============================================
-- Rename student → stu

ALTER TABLE student
RENAME TO stu;

-- ============================================
-- END OF FILE
-- ============================================
