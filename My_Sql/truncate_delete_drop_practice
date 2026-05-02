-- drop - table delete
-- truncate- data delete occours but table remains

/*  
| Feature              | TRUNCATE   | DELETE    |
| -------------------- | ---------- | --------- |
| Removes all rows     | ✅          | ✅         |
| WHERE clause         | ❌          | ✅         |
| Speed                | ⚡ Fast     | 🐢 Slower |
| Rollback             | ❌ (mostly) | ✅         |
| Auto-increment reset | ✅          | ❌         |

*/
-- ============================================
-- STEP 1: CREATE TABLE
-- ============================================

CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

-- ============================================
-- STEP 2: INSERT DATA
-- ============================================

INSERT INTO student (name) VALUES
('Kiran'),
('Sai'),
('Ram');

-- Check data
SELECT * FROM student;

-- ============================================
-- STEP 3: DELETE (removes rows, keeps structure)
-- ============================================

DELETE FROM student;

-- Table exists, but empty
SELECT * FROM student;

-- Insert again to test next
INSERT INTO student (name) VALUES ('Test1'), ('Test2');

-- ============================================
-- STEP 4: TRUNCATE (faster, resets auto_increment)
-- ============================================

TRUNCATE TABLE student;

-- Table exists, but empty + ID resets
SELECT * FROM student;

-- Insert again to verify ID resets
INSERT INTO student (name) VALUES ('New1');

SELECT * FROM student;

-- ============================================
-- STEP 5: DROP (removes everything)
-- ============================================

DROP TABLE student;

-- This will FAIL because table is gone
SELECT * FROM student;

-- ============================================
-- END
-- ============================================
