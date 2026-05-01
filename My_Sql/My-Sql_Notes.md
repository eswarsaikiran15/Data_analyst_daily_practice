# 🐬 MySQL Master Notes
### Complete Reference for Data Analysis & Database Developers

> **How to use these notes:**  
> Each section contains → **Concept** (what & why) → **Code** (how) → **Recall** (⚡ quick memory anchors)

---

## 📋 Table of Contents

1. [Database Fundamentals](#1-database-fundamentals)
2. [Data Types](#2-data-types)
3. [DDL — Creating & Managing Structure](#3-ddl--creating--managing-structure)
4. [DML — Inserting, Updating, Deleting](#4-dml--inserting-updating-deleting)
5. [SELECT & Querying](#5-select--querying)
6. [Filtering — WHERE, HAVING, BETWEEN, IN, LIKE](#6-filtering--where-having-between-in-like)
7. [Sorting & Limiting — ORDER BY, LIMIT](#7-sorting--limiting--order-by-limit)
8. [Aggregate Functions](#8-aggregate-functions)
9. [GROUP BY & HAVING](#9-group-by--having)
10. [JOINs — All Types](#10-joins--all-types)
11. [Subqueries](#11-subqueries)
12. [Window Functions](#12-window-functions)
13. [String Functions](#13-string-functions)
14. [Date & Time Functions](#14-date--time-functions)
15. [Math & Numeric Functions](#15-math--numeric-functions)
16. [NULL Handling](#16-null-handling)
17. [CASE Expressions](#17-case-expressions)
18. [CTEs — Common Table Expressions](#18-ctes--common-table-expressions)
19. [Views](#19-views)
20. [Indexes](#20-indexes)
21. [Stored Procedures](#21-stored-procedures)
22. [Functions (User-Defined)](#22-functions-user-defined)
23. [Triggers](#23-triggers)
24. [Transactions & ACID](#24-transactions--acid)
25. [Constraints](#25-constraints)
26. [Normalization](#26-normalization)
27. [Joins vs Subqueries vs CTEs — When to Use](#27-joins-vs-subqueries-vs-ctes--when-to-use)
28. [Performance & Query Optimization](#28-performance--query-optimization)
29. [User Management & Security](#29-user-management--security)
30. [Data Analysis Patterns](#30-data-analysis-patterns)
31. [Quick Reference Cheatsheet](#31-quick-reference-cheatsheet)

---

## 1. Database Fundamentals

### Concept
A **database** is an organized collection of structured data. MySQL is a **Relational Database Management System (RDBMS)** — data is stored in **tables** (rows + columns) and tables relate to each other via **keys**.

- **Schema** = the blueprint/structure of the database
- **Table** = a grid of data (like a spreadsheet tab)
- **Row / Record** = one entry in a table
- **Column / Field** = an attribute of the data
- **Primary Key (PK)** = uniquely identifies each row
- **Foreign Key (FK)** = links one table to another

### Code
```sql
-- Show all databases
SHOW DATABASES;

-- Create a database
CREATE DATABASE sales_db;

-- Use a database
USE sales_db;

-- Show all tables in current database
SHOW TABLES;

-- Show the structure of a table
DESCRIBE employees;
DESC employees;           -- shorthand

-- Show the CREATE statement of a table
SHOW CREATE TABLE employees;

-- Drop a database (CAREFUL!)
DROP DATABASE old_db;
```

### ⚡ Recall
| Term | Memory Hook |
|------|-------------|
| RDBMS | "Relations Between Many Spreadsheets" |
| PK | Unique ID — like a passport number |
| FK | Pointer from one table to another |
| Schema | The skeleton/blueprint |

### 🎯 Interview Q&A

> **Q: What is a Relational Database Management System (RDBMS)?**  
> **A:** An RDBMS is a system that stores data in structured tables made of rows and columns, and enforces relationships between those tables using keys. MySQL, PostgreSQL, and Oracle are examples. The "relational" part refers to how tables relate to each other via primary and foreign keys. This structure enables powerful query operations like JOINs and enforces data integrity through constraints.

> **Q: What is the difference between a Primary Key and a Foreign Key?**  
> **A:** A **Primary Key** uniquely identifies each row in its own table — it must be unique and NOT NULL. A **Foreign Key** is a column in one table that references the Primary Key of another table. FKs enforce referential integrity — you can't have a child row that references a parent that doesn't exist. For example, `orders.customer_id` is a FK pointing to `customers.customer_id`.

> **Q: What is the difference between a Database and a Schema?**  
> **A:** In MySQL, the terms are largely interchangeable — `CREATE DATABASE` and `CREATE SCHEMA` do the same thing. A **database** (or schema) is a named container for tables, views, procedures, and other objects. In other systems like PostgreSQL, a schema is a namespace *within* a database, but in MySQL, one database = one schema.

> **Q: What is referential integrity and how does MySQL enforce it?**  
> **A:** Referential integrity ensures that relationships between tables remain consistent — a Foreign Key value must always match an existing Primary Key in the referenced table (or be NULL). MySQL enforces this through Foreign Key constraints on InnoDB tables. If you try to insert a row with a FK value that doesn't exist in the parent table, MySQL throws an error. `ON DELETE CASCADE` or `ON DELETE RESTRICT` define what happens when a parent row is deleted.

> **Q: What is the difference between `DESCRIBE` and `SHOW CREATE TABLE`?**  
> **A:** `DESCRIBE table_name` (or `DESC`) shows column names, data types, nullability, keys, defaults, and extras in a compact format — great for quick structure inspection. `SHOW CREATE TABLE table_name` shows the full DDL statement used to create the table, including all constraints, indexes, engine type, and charset — useful for replication or documentation purposes.

---

## 2. Data Types

### Concept
Choosing the right data type saves space, ensures data integrity, and speeds up queries.

### Numeric Types
| Type | Range / Use |
|------|-------------|
| `TINYINT` | -128 to 127 (or 0–255 UNSIGNED) |
| `SMALLINT` | -32,768 to 32,767 |
| `INT` | -2.1B to 2.1B — most common |
| `BIGINT` | Very large integers (IDs, counters) |
| `DECIMAL(p,s)` | Exact decimals — money/finance |
| `FLOAT` / `DOUBLE` | Approximate decimals — scientific |

### String Types
| Type | Use |
|------|-----|
| `CHAR(n)` | Fixed length (n chars) — fast, codes like 'M'/'F' |
| `VARCHAR(n)` | Variable length up to n — names, emails |
| `TEXT` | Up to 65,535 chars — descriptions |
| `MEDIUMTEXT` | Up to 16MB |
| `LONGTEXT` | Up to 4GB — articles, logs |

### Date/Time Types
| Type | Format | Use |
|------|--------|-----|
| `DATE` | YYYY-MM-DD | Birthdays, deadlines |
| `TIME` | HH:MM:SS | Duration, time of day |
| `DATETIME` | YYYY-MM-DD HH:MM:SS | Event timestamps |
| `TIMESTAMP` | YYYY-MM-DD HH:MM:SS | Auto-updated timestamps |
| `YEAR` | YYYY | Year only |

### Other Types
| Type | Use |
|------|-----|
| `BOOLEAN` / `TINYINT(1)` | True/False (1/0) |
| `ENUM('a','b','c')` | One value from a fixed list |
| `SET('a','b','c')` | Multiple values from a fixed list |
| `JSON` | JSON documents (MySQL 5.7+) |
| `BLOB` | Binary data (images, files) |

### Code
```sql
CREATE TABLE products (
    product_id   INT            UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(100)   NOT NULL,
    price        DECIMAL(10, 2) NOT NULL,      -- 10 total digits, 2 decimal
    description  TEXT,
    category     ENUM('Electronics','Clothing','Food'),
    is_active    BOOLEAN        DEFAULT TRUE,
    created_at   TIMESTAMP      DEFAULT CURRENT_TIMESTAMP
);
```

### ⚡ Recall
- **DECIMAL** = exact → use for **money**
- **FLOAT/DOUBLE** = approximate → use for **science**
- **CHAR** = fixed width → faster for **codes & flags**
- **VARCHAR** = variable → use for **names & text**
- **TIMESTAMP** = auto-tracks time → use for **audit columns**

### 🎯 Interview Q&A

> **Q: What is the difference between `CHAR` and `VARCHAR`?**  
> **A:** `CHAR(n)` is **fixed-length** — always stores exactly n characters, padding shorter values with spaces. `VARCHAR(n)` is **variable-length** — stores only as many characters as needed plus 1–2 bytes for length metadata. `CHAR` is faster for uniform-length values (country codes, gender flags); `VARCHAR` saves space for variable-length data like names and emails.

> **Q: Why use `DECIMAL` instead of `FLOAT` for financial data?**  
> **A:** `FLOAT`/`DOUBLE` use binary floating-point which cannot exactly represent most decimal fractions — `0.1 + 0.2` yields `0.30000000000000004`. `DECIMAL(10,2)` stores an exact string of digits internally, guaranteeing precision. Always use `DECIMAL` for currency, prices, and any financial calculations where rounding errors are unacceptable.

> **Q: What is the difference between `DATETIME` and `TIMESTAMP`?**  
> **A:** Both store date+time, but `DATETIME` stores the literal value given (timezone-unaware, range 1000–9999), while `TIMESTAMP` stores UTC internally, converts to session timezone on retrieval, and supports `DEFAULT CURRENT_TIMESTAMP` and `ON UPDATE CURRENT_TIMESTAMP` (range 1970–2038). Use `TIMESTAMP` for audit columns; `DATETIME` for future dates beyond 2038 like event schedules.

> **Q: What does `UNSIGNED` do on an integer column?**  
> **A:** It restricts the column to non-negative values (0 and up), doubling the positive range. `INT` ranges -2.1B to +2.1B; `INT UNSIGNED` ranges 0 to 4.29B. Use UNSIGNED for IDs, counts, and quantities that can never be negative.

> **Q: When would you choose `TEXT` over `VARCHAR`?**  
> **A:** Use `VARCHAR(n)` when the string has a predictable max length and you need full indexing or DEFAULT values. Use `TEXT` for long freeform content (articles, logs, descriptions) where full-column indexing isn't needed. Key limitations of `TEXT`: no DEFAULT values, no full-column indexing (prefix only), and values may be stored off-page.

---

## 3. DDL — Creating & Managing Structure

### Concept
**DDL (Data Definition Language)** defines the structure. Commands: `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, `RENAME`.

> DDL commands are **auto-committed** — they cannot be rolled back!

### Code

#### CREATE TABLE
```sql
CREATE TABLE employees (
    emp_id      INT          AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50)  NOT NULL,
    last_name   VARCHAR(50)  NOT NULL,
    email       VARCHAR(100) UNIQUE NOT NULL,
    dept_id     INT,
    salary      DECIMAL(10,2) DEFAULT 0.00,
    hire_date   DATE,
    created_at  TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
```

#### ALTER TABLE — Add, Modify, Drop Columns
```sql
-- Add a column
ALTER TABLE employees ADD COLUMN phone VARCHAR(20);

-- Add column at specific position
ALTER TABLE employees ADD COLUMN phone VARCHAR(20) AFTER email;

-- Modify a column's type or constraint
ALTER TABLE employees MODIFY COLUMN salary DECIMAL(12,2) NOT NULL;

-- Rename a column (MySQL 8.0+)
ALTER TABLE employees RENAME COLUMN phone TO mobile;

-- Drop a column
ALTER TABLE employees DROP COLUMN mobile;

-- Add a constraint
ALTER TABLE employees ADD CONSTRAINT chk_salary CHECK (salary >= 0);

-- Drop a constraint
ALTER TABLE employees DROP CONSTRAINT chk_salary;

-- Add index
ALTER TABLE employees ADD INDEX idx_last_name (last_name);

-- Rename table
ALTER TABLE employees RENAME TO staff;
-- OR
RENAME TABLE staff TO employees;
```

#### DROP vs TRUNCATE vs DELETE
```sql
-- DROP: removes entire table structure + data permanently
DROP TABLE IF EXISTS temp_table;

-- TRUNCATE: removes all rows, keeps structure, resets AUTO_INCREMENT
TRUNCATE TABLE logs;

-- DELETE: removes rows conditionally, can be rolled back
DELETE FROM logs WHERE created_at < '2023-01-01';
```

### ⚡ Recall
| Command | What it does | Rollback? |
|---------|-------------|-----------|
| `DROP` | Kills the whole table | ❌ No |
| `TRUNCATE` | Empties table, keeps structure | ❌ No |
| `DELETE` | Removes rows (with WHERE) | ✅ Yes |
| `ALTER` | Changes structure | ❌ No |

### 🎯 Interview Q&A

> **Q: What is DDL and which commands does it include?**  
> **A:** DDL stands for **Data Definition Language** — the subset of SQL that defines and modifies database structure rather than data. It includes `CREATE` (create objects), `ALTER` (modify objects), `DROP` (delete objects), `TRUNCATE` (empty a table), and `RENAME`. DDL commands are **auto-committed** in MySQL — they implicitly commit any open transaction and cannot be rolled back, unlike DML statements.

> **Q: What is the difference between DROP, TRUNCATE, and DELETE?**  
> **A:** `DROP TABLE` removes the entire table including its structure, indexes, and data permanently — it cannot be rolled back. `TRUNCATE TABLE` removes all rows but keeps the table structure intact, resets the AUTO_INCREMENT counter, and cannot be rolled back (DDL operation). `DELETE FROM table` removes rows one by one (can include a WHERE clause), fires triggers, is logged per-row, and **can** be rolled back inside a transaction. `TRUNCATE` is faster than `DELETE` for clearing an entire table because it doesn't log individual row deletions.

> **Q: Can you roll back a DDL statement in MySQL?**  
> **A:** No. In MySQL, DDL statements like `CREATE`, `ALTER`, `DROP`, and `TRUNCATE` are **auto-committed** — they implicitly end any active transaction and commit it before executing. This is different from some other databases like PostgreSQL which support transactional DDL. The implication is: always double-check DDL before running it in production, as there is no undo button.

> **Q: What does `ALTER TABLE` do and give 3 common uses?**  
> **A:** `ALTER TABLE` modifies the structure of an existing table without dropping and recreating it. Common uses: (1) `ADD COLUMN` — adds a new column; (2) `MODIFY COLUMN` — changes a column's data type or constraints; (3) `ADD INDEX` / `DROP INDEX` — adds or removes an index for performance. In production, large `ALTER TABLE` operations on big tables can lock the table and cause downtime, so tools like `pt-online-schema-change` or MySQL 8's instant DDL are used.

> **Q: What is the purpose of `IF EXISTS` and `IF NOT EXISTS` in DDL?**  
> **A:** They prevent errors when trying to create something that already exists or drop something that doesn't. `CREATE TABLE IF NOT EXISTS` skips creation silently if the table exists. `DROP TABLE IF EXISTS` skips deletion silently if the table doesn't exist. This is essential in scripts and migrations that may be run multiple times — without these guards, the script would fail on re-run.

---

## 4. DML — Inserting, Updating, Deleting

### Concept
**DML (Data Manipulation Language)** works with the data itself. Commands: `INSERT`, `UPDATE`, `DELETE`, `REPLACE`.

### Code

#### INSERT
```sql
-- Insert single row
INSERT INTO employees (first_name, last_name, email, salary)
VALUES ('Alice', 'Smith', 'alice@co.com', 75000.00);

-- Insert multiple rows (faster than multiple single inserts)
INSERT INTO employees (first_name, last_name, email, salary)
VALUES 
    ('Bob',   'Jones',  'bob@co.com',   65000.00),
    ('Carol', 'White',  'carol@co.com', 80000.00),
    ('David', 'Brown',  'david@co.com', 72000.00);

-- Insert from a SELECT (copy data)
INSERT INTO employees_archive
SELECT * FROM employees WHERE hire_date < '2020-01-01';

-- INSERT OR IGNORE (skip if duplicate key)
INSERT IGNORE INTO employees (email, first_name)
VALUES ('alice@co.com', 'Alice2');

-- INSERT ... ON DUPLICATE KEY UPDATE (upsert)
INSERT INTO page_views (page, views)
VALUES ('home', 1)
ON DUPLICATE KEY UPDATE views = views + 1;
```

#### UPDATE
```sql
-- Update single column
UPDATE employees
SET salary = 80000
WHERE emp_id = 1;

-- Update multiple columns
UPDATE employees
SET salary = salary * 1.10,
    last_name = 'Johnson'
WHERE dept_id = 3;

-- Update using JOIN
UPDATE employees e
JOIN departments d ON e.dept_id = d.dept_id
SET e.salary = e.salary * 1.15
WHERE d.dept_name = 'Engineering';

-- Safe update mode (always use WHERE with UPDATE!)
-- Never run: UPDATE employees SET salary = 0  ← updates ALL rows!
```

#### DELETE
```sql
-- Delete specific rows
DELETE FROM employees WHERE emp_id = 5;

-- Delete with JOIN
DELETE e
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Temp';

-- Delete all rows (same as TRUNCATE but slower, rollback-able)
DELETE FROM temp_table;
```

#### REPLACE
```sql
-- DELETE + INSERT in one shot (if PK exists, delete old row then insert new)
REPLACE INTO employees (emp_id, first_name, email)
VALUES (1, 'Alice Updated', 'alice_new@co.com');
```

### ⚡ Recall
- **INSERT IGNORE** → skip on duplicate key error
- **ON DUPLICATE KEY UPDATE** → upsert pattern
- **UPDATE always needs WHERE** → or you update every row!
- **REPLACE** = delete + insert (resets AUTO_INCREMENT counters)

### 🎯 Interview Q&A

> **Q: What is the difference between `INSERT IGNORE` and `INSERT ... ON DUPLICATE KEY UPDATE`?**  
> **A:** Both handle duplicate key violations, but differently. `INSERT IGNORE` **silently skips** the insert if a duplicate key error would occur — the row is not inserted and no error is raised (just a warning). `ON DUPLICATE KEY UPDATE` **updates the existing row** with new values instead of inserting. Use `INSERT IGNORE` when you just want to skip duplicates. Use `ON DUPLICATE KEY UPDATE` (upsert) when you want to update the existing record — like incrementing a page view counter.

> **Q: What is an upsert and how do you implement it in MySQL?**  
> **A:** An **upsert** is an operation that inserts a row if it doesn't exist, or updates it if it does — a portmanteau of "update" and "insert". In MySQL, you implement it with `INSERT ... ON DUPLICATE KEY UPDATE`. Example: `INSERT INTO page_views (page, views) VALUES ('home', 1) ON DUPLICATE KEY UPDATE views = views + 1;` — this inserts the first visit and increments for all subsequent visits atomically.

> **Q: What happens if you run UPDATE without a WHERE clause?**  
> **A:** Without a WHERE clause, `UPDATE` modifies **every single row** in the table. For example, `UPDATE employees SET salary = 0` would zero out every employee's salary. This is one of the most dangerous operations in SQL. MySQL's `safe update mode` (`sql_safe_updates = 1`) prevents updates and deletes without a WHERE clause that uses an indexed column, providing a safety net in development environments.

> **Q: What is the difference between `REPLACE INTO` and `INSERT ... ON DUPLICATE KEY UPDATE`?**  
> **A:** Both handle duplicate key conflicts but `REPLACE INTO` performs a **DELETE then INSERT** — it deletes the old row entirely and inserts a new one. This resets AUTO_INCREMENT-based values and fires both DELETE and INSERT triggers. `ON DUPLICATE KEY UPDATE` does an in-place update of the existing row, preserving untouched columns and only firing UPDATE triggers. Prefer `ON DUPLICATE KEY UPDATE` in most cases to avoid unintended side effects.

---

## 5. SELECT & Querying

### Concept
`SELECT` retrieves data. The order of clauses matters.

**Logical execution order** (how MySQL processes it):
```
FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → DISTINCT → ORDER BY → LIMIT
```
(This is different from the *writing* order!)

### Code

#### Basic SELECT
```sql
-- Select all columns
SELECT * FROM employees;

-- Select specific columns
SELECT first_name, last_name, salary FROM employees;

-- Column aliases
SELECT 
    first_name AS "First Name",
    salary * 12 AS annual_salary
FROM employees;

-- Select distinct values
SELECT DISTINCT dept_id FROM employees;

-- Select with expressions
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    ROUND(salary / 12, 2)             AS monthly_salary,
    YEAR(hire_date)                   AS hire_year
FROM employees;
```

#### SELECT with calculations
```sql
SELECT 
    product_name,
    unit_price,
    quantity,
    unit_price * quantity              AS total_value,
    unit_price * quantity * 0.10       AS discount,
    unit_price * quantity * 0.90       AS after_discount
FROM order_items;
```

#### SELECT INTO / CREATE TABLE AS
```sql
-- Create a new table from a query result
CREATE TABLE high_earners AS
SELECT * FROM employees WHERE salary > 100000;

-- Temporary table
CREATE TEMPORARY TABLE temp_summary AS
SELECT dept_id, COUNT(*) AS headcount, AVG(salary) AS avg_sal
FROM employees
GROUP BY dept_id;
```

### ⚡ Recall
- **Execution order ≠ writing order** — WHERE runs before SELECT
- **Aliases in SELECT** can't be used in WHERE (not yet evaluated!)
- Use aliases in **ORDER BY** and **HAVING** (evaluated after SELECT)

### 🎯 Interview Q&A

> **Q: What is the logical execution order of a SQL SELECT statement?**  
> **A:** The order MySQL *processes* a query is: **FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → DISTINCT → ORDER BY → LIMIT**. This is different from the writing order (SELECT comes first syntactically). Understanding this matters for practical reasons: you cannot use a SELECT alias in a WHERE clause because WHERE is processed before SELECT — the alias doesn't exist yet. You *can* use aliases in ORDER BY and HAVING because they execute after SELECT.

> **Q: Why can't you use a column alias defined in SELECT inside the WHERE clause?**  
> **A:** Because of the logical execution order — WHERE is evaluated *before* SELECT. When MySQL processes WHERE, the SELECT expressions haven't been computed yet, so the alias is undefined. The workaround is to repeat the expression in WHERE, use a subquery/CTE to wrap the SELECT, or move the filter to HAVING (which runs after SELECT). Example: `SELECT salary * 12 AS annual FROM employees WHERE annual > 100000` will fail; use `WHERE salary * 12 > 100000` instead.

> **Q: What does SELECT DISTINCT do and what is its performance implication?**  
> **A:** `SELECT DISTINCT` removes duplicate rows from the result set. Under the hood, MySQL sorts or hashes the results to identify duplicates — this adds overhead proportional to the result size. It is often a sign that a query has a bad JOIN (producing duplicate rows that you're then removing), rather than genuinely needing deduplication. If you find yourself using `DISTINCT` heavily, check whether your JOINs are correct first.

> **Q: What is a derived table (inline view) and when do you use it?**  
> **A:** A derived table is a subquery in the FROM clause — it creates a temporary, named result set used as a table. Example: `SELECT * FROM (SELECT dept_id, AVG(salary) AS avg_sal FROM employees GROUP BY dept_id) AS dept_avgs WHERE avg_sal > 70000`. You use derived tables when you need to filter on an aggregate (can't use aggregates in WHERE), or when you need to pre-process data before the outer query acts on it. CTEs are the more readable modern alternative.

---

## 6. Filtering — WHERE, HAVING, BETWEEN, IN, LIKE

### Concept
`WHERE` filters **rows** before grouping. `HAVING` filters **groups** after GROUP BY.

### Code

#### WHERE Operators
```sql
-- Comparison
SELECT * FROM employees WHERE salary > 60000;
SELECT * FROM employees WHERE salary != 50000;   -- or <>

-- BETWEEN (inclusive on both ends)
SELECT * FROM employees WHERE salary BETWEEN 50000 AND 80000;
SELECT * FROM orders   WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31';

-- IN / NOT IN
SELECT * FROM employees WHERE dept_id IN (1, 3, 5);
SELECT * FROM employees WHERE dept_id NOT IN (2, 4);

-- LIKE (pattern matching)
SELECT * FROM employees WHERE last_name LIKE 'S%';       -- starts with S
SELECT * FROM employees WHERE email LIKE '%@gmail.com';  -- ends with
SELECT * FROM employees WHERE first_name LIKE '_ob';     -- _ = any 1 char (Bob, Rob, Job)
SELECT * FROM employees WHERE first_name LIKE '%son%';   -- contains "son"

-- REGEXP (regular expressions)
SELECT * FROM employees WHERE email REGEXP '^[a-z]+@';

-- IS NULL / IS NOT NULL
SELECT * FROM employees WHERE manager_id IS NULL;        -- no manager = top level
SELECT * FROM employees WHERE phone IS NOT NULL;

-- AND, OR, NOT
SELECT * FROM employees 
WHERE dept_id = 2 
  AND salary > 70000
  AND hire_date > '2022-01-01';

SELECT * FROM employees 
WHERE dept_id = 1 OR dept_id = 2;

-- Combine with parentheses (CRITICAL for correct logic)
SELECT * FROM employees 
WHERE (dept_id = 1 OR dept_id = 2) AND salary > 60000;
```

#### HAVING
```sql
-- HAVING filters AFTER GROUP BY
SELECT dept_id, COUNT(*) AS headcount, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept_id
HAVING COUNT(*) > 5          -- only depts with more than 5 employees
   AND AVG(salary) > 65000;  -- AND average salary above 65k
```

### ⚡ Recall
| Filter | Runs on | Timing |
|--------|---------|--------|
| `WHERE` | Individual rows | Before GROUP BY |
| `HAVING` | Groups / aggregates | After GROUP BY |
| `BETWEEN x AND y` | Inclusive on both ends | — |
| `LIKE '%x%'` | Contains x | Case-insensitive by default |
| `_` in LIKE | Exactly 1 character | — |

### 🎯 Interview Q&A

> **Q: What is the difference between WHERE and HAVING?**  
> **A:** Both filter rows, but at different stages. **WHERE** filters individual rows *before* any grouping occurs — it cannot reference aggregate functions. **HAVING** filters *after* GROUP BY has been applied — it operates on grouped results and *can* use aggregate functions like `COUNT()`, `AVG()`, `SUM()`. Rule of thumb: if you can write it in WHERE, do so (it's more efficient because it reduces rows before grouping). Use HAVING only when filtering on aggregated values or referencing aliases created in SELECT.

> **Q: Is BETWEEN inclusive or exclusive?**  
> **A:** `BETWEEN a AND b` is **inclusive on both ends** — equivalent to `>= a AND <= b`. So `WHERE salary BETWEEN 50000 AND 80000` includes employees with exactly 50,000 or 80,000. This is a common interview trap. For dates, be careful: `BETWEEN '2024-01-01' AND '2024-12-31'` includes rows up to `2024-12-31 00:00:00`, so rows with timestamps later in Dec 31 may be missed — better to use `>= '2024-01-01' AND < '2025-01-01'`.

> **Q: How does the LIKE operator work? What do `%` and `_` mean?**  
> **A:** `LIKE` performs pattern matching on strings. `%` matches **any sequence of zero or more characters** (wildcard). `_` matches **exactly one character**. Examples: `LIKE 'A%'` = starts with A; `LIKE '%son'` = ends with "son"; `LIKE '%john%'` = contains "john"; `LIKE '_ob'` = three characters ending in "ob" (matches "Bob", "Rob", "Job"). LIKE is case-insensitive by default in MySQL for non-binary string columns. A leading `%` (e.g., `LIKE '%smith'`) cannot use a standard B-Tree index and causes a full table scan.

> **Q: What is the difference between IN and EXISTS for filtering?**  
> **A:** Both check for membership, but they work differently. `IN (subquery)` executes the subquery once and builds a list, then checks each outer row against that list — efficient when the subquery returns a small set. `EXISTS (subquery)` is a correlated subquery that checks row-by-row whether at least one matching row exists — it short-circuits (stops) as soon as a match is found, making it faster when the inner table is large. As a rule: `EXISTS` is generally preferred for large datasets; `IN` is fine for small static lists.

---

## 7. Sorting & Limiting — ORDER BY, LIMIT

### Concept
`ORDER BY` sorts results. `LIMIT` restricts the number of rows returned — essential for pagination and top-N queries.

### Code
```sql
-- Sort ascending (default)
SELECT * FROM employees ORDER BY last_name;
SELECT * FROM employees ORDER BY last_name ASC;

-- Sort descending
SELECT * FROM employees ORDER BY salary DESC;

-- Sort by multiple columns
SELECT * FROM employees ORDER BY dept_id ASC, salary DESC;

-- Sort by column position (column 3)
SELECT first_name, last_name, salary FROM employees ORDER BY 3 DESC;

-- Sort by expression
SELECT * FROM employees ORDER BY YEAR(hire_date) DESC;

-- LIMIT — get first N rows
SELECT * FROM employees ORDER BY salary DESC LIMIT 10;

-- LIMIT with OFFSET — pagination
-- Page 1: rows 1-10
SELECT * FROM employees ORDER BY emp_id LIMIT 10 OFFSET 0;
-- Page 2: rows 11-20
SELECT * FROM employees ORDER BY emp_id LIMIT 10 OFFSET 10;
-- Shorthand: LIMIT offset, count
SELECT * FROM employees ORDER BY emp_id LIMIT 10, 10;

-- Top N per group (using subquery or window function)
-- Top 3 earners per department
SELECT * FROM (
    SELECT *, 
           RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
    FROM employees
) ranked
WHERE rnk <= 3;
```

### ⚡ Recall
- `ORDER BY col DESC` → highest first
- `LIMIT n OFFSET m` = skip m rows, take n
- `LIMIT 10, 20` = same as `LIMIT 20 OFFSET 10` (confusing — offset first!)
- Without `ORDER BY`, `LIMIT` results are **non-deterministic**

### 🎯 Interview Q&A

> **Q: What happens if you use LIMIT without ORDER BY?**  
> **A:** Without `ORDER BY`, the rows returned by `LIMIT` are **non-deterministic** — MySQL may return any subset of rows, and the result can vary between executions or across MySQL versions. The storage engine may return rows in insertion order, index order, or any other internal order, none of which is guaranteed. Always pair `LIMIT` with `ORDER BY` when you need consistent, predictable results, especially for pagination.

> **Q: How do you implement pagination in MySQL?**  
> **A:** Use `LIMIT` with `OFFSET`. Page 1: `LIMIT 10 OFFSET 0`, Page 2: `LIMIT 10 OFFSET 10`, Page N: `LIMIT 10 OFFSET (N-1)*10`. Always include `ORDER BY` for consistent ordering. However, `OFFSET` pagination becomes slow on large tables because MySQL must scan and discard all previous rows to reach the offset. A more efficient approach for large datasets is **keyset/cursor pagination**: `WHERE id > last_seen_id ORDER BY id LIMIT 10`, which uses the index directly.

> **Q: How would you find the second highest (or Nth highest) salary in MySQL?**  
> **A:** Several approaches: (1) Subquery: `SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees)`. (2) LIMIT/OFFSET: `SELECT DISTINCT salary FROM employees ORDER BY salary DESC LIMIT 1 OFFSET 1`. (3) Window function (most robust): `SELECT salary FROM (SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk FROM employees) t WHERE rnk = 2`. The window function approach handles ties correctly and is the preferred modern answer.

---

## 8. Aggregate Functions

### Concept
Aggregate functions collapse multiple rows into a single value. They **ignore NULL** (except `COUNT(*)`).

### Code
```sql
-- COUNT
SELECT COUNT(*)         AS total_rows    FROM employees;  -- counts all rows including NULLs
SELECT COUNT(manager_id) AS has_manager  FROM employees;  -- counts non-NULL only
SELECT COUNT(DISTINCT dept_id) AS unique_depts FROM employees;

-- SUM
SELECT SUM(salary)  AS total_payroll  FROM employees;
SELECT SUM(CASE WHEN dept_id = 1 THEN salary ELSE 0 END) AS dept1_payroll FROM employees;

-- AVG
SELECT AVG(salary) AS avg_salary FROM employees;
-- Note: AVG ignores NULLs — use COALESCE for different behavior
SELECT AVG(COALESCE(salary, 0)) AS avg_incl_nulls FROM employees;

-- MIN / MAX
SELECT MIN(salary) AS lowest,  MAX(salary) AS highest FROM employees;
SELECT MIN(hire_date) AS oldest_hire, MAX(hire_date) AS newest_hire FROM employees;

-- All aggregates together
SELECT
    COUNT(*)            AS headcount,
    COUNT(DISTINCT dept_id) AS departments,
    SUM(salary)         AS total_payroll,
    AVG(salary)         AS avg_salary,
    MIN(salary)         AS min_salary,
    MAX(salary)         AS max_salary,
    MAX(salary) - MIN(salary) AS salary_range
FROM employees;

-- GROUP_CONCAT — aggregate strings
SELECT 
    dept_id,
    GROUP_CONCAT(first_name ORDER BY first_name SEPARATOR ', ') AS members
FROM employees
GROUP BY dept_id;
```

### ⚡ Recall
| Function | NULLs | Description |
|----------|-------|-------------|
| `COUNT(*)` | Included | All rows |
| `COUNT(col)` | Excluded | Non-null rows |
| `SUM(col)` | Excluded | Total |
| `AVG(col)` | Excluded | Mean |
| `MIN/MAX(col)` | Excluded | Extremes |
| `GROUP_CONCAT` | Excluded | String aggregation |

### 🎯 Interview Q&A

> **Q: What is the difference between `COUNT(*)`, `COUNT(column)`, and `COUNT(DISTINCT column)`?**  
> **A:** `COUNT(*)` counts all rows in the group, including those with NULL values in any column — it counts the row itself. `COUNT(column)` counts only rows where that specific column is **not NULL** — useful for counting non-missing values. `COUNT(DISTINCT column)` counts the number of unique non-NULL values in that column. For example, if you want to know how many employees have a phone number, use `COUNT(phone)`; to know how many unique departments exist, use `COUNT(DISTINCT dept_id)`.

> **Q: How do aggregate functions handle NULL values?**  
> **A:** Almost all aggregate functions **ignore NULL values**: `SUM()`, `AVG()`, `MIN()`, `MAX()`, `COUNT(col)`, and `GROUP_CONCAT()` all skip NULLs. Only `COUNT(*)` includes NULLs because it counts rows, not column values. This has an important implication for `AVG()` — `AVG(commission)` calculates the average only over employees who have a commission value, not over all employees. To include NULLs as zero, use `AVG(COALESCE(commission, 0))`.

> **Q: What does `GROUP_CONCAT` do?**  
> **A:** `GROUP_CONCAT` is a MySQL-specific aggregate function that concatenates values from multiple rows within a group into a single string. For example, `SELECT dept_id, GROUP_CONCAT(first_name ORDER BY first_name SEPARATOR ', ') FROM employees GROUP BY dept_id` returns each department with a comma-separated list of its employees' names. It has a default length limit (1024 bytes) configurable via `group_concat_max_len`. Useful for creating comma-separated lists, tags, or denormalized summaries.

> **Q: Can you use aggregate functions in a WHERE clause?**  
> **A:** No — aggregate functions cannot be used in a WHERE clause because WHERE filters rows **before** aggregation occurs. To filter based on an aggregate value, use **HAVING** (which runs after GROUP BY), or use a subquery/CTE. For example, `WHERE AVG(salary) > 60000` is invalid; use `HAVING AVG(salary) > 60000` after `GROUP BY dept_id`. The one exception is when the aggregate is in a subquery: `WHERE salary > (SELECT AVG(salary) FROM employees)` — this is valid because the subquery runs independently.

---

## 9. GROUP BY & HAVING

### Concept
`GROUP BY` groups rows sharing the same value(s) into summary rows. After grouping, each group becomes one row in the result. You can only SELECT: the grouped columns + aggregates.

### Code
```sql
-- Basic GROUP BY
SELECT dept_id, COUNT(*) AS headcount
FROM employees
GROUP BY dept_id;

-- Multiple columns
SELECT dept_id, job_title, COUNT(*), AVG(salary)
FROM employees
GROUP BY dept_id, job_title;

-- GROUP BY with HAVING
SELECT 
    dept_id,
    COUNT(*)        AS headcount,
    AVG(salary)     AS avg_salary,
    MAX(salary)     AS top_salary
FROM employees
WHERE hire_date >= '2020-01-01'        -- filter rows first
GROUP BY dept_id
HAVING COUNT(*) >= 3                   -- then filter groups
   AND AVG(salary) > 60000
ORDER BY avg_salary DESC;

-- Rollup — adds subtotals and grand total
SELECT dept_id, job_title, SUM(salary) AS total
FROM employees
GROUP BY dept_id, job_title WITH ROLLUP;

-- Grouping with CASE
SELECT 
    CASE 
        WHEN salary < 50000  THEN 'Low'
        WHEN salary < 80000  THEN 'Mid'
        ELSE                      'High'
    END AS salary_band,
    COUNT(*) AS employee_count
FROM employees
GROUP BY salary_band
ORDER BY MIN(salary);
```

### ⚡ Recall
- **Rule:** SELECT can only have **grouped columns** or **aggregate functions**
- `WHERE` → filters **before** GROUP BY
- `HAVING` → filters **after** GROUP BY (can use aggregates)
- `WITH ROLLUP` → adds subtotals automatically

### 🎯 Interview Q&A

> **Q: What is the rule for which columns can appear in SELECT when using GROUP BY?**  
> **A:** When using GROUP BY, every column in the SELECT list must either be: (1) included in the GROUP BY clause, or (2) wrapped in an aggregate function (COUNT, SUM, AVG, MIN, MAX). This is because GROUP BY collapses multiple rows into one — for a non-grouped, non-aggregated column, MySQL wouldn't know which row's value to show. MySQL has a `ONLY_FULL_GROUP_BY` mode (on by default in MySQL 5.7+) that enforces this rule strictly. Violating it in earlier versions would return indeterminate results.

> **Q: Write a query to find departments with more than 5 employees and average salary above $60,000.**  
> **A:** `SELECT dept_id, COUNT(*) AS headcount, AVG(salary) AS avg_salary FROM employees GROUP BY dept_id HAVING COUNT(*) > 5 AND AVG(salary) > 60000;` — The key insight is that both conditions are on aggregated values, so they belong in HAVING, not WHERE. If you also want to exclude part-time employees before grouping, add `WHERE employment_type = 'full-time'` before the GROUP BY.

> **Q: What does `WITH ROLLUP` do in GROUP BY?**  
> **A:** `WITH ROLLUP` adds extra summary rows to the GROUP BY result — subtotals for each grouping level and a grand total at the end. For `GROUP BY dept_id, job_title WITH ROLLUP`, you get rows for each (dept, job) combination, then subtotal rows for each dept (with job=NULL), then a grand total row (with both dept and job=NULL). It's useful for generating report-style summaries without needing a separate UNION query. Use `GROUPING()` function to distinguish actual NULLs from ROLLUP-generated NULLs.

> **Q: What is the difference between WHERE and HAVING in the context of GROUP BY?**  
> **A:** `WHERE` is a **pre-aggregation filter** — it runs before GROUP BY and reduces the rows that enter the grouping. `HAVING` is a **post-aggregation filter** — it runs after GROUP BY and filters the resulting groups. For performance, always push conditions that can be applied to individual rows into WHERE instead of HAVING, because this reduces the data processed by GROUP BY. Only use HAVING for conditions that require aggregate results.

---

## 10. JOINs — All Types

### Concept
JOINs combine rows from two or more tables based on a related column.

```
INNER JOIN  — only matching rows from BOTH tables
LEFT JOIN   — all rows from LEFT + matches from RIGHT (NULL if no match)
RIGHT JOIN  — all rows from RIGHT + matches from LEFT (NULL if no match)
FULL JOIN   — all rows from BOTH (MySQL: simulate with UNION)
CROSS JOIN  — every row × every row (cartesian product)
SELF JOIN   — table joined with itself
```

### Code

#### INNER JOIN
```sql
-- Only employees who have a department
SELECT 
    e.first_name, e.last_name, e.salary,
    d.dept_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id;
```

#### LEFT JOIN
```sql
-- ALL employees, department info if available (NULL if no dept)
SELECT 
    e.first_name, e.last_name,
    d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;

-- Find employees WITHOUT a department
SELECT e.*
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;
```

#### RIGHT JOIN
```sql
-- All departments, employees if any (NULL if empty dept)
SELECT 
    e.first_name,
    d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;
```

#### FULL OUTER JOIN (MySQL simulation)
```sql
SELECT e.first_name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id

UNION

SELECT e.first_name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;
```

#### CROSS JOIN
```sql
-- Every combination (5 employees × 3 products = 15 rows)
SELECT e.first_name, p.product_name
FROM employees e
CROSS JOIN products p;
```

#### SELF JOIN
```sql
-- Find each employee and their manager
SELECT 
    e.first_name              AS employee,
    m.first_name              AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;
```

#### Multiple JOINs
```sql
SELECT 
    o.order_id,
    c.customer_name,
    p.product_name,
    oi.quantity,
    oi.unit_price
FROM orders o
JOIN customers c   ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p    ON oi.product_id = p.product_id
WHERE o.order_date >= '2024-01-01';
```

### ⚡ Recall
```
LEFT JOIN  = "Give me everything from LEFT, match if you can"
INNER JOIN = "Only give me the matches"
RIGHT JOIN = LEFT JOIN written backwards (rarely used)
SELF JOIN  = "Talk to yourself" — org charts, hierarchies
```

**Venn Diagram Mental Model:**
- INNER = intersection only
- LEFT = left circle + intersection
- RIGHT = right circle + intersection
- FULL = entire both circles

### 🎯 Interview Q&A

> **Q: Explain the difference between INNER JOIN and LEFT JOIN with an example.**  
> **A:** `INNER JOIN` returns only rows where there is a **match in both tables**. If an employee has no department (`dept_id` is NULL or doesn't exist in departments), that employee is excluded. `LEFT JOIN` returns **all rows from the left table** plus matching rows from the right — if no match exists in the right table, the right-side columns show NULL. Example: `SELECT e.name, d.dept_name FROM employees e LEFT JOIN departments d ON e.dept_id = d.dept_id` shows all employees, including those without departments (dept_name = NULL for them).

> **Q: How do you find rows that exist in one table but NOT in another (anti-join)?**  
> **A:** Two approaches: (1) **LEFT JOIN + IS NULL**: `SELECT e.* FROM employees e LEFT JOIN departments d ON e.dept_id = d.dept_id WHERE d.dept_id IS NULL` — this returns employees with no matching department. (2) **NOT EXISTS**: `SELECT * FROM employees e WHERE NOT EXISTS (SELECT 1 FROM departments d WHERE d.dept_id = e.dept_id)`. Both are anti-join patterns. The LEFT JOIN + IS NULL approach is generally preferred for readability and often performs similarly.

> **Q: What is a SELF JOIN and when would you use it?**  
> **A:** A SELF JOIN joins a table to itself by giving it two different aliases. The classic use case is **hierarchical data** — employee-manager relationships where both the employee and their manager are in the same `employees` table. Example: `SELECT e.first_name AS employee, m.first_name AS manager FROM employees e LEFT JOIN employees m ON e.manager_id = m.emp_id`. Other uses: finding duplicate records, comparing rows within the same table, or computing row-to-row differences.

> **Q: What is a CROSS JOIN and when is it useful?**  
> **A:** A CROSS JOIN produces the Cartesian product — every row from the first table combined with every row from the second table. If table A has 10 rows and table B has 5 rows, the result has 50 rows. Use cases: generating all combinations (e.g., all possible product-color combinations for inventory), creating test datasets, or building a calendar table by crossing dates with hours. Be careful — CROSS JOINs on large tables produce enormous results.

> **Q: What is the difference between a JOIN condition in ON vs WHERE?**  
> **A:** For INNER JOINs, putting the condition in ON or WHERE gives identical results. The difference matters for OUTER JOINs: a condition in `ON` is applied **during the join** (before NULL rows are added), while a condition in `WHERE` is applied **after** the join. Example: `LEFT JOIN orders o ON o.customer_id = c.id AND o.status = 'paid'` — returns all customers, with order info only for paid orders. `LEFT JOIN orders o ON o.customer_id = c.id WHERE o.status = 'paid'` — effectively becomes an INNER JOIN because NULL rows (customers with no paid orders) are filtered out by WHERE.

---

## 11. Subqueries

### Concept
A **subquery** is a query inside another query. It can appear in `SELECT`, `FROM`, `WHERE`, or `HAVING`.

Types:
- **Scalar** — returns single value (used in SELECT or WHERE)
- **Row** — returns one row
- **Table** — returns multiple rows/columns (used in FROM)
- **Correlated** — references outer query (re-runs for each row)

### Code

#### Scalar Subquery in WHERE
```sql
-- Employees earning more than the average salary
SELECT first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
```

#### Subquery with IN
```sql
-- Employees in departments located in 'New York'
SELECT first_name, last_name
FROM employees
WHERE dept_id IN (
    SELECT dept_id 
    FROM departments 
    WHERE location = 'New York'
);
```

#### Subquery in FROM (Derived Table)
```sql
-- Average salary by department, then filter depts
SELECT dept_name, avg_sal
FROM (
    SELECT d.dept_name, AVG(e.salary) AS avg_sal
    FROM employees e
    JOIN departments d ON e.dept_id = d.dept_id
    GROUP BY d.dept_name
) dept_summary
WHERE avg_sal > 70000;
```

#### Scalar Subquery in SELECT
```sql
-- Show each employee's salary vs company average
SELECT 
    first_name,
    salary,
    (SELECT AVG(salary) FROM employees) AS company_avg,
    salary - (SELECT AVG(salary) FROM employees) AS diff_from_avg
FROM employees;
```

#### Correlated Subquery
```sql
-- Employees earning more than their department's average
SELECT first_name, salary, dept_id
FROM employees e1
WHERE salary > (
    SELECT AVG(salary) 
    FROM employees e2 
    WHERE e2.dept_id = e1.dept_id   -- ← references outer query
);
```

#### EXISTS / NOT EXISTS
```sql
-- Customers who have placed at least one order
SELECT customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
);

-- Customers who have NEVER ordered
SELECT customer_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
);
```

### ⚡ Recall
- Subquery in **WHERE** = filter by a computed value
- Subquery in **FROM** = treat query result as a table (must alias it)
- Subquery in **SELECT** = add a computed column
- **Correlated** = slow! re-runs per row → consider JOIN instead
- `EXISTS` is faster than `IN` for large datasets

### 🎯 Interview Q&A

> **Q: What is a correlated subquery and what is its performance concern?**  
> **A:** A correlated subquery references columns from the outer query — it is **re-executed once for every row** the outer query processes. Example: `SELECT * FROM employees e WHERE salary > (SELECT AVG(salary) FROM employees WHERE dept_id = e.dept_id)` — the inner query runs once per employee row. This can be extremely slow on large tables (O(n) executions). The fix is to pre-aggregate into a CTE or derived table, then JOIN — computing the department average once instead of once per employee.

> **Q: What is the difference between a subquery and a JOIN — when would you choose each?**  
> **A:** JOINs and subqueries can often produce the same result, but differ in readability and performance. Use a **JOIN** when combining columns from multiple tables, when the optimizer can better optimize it, or when you need rows from both tables. Use a **subquery** when filtering based on existence in another table, when the inner query needs to be computed independently, or for readability when the relationship is conceptually "does this thing exist?" JOINs are generally more efficient than correlated subqueries. CTEs are the modern alternative when a subquery would be reused.

> **Q: What is the difference between `IN` and `EXISTS`?**  
> **A:** `IN` executes the subquery once and builds a list — it checks if each outer row's value appears in that list. It can struggle with large subquery result sets or NULLs in the list. `EXISTS` is a correlated subquery that checks **if at least one matching row exists** and short-circuits immediately when found — it's often faster for large datasets because it doesn't need to build a full list. Also, `NOT IN` has a NULL-trap: if the subquery returns any NULL, the entire `NOT IN` evaluates to no rows returned. `NOT EXISTS` handles NULLs correctly.

---

## 12. Window Functions

### Concept
**Window functions** perform calculations **across a set of rows related to the current row**, without collapsing them into groups like `GROUP BY` does.

```sql
function_name() OVER (
    PARTITION BY col    -- divide into groups (optional)
    ORDER BY col        -- sort within each group
    ROWS/RANGE BETWEEN  -- frame definition (optional)
)
```

### Code

#### Ranking Functions
```sql
-- ROW_NUMBER: unique sequential number
SELECT first_name, salary, dept_id,
    ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS row_num
FROM employees;

-- RANK: same value = same rank, gaps after ties (1,1,3)
SELECT first_name, salary,
    RANK() OVER (ORDER BY salary DESC) AS rnk
FROM employees;

-- DENSE_RANK: same value = same rank, NO gaps (1,1,2)
SELECT first_name, salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rnk
FROM employees;

-- NTILE: divide into N buckets/quartiles
SELECT first_name, salary,
    NTILE(4) OVER (ORDER BY salary) AS quartile
FROM employees;
```

#### Offset Functions
```sql
-- LAG: access the PREVIOUS row's value
SELECT order_date, revenue,
    LAG(revenue, 1, 0) OVER (ORDER BY order_date) AS prev_revenue,
    revenue - LAG(revenue, 1, 0) OVER (ORDER BY order_date) AS day_change
FROM daily_sales;

-- LEAD: access the NEXT row's value
SELECT order_date, revenue,
    LEAD(revenue, 1) OVER (ORDER BY order_date) AS next_revenue
FROM daily_sales;

-- FIRST_VALUE / LAST_VALUE
SELECT first_name, salary, dept_id,
    FIRST_VALUE(salary) OVER (PARTITION BY dept_id ORDER BY salary DESC) AS dept_max_salary,
    LAST_VALUE(salary)  OVER (
        PARTITION BY dept_id 
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS dept_min_salary
FROM employees;
```

#### Aggregate Window Functions
```sql
-- Running total
SELECT order_date, revenue,
    SUM(revenue) OVER (ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM daily_sales;

-- Moving average (last 7 days)
SELECT order_date, revenue,
    AVG(revenue) OVER (ORDER BY order_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS moving_avg_7d
FROM daily_sales;

-- Percent of total
SELECT dept_id, first_name, salary,
    ROUND(salary / SUM(salary) OVER () * 100, 2) AS pct_of_total_payroll,
    ROUND(salary / SUM(salary) OVER (PARTITION BY dept_id) * 100, 2) AS pct_of_dept_payroll
FROM employees;
```

### ⚡ Recall
| Function | What it does |
|----------|-------------|
| `ROW_NUMBER()` | 1,2,3,4,5 — always unique |
| `RANK()` | 1,1,3 — gaps after ties |
| `DENSE_RANK()` | 1,1,2 — no gaps |
| `LAG(col, n)` | Value n rows behind |
| `LEAD(col, n)` | Value n rows ahead |
| `NTILE(4)` | Bucket number (quartile) |
| `SUM() OVER(ORDER BY)` | Running total |

### 🎯 Interview Q&A

> **Q: What is the difference between ROW_NUMBER, RANK, and DENSE_RANK?**  
> **A:** All three assign numbers to rows within an ordered partition, but handle ties differently. `ROW_NUMBER()` assigns a **unique sequential number** — even tied rows get different numbers (1,2,3,4). `RANK()` assigns the **same rank to ties** but leaves gaps — two employees tied for first both get rank 1, then the next is rank 3 (1,1,3). `DENSE_RANK()` assigns the same rank to ties but **no gaps** — ties get the same rank and the next rank is consecutive (1,1,2). Use RANK for competition-style rankings; DENSE_RANK when you need contiguous rank values; ROW_NUMBER for pagination or de-duplication.

> **Q: What is the difference between window functions and GROUP BY?**  
> **A:** Both perform calculations across sets of rows, but `GROUP BY` **collapses** multiple rows into one summary row per group — you lose the individual rows. Window functions **retain all rows** while adding a computed column based on a window of rows. With GROUP BY you can't see both the individual salary and the department average in the same row. With a window function (`AVG(salary) OVER (PARTITION BY dept_id)`), each row keeps its original data plus the computed aggregate. Window functions are added in MySQL 8.0 and are one of the most powerful analytical tools.

> **Q: What does PARTITION BY do in a window function?**  
> **A:** `PARTITION BY` divides the rows into independent groups (partitions) before the window function computes — similar to GROUP BY but without collapsing rows. `ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY salary DESC)` resets the row number to 1 at the start of each department. Without PARTITION BY, the window function operates over the entire result set as one partition. Think of it as: PARTITION BY = "for each [group], independently apply this function."

> **Q: How would you find the top 3 earners in each department using window functions?**  
> **A:** `SELECT * FROM (SELECT *, DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk FROM employees) ranked WHERE rnk <= 3;` — DENSE_RANK is preferred over RANK here so that tied third-place employees all appear, without skipping anyone. ROW_NUMBER would arbitrarily pick only 3 rows and could exclude tied employees. This is a classic interview question that tests knowledge of both window functions and the pattern of filtering on a derived table.

> **Q: What is LAG and LEAD and when are they useful?**  
> **A:** `LAG(col, n)` returns the value of `col` from the row `n` rows **before** the current row. `LEAD(col, n)` returns the value `n` rows **after**. Both are evaluated within the window's ORDER BY. They're extremely useful for **period-over-period comparisons** — comparing today's revenue to yesterday's, computing day-over-day change, detecting gaps in sequential data, or calculating the time between events. Example: `revenue - LAG(revenue) OVER (ORDER BY date)` gives daily revenue change without a self-join.

---

## 13. String Functions

### Code
```sql
-- Length
SELECT LENGTH('Hello');          -- 5 (bytes)
SELECT CHAR_LENGTH('Hello');     -- 5 (characters — safer for multi-byte)

-- Case
SELECT UPPER('hello');           -- HELLO
SELECT LOWER('WORLD');           -- world

-- Trimming whitespace
SELECT TRIM('  hello  ');        -- 'hello'
SELECT LTRIM('  hello');         -- 'hello'
SELECT RTRIM('hello  ');         -- 'hello'

-- Substring
SELECT SUBSTRING('Hello World', 7, 5);   -- 'World' (start=7, length=5)
SELECT SUBSTR('Hello World', 7);         -- 'World' (start to end)
SELECT LEFT('Hello World', 5);           -- 'Hello'
SELECT RIGHT('Hello World', 5);          -- 'World'
SELECT MID('Hello World', 7, 5);         -- 'World'

-- Search & position
SELECT INSTR('Hello World', 'World');    -- 7 (position)
SELECT LOCATE('World', 'Hello World');  -- 7

-- Replace
SELECT REPLACE('Hello World', 'World', 'MySQL');  -- 'Hello MySQL'

-- Concatenate
SELECT CONCAT('Hello', ' ', 'World');            -- 'Hello World'
SELECT CONCAT_WS(', ', 'Alice', 'Bob', 'Carol'); -- 'Alice, Bob, Carol' (with separator)

-- Padding
SELECT LPAD('7', 3, '0');   -- '007'
SELECT RPAD('7', 3, '0');   -- '700'

-- Repeat & Reverse
SELECT REPEAT('ab', 3);     -- 'ababab'
SELECT REVERSE('Hello');    -- 'olleH'

-- Format numbers as strings
SELECT FORMAT(1234567.891, 2);   -- '1,234,567.89'

-- Extract email domain
SELECT SUBSTRING(email, INSTR(email, '@') + 1) AS domain FROM employees;

-- Full text search (for large text)
SELECT * FROM articles
WHERE MATCH(title, body) AGAINST('MySQL optimization' IN NATURAL LANGUAGE MODE);
```

### 🎯 Interview Q&A

> **Q: What is the difference between `LENGTH()` and `CHAR_LENGTH()`?**  
> **A:** `LENGTH()` returns the length in **bytes**, while `CHAR_LENGTH()` returns the length in **characters**. For ASCII characters they return the same value, but they differ for multi-byte character sets (like UTF-8). A single emoji or Chinese character may take 3–4 bytes but is 1 character. For string length validation (e.g., "max 100 characters"), always use `CHAR_LENGTH()`. Use `LENGTH()` when you care about storage size.

> **Q: How would you extract the domain from an email address in MySQL?**  
> **A:** Use `SUBSTRING` combined with `INSTR` to locate the `@` symbol: `SELECT SUBSTRING(email, INSTR(email, '@') + 1) AS domain FROM users;` — `INSTR` finds the position of `@`, adding 1 moves past it, and `SUBSTRING` extracts everything from that position to the end. You could also use `SUBSTRING_INDEX(email, '@', -1)` which is cleaner: it splits on `@` and takes the last part.

> **Q: What does `CONCAT_WS` do differently from `CONCAT`?**  
> **A:** `CONCAT_WS(separator, val1, val2, ...)` concatenates values with a separator **and automatically skips NULL values**. `CONCAT('Hello', NULL, 'World')` returns NULL (NULL propagates). `CONCAT_WS(' ', 'Hello', NULL, 'World')` returns `'Hello World'` — NULLs are silently ignored. This makes `CONCAT_WS` much safer for building strings from potentially NULL columns like building a full name from first, middle, and last name.

---

## 14. Date & Time Functions

### Code
```sql
-- Current date/time
SELECT NOW();                  -- 2024-05-01 14:30:00
SELECT CURDATE();              -- 2024-05-01
SELECT CURTIME();              -- 14:30:00
SELECT CURRENT_TIMESTAMP();    -- same as NOW()

-- Extract parts
SELECT YEAR('2024-05-15');     -- 2024
SELECT MONTH('2024-05-15');    -- 5
SELECT DAY('2024-05-15');      -- 15
SELECT HOUR('14:30:00');       -- 14
SELECT MINUTE('14:30:00');     -- 30
SELECT SECOND('14:30:00');     -- 0
SELECT DAYOFWEEK('2024-05-15');  -- 4 (1=Sunday)
SELECT DAYOFYEAR('2024-05-15'); -- 136
SELECT WEEK('2024-05-15');      -- 20
SELECT QUARTER('2024-05-15');   -- 2

-- EXTRACT (ANSI standard)
SELECT EXTRACT(YEAR  FROM '2024-05-15');
SELECT EXTRACT(MONTH FROM '2024-05-15');
SELECT EXTRACT(DAY   FROM '2024-05-15');

-- Date arithmetic
SELECT DATE_ADD('2024-01-01', INTERVAL 1 YEAR);    -- 2025-01-01
SELECT DATE_ADD('2024-01-01', INTERVAL 3 MONTH);   -- 2024-04-01
SELECT DATE_ADD('2024-01-01', INTERVAL 30 DAY);    -- 2024-01-31
SELECT DATE_SUB('2024-05-15', INTERVAL 7 DAY);     -- 2024-05-08

-- Difference between dates
SELECT DATEDIFF('2024-12-31', '2024-01-01');         -- 365 (days)
SELECT TIMESTAMPDIFF(MONTH, '2022-01-01', '2024-05-01');  -- 28 (months)
SELECT TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_employed FROM employees;

-- Formatting
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d');           -- 2024-05-01
SELECT DATE_FORMAT(NOW(), '%d/%m/%Y');           -- 01/05/2024
SELECT DATE_FORMAT(NOW(), '%W, %M %d, %Y');      -- Wednesday, May 01, 2024
SELECT DATE_FORMAT(NOW(), '%H:%i %p');           -- 14:30 PM

-- Convert string to date
SELECT STR_TO_DATE('15-05-2024', '%d-%m-%Y');    -- 2024-05-15

-- Last day of month
SELECT LAST_DAY('2024-02-01');   -- 2024-02-29

-- Day name / Month name
SELECT DAYNAME('2024-05-15');    -- Wednesday
SELECT MONTHNAME('2024-05-15');  -- May

-- Practical: group sales by month
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(total) AS revenue
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- Practical: orders from last 30 days
SELECT * FROM orders
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);
```

### 🎯 Interview Q&A

> **Q: How do you get orders from the last 30 days in MySQL?**  
> **A:** `SELECT * FROM orders WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);` — `DATE_SUB` subtracts an interval from a date. `CURDATE()` returns today's date without time. An alternative: `WHERE order_date >= NOW() - INTERVAL 30 DAY` works with DATETIME columns. Critical note: avoid wrapping the column in a function like `WHERE DATE(order_date) >= ...` because functions on the left side of a condition prevent index usage — always keep the indexed column bare on the left.

> **Q: What is the difference between `NOW()`, `CURDATE()`, and `CURTIME()`?**  
> **A:** `NOW()` returns the current **date and time** as `DATETIME` (e.g., `2024-05-01 14:30:00`). `CURDATE()` returns only the **current date** (e.g., `2024-05-01`). `CURTIME()` returns only the **current time** (e.g., `14:30:00`). `CURRENT_TIMESTAMP` is a synonym for `NOW()`. Use `CURDATE()` when comparing against DATE columns to avoid implicit type casting issues.

> **Q: How would you group sales data by month and year for a trend report?**  
> **A:** `SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(total) AS revenue FROM orders GROUP BY DATE_FORMAT(order_date, '%Y-%m') ORDER BY month;` — `DATE_FORMAT` with `'%Y-%m'` truncates timestamps to month precision. An alternative is `GROUP BY YEAR(order_date), MONTH(order_date)` which is slightly more readable but produces two GROUP BY columns. Always `ORDER BY month` (the string) rather than `ORDER BY 1` to ensure correct chronological order.

> **Q: How do you calculate a person's age or years of service in MySQL?**  
> **A:** Use `TIMESTAMPDIFF(YEAR, birth_date, CURDATE())` for age in years, or `TIMESTAMPDIFF(MONTH, hire_date, CURDATE())` for months of service. `DATEDIFF()` only returns days and doesn't handle month/year differences well. `TIMESTAMPDIFF` correctly handles partial years — if hired 6 months ago, it returns 0 years (not 1), making it accurate for true years-of-service calculations.

---

## 15. Math & Numeric Functions

### Code
```sql
-- Rounding
SELECT ROUND(3.14159, 2);     -- 3.14
SELECT ROUND(3.145, 2);       -- 3.15
SELECT CEIL(3.2);             -- 4  (round UP)
SELECT FLOOR(3.9);            -- 3  (round DOWN)
SELECT TRUNCATE(3.9876, 2);   -- 3.98 (chop, no rounding)

-- Absolute value, sign
SELECT ABS(-42);              -- 42
SELECT SIGN(-5);              -- -1
SELECT SIGN(5);               -- 1
SELECT SIGN(0);               -- 0

-- Power and roots
SELECT POWER(2, 10);          -- 1024
SELECT POW(2, 10);            -- 1024 (same)
SELECT SQRT(144);             -- 12

-- Modulo (remainder)
SELECT MOD(17, 5);            -- 2
SELECT 17 % 5;                -- 2

-- Logarithms
SELECT LOG(100);              -- natural log
SELECT LOG10(1000);           -- 3
SELECT LOG2(1024);            -- 10

-- Random number (0 to 1)
SELECT RAND();                -- 0.7341...
-- Random integer between 1 and 100
SELECT FLOOR(RAND() * 100) + 1;

-- Greatest / Least across columns
SELECT GREATEST(10, 25, 7, 15);   -- 25
SELECT LEAST(10, 25, 7, 15);      -- 7
```

### 🎯 Interview Q&A

> **Q: What is the difference between `ROUND`, `CEIL`, `FLOOR`, and `TRUNCATE`?**  
> **A:** `ROUND(x, d)` rounds to d decimal places using standard rounding (≥0.5 rounds up). `CEIL(x)` always rounds **up** to the nearest integer (ceiling). `FLOOR(x)` always rounds **down** to the nearest integer (floor). `TRUNCATE(x, d)` **chops off** digits after d decimal places without rounding — `TRUNCATE(3.99, 0)` = 3, not 4. Use ROUND for display/reporting, FLOOR for bucketing/pagination, CEIL for sizing/capacity calculations, and TRUNCATE when you need exact truncation without rounding.

> **Q: How do you generate a random integer between 1 and 100 in MySQL?**  
> **A:** `SELECT FLOOR(RAND() * 100) + 1;` — `RAND()` returns a float between 0 (inclusive) and 1 (exclusive). Multiply by 100 gives 0–99.999..., `FLOOR` truncates to 0–99, and adding 1 shifts to 1–100. This is useful for sampling, generating test data, or random ordering: `ORDER BY RAND()` shuffles rows randomly (though it's slow on large tables — better alternatives exist for production use).

> **Q: How would you avoid a division-by-zero error in MySQL?**  
> **A:** Use `NULLIF(denominator, 0)` — it returns NULL when the denominator is 0, and MySQL treats division by NULL as NULL (not an error): `SELECT total / NULLIF(quantity, 0) AS unit_price`. Alternatively wrap in a `CASE`: `CASE WHEN quantity = 0 THEN NULL ELSE total / quantity END`. The `NULLIF` approach is more concise. Division by zero in MySQL returns NULL by default (unlike some languages that throw exceptions), but using `NULLIF` makes the intent explicit.

---

## 16. NULL Handling

### Concept
`NULL` means **unknown/missing** — it is not zero, not empty string, not false. NULL comparisons always return NULL (not TRUE or FALSE).

```sql
NULL = NULL     → NULL (not TRUE!)
NULL != NULL    → NULL
NULL > 5        → NULL
```

### Code
```sql
-- Check for NULL
SELECT * FROM employees WHERE manager_id IS NULL;
SELECT * FROM employees WHERE manager_id IS NOT NULL;

-- COALESCE — returns first non-NULL value
SELECT COALESCE(phone, mobile, 'No contact') AS contact FROM employees;
SELECT COALESCE(discount, 0) AS discount FROM orders;   -- replace NULL with 0

-- IFNULL — simpler version of COALESCE (2 args only)
SELECT IFNULL(commission, 0) AS commission FROM employees;

-- NULLIF — returns NULL if two values are equal (avoid division by zero)
SELECT total / NULLIF(quantity, 0) AS unit_price FROM order_items;
-- If quantity = 0, returns NULL instead of ERROR

-- IF function
SELECT IF(salary > 70000, 'High', 'Normal') AS salary_tier FROM employees;

-- NULL in aggregates — they're IGNORED
SELECT AVG(commission) FROM employees;   -- ignores NULL commissions

-- NULL in ORDER BY — NULLs sort first by default
SELECT name, commission FROM employees ORDER BY commission DESC;
-- NULLs appear LAST when DESC, FIRST when ASC

-- Handle NULLs in ORDER BY
SELECT name, commission 
FROM employees 
ORDER BY COALESCE(commission, -1) DESC;  -- put NULLs last

-- NULL in string concat — propagates NULL!
SELECT CONCAT('Hello', NULL, 'World');   -- NULL
SELECT CONCAT_WS(' ', 'Hello', NULL, 'World');  -- 'Hello World' (WS skips NULLs)
```

### ⚡ Recall
- `IS NULL` not `= NULL` (NULL = NULL is always NULL!)
- `COALESCE(a, b, c)` = first non-null
- `IFNULL(a, b)` = if a is null return b
- `NULLIF(a, b)` = if a = b return NULL (great for divide-by-zero)

### 🎯 Interview Q&A

> **Q: Why can't you use `= NULL` to check for NULL in SQL?**  
> **A:** Because NULL represents **unknown** — it is not a value you can compare. Any comparison with NULL using `=`, `!=`, `>`, `<` returns **NULL** (not TRUE or FALSE). `NULL = NULL` evaluates to NULL, not TRUE. This is SQL's three-valued logic (TRUE, FALSE, UNKNOWN). The correct way to check for NULL is `IS NULL` or `IS NOT NULL`, which are special operators designed for this purpose. This is one of the most common SQL beginner mistakes.

> **Q: What is the difference between `COALESCE`, `IFNULL`, and `NULLIF`?**  
> **A:** `COALESCE(a, b, c, ...)` returns the **first non-NULL** value from a list of any length — ANSI standard and works across databases. `IFNULL(a, b)` is MySQL-specific and returns `b` if `a` is NULL — equivalent to `COALESCE(a, b)` but only accepts 2 arguments. `NULLIF(a, b)` is the **reverse** — it returns NULL if `a` equals `b`, otherwise returns `a`. Primary use of `NULLIF` is preventing division-by-zero: `value / NULLIF(divisor, 0)`.

> **Q: How does NULL behave in aggregate functions?**  
> **A:** Aggregate functions (`SUM`, `AVG`, `COUNT(col)`, `MIN`, `MAX`) **ignore NULLs** — they skip NULL values as if those rows don't exist. This can produce misleading results: `AVG(commission)` gives the average only for employees who have a commission, not for all employees. If you want NULLs treated as 0 in an average: `AVG(COALESCE(commission, 0))`. Only `COUNT(*)` includes NULLs because it counts rows, not column values.

> **Q: What is the NULL trap in NOT IN with a subquery?**  
> **A:** If a subquery used with `NOT IN` returns **any NULL value**, the entire `NOT IN` condition evaluates to an empty result set — no rows are returned. This is because `x NOT IN (1, 2, NULL)` expands to `x != 1 AND x != 2 AND x != NULL`, and `x != NULL` is always NULL (unknown), making the whole expression NULL/false. The safe alternatives are `NOT EXISTS` (which handles NULLs correctly) or adding `WHERE col IS NOT NULL` inside the subquery.

---

## 17. CASE Expressions

### Concept
`CASE` is MySQL's if-else. Two forms: **simple** (compare one value) and **searched** (evaluate conditions).

### Code

#### Searched CASE (most common)
```sql
-- In SELECT
SELECT 
    first_name,
    salary,
    CASE 
        WHEN salary < 40000 THEN 'Entry'
        WHEN salary < 70000 THEN 'Mid'
        WHEN salary < 100000 THEN 'Senior'
        ELSE 'Executive'
    END AS salary_grade
FROM employees;

-- In ORDER BY
SELECT first_name, dept_id
FROM employees
ORDER BY CASE dept_id
    WHEN 1 THEN 'Sales'
    WHEN 2 THEN 'Engineering'
    WHEN 3 THEN 'HR'
END;

-- In GROUP BY — custom bucket grouping
SELECT 
    CASE 
        WHEN age < 25 THEN 'Gen Z'
        WHEN age < 40 THEN 'Millennial'
        WHEN age < 55 THEN 'Gen X'
        ELSE 'Boomer'
    END AS generation,
    COUNT(*) AS count
FROM users
GROUP BY 1;    -- GROUP BY the first SELECT expression

-- Conditional aggregation — CASE inside SUM/COUNT
SELECT
    SUM(CASE WHEN dept_id = 1 THEN salary ELSE 0 END) AS sales_payroll,
    SUM(CASE WHEN dept_id = 2 THEN salary ELSE 0 END) AS eng_payroll,
    COUNT(CASE WHEN gender = 'F' THEN 1 END) AS female_count,
    COUNT(CASE WHEN gender = 'M' THEN 1 END) AS male_count
FROM employees;
```

#### Simple CASE
```sql
SELECT first_name,
    CASE dept_id
        WHEN 1 THEN 'Sales'
        WHEN 2 THEN 'Engineering'
        WHEN 3 THEN 'HR'
        ELSE 'Unknown'
    END AS department
FROM employees;
```

### ⚡ Recall
- CASE returns a **value** — use it anywhere an expression is valid
- **Searched CASE** = `WHEN condition THEN` — more flexible
- **Simple CASE** = `CASE col WHEN val THEN` — simpler
- `ELSE` is optional — returns NULL if no match and no ELSE

---

## 18. CTEs — Common Table Expressions

### Concept
A **CTE** is a named temporary result set defined with `WITH`. It makes complex queries readable and reusable **within that single query**.

Benefits over subqueries:
- More readable
- Can be referenced **multiple times** in same query
- Can be **recursive** (for trees/hierarchies)

### Code

#### Basic CTE
```sql
WITH dept_summary AS (
    SELECT dept_id, AVG(salary) AS avg_salary, COUNT(*) AS headcount
    FROM employees
    GROUP BY dept_id
)
SELECT 
    d.dept_name,
    ds.avg_salary,
    ds.headcount
FROM dept_summary ds
JOIN departments d ON ds.dept_id = d.dept_id
WHERE ds.avg_salary > 65000;
```

#### Multiple CTEs
```sql
WITH 
-- CTE 1: sales per employee
employee_sales AS (
    SELECT employee_id, SUM(amount) AS total_sales
    FROM sales
    GROUP BY employee_id
),
-- CTE 2: top earners
top_earners AS (
    SELECT emp_id, salary
    FROM employees
    WHERE salary > 80000
)
SELECT e.first_name, es.total_sales, te.salary
FROM employees e
JOIN employee_sales es ON e.emp_id = es.employee_id
JOIN top_earners    te ON e.emp_id = te.emp_id;
```

#### Recursive CTE — Hierarchy/Tree
```sql
-- Build org chart from CEO down
WITH RECURSIVE org_chart AS (
    -- Anchor: start with the CEO (no manager)
    SELECT emp_id, first_name, manager_id, 0 AS level
    FROM employees
    WHERE manager_id IS NULL
    
    UNION ALL
    
    -- Recursive: find reports of each previous level
    SELECT e.emp_id, e.first_name, e.manager_id, oc.level + 1
    FROM employees e
    JOIN org_chart oc ON e.manager_id = oc.emp_id
)
SELECT 
    CONCAT(REPEAT('  ', level), first_name) AS org_tree,
    level
FROM org_chart
ORDER BY level, first_name;
```

#### CTE for Running Total
```sql
WITH daily AS (
    SELECT DATE(order_date) AS day, SUM(total) AS revenue
    FROM orders
    GROUP BY DATE(order_date)
)
SELECT 
    day,
    revenue,
    SUM(revenue) OVER (ORDER BY day) AS running_total
FROM daily;
```

### ⚡ Recall
- CTE = **named subquery** at the top of your query
- Multiple CTEs = chain with commas after the first `)`
- **Recursive CTE** needs: anchor query + `UNION ALL` + recursive query
- CTEs exist **only for the duration** of the query

---

## 19. Views

### Concept
A **View** is a saved SQL query that acts like a virtual table. It stores the query definition, not the data.

Benefits:
- Simplify complex queries
- Restrict column access (security)
- Consistent interface for reporting

### Code
```sql
-- Create a view
CREATE VIEW v_employee_details AS
SELECT 
    e.emp_id,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    e.email,
    e.salary,
    d.dept_name,
    d.location
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

-- Use a view like a table
SELECT * FROM v_employee_details WHERE dept_name = 'Engineering';
SELECT full_name, salary FROM v_employee_details ORDER BY salary DESC LIMIT 10;

-- Update a view
CREATE OR REPLACE VIEW v_employee_details AS
SELECT 
    e.emp_id,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    e.salary,
    d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

-- Drop a view
DROP VIEW IF EXISTS v_employee_details;

-- Check if view is updatable
SHOW FULL TABLES IN sales_db WHERE TABLE_TYPE = 'VIEW';
```

### Updatable Views
```sql
-- Simple views (single table, no aggregates) can be updated
CREATE VIEW v_active_employees AS
SELECT emp_id, first_name, salary FROM employees WHERE is_active = 1;

-- This UPDATE works (simple view)
UPDATE v_active_employees SET salary = 80000 WHERE emp_id = 5;
```

### ⚡ Recall
- View = **saved query** pretending to be a table
- No data stored — query runs every time view is accessed
- Can SELECT, and sometimes UPDATE/INSERT through views
- Use for: **security** (hide columns), **simplicity** (hide complexity)

---

## 20. Indexes

### Concept
An **index** is a data structure (B-Tree by default) that speeds up data retrieval. Like a book index — instead of scanning every page, jump directly to the right page.

**Trade-off:** Indexes speed up `SELECT` but slow down `INSERT/UPDATE/DELETE` and use disk space.

### Code
```sql
-- Show indexes on a table
SHOW INDEX FROM employees;

-- Create an index (single column)
CREATE INDEX idx_last_name ON employees(last_name);

-- Create a composite index (multiple columns)
CREATE INDEX idx_dept_salary ON employees(dept_id, salary);

-- Create unique index
CREATE UNIQUE INDEX idx_email ON employees(email);

-- Drop an index
DROP INDEX idx_last_name ON employees;

-- Index via ALTER TABLE
ALTER TABLE employees ADD INDEX idx_hire_date (hire_date);

-- Prefix index (for long text columns)
CREATE INDEX idx_name_prefix ON employees(last_name(10));

-- FULLTEXT index (for text search)
CREATE FULLTEXT INDEX idx_body ON articles(title, body);

-- EXPLAIN — see if your query uses an index
EXPLAIN SELECT * FROM employees WHERE last_name = 'Smith';
-- Look for: "key" column — shows which index was used
-- "type" column — "ref" or "range" = good, "ALL" = full table scan = bad
```

### When to Create Indexes
```sql
-- Good candidates for indexes:
-- 1. Columns used in WHERE frequently
CREATE INDEX idx_status ON orders(status);

-- 2. Columns used in JOIN ON conditions
CREATE INDEX idx_customer_id ON orders(customer_id);

-- 3. Columns used in ORDER BY
CREATE INDEX idx_created_at ON logs(created_at);

-- 4. Composite: most selective column first
CREATE INDEX idx_dept_hire ON employees(dept_id, hire_date);
-- Good for: WHERE dept_id = X AND hire_date > Y
-- Good for: WHERE dept_id = X
-- NOT good for: WHERE hire_date > Y (alone) — leftmost rule!
```

### ⚡ Recall
- Index = **B-Tree lookup table** — faster reads, slower writes
- **Composite index** follows the **leftmost prefix rule** — (a,b,c) works for a; a,b; a,b,c — NOT b alone
- `EXPLAIN` shows whether your query uses an index
- `type: ALL` in EXPLAIN = **full table scan** = add an index!
- **Don't over-index** — every index costs on writes

---

## 21. Stored Procedures

### Concept
A **Stored Procedure** is a saved, named SQL program that can accept parameters and execute complex logic. Think of it as a function you call from SQL.

### Code
```sql
-- Change delimiter so ; inside proc doesn't end the CREATE
DELIMITER //

-- Basic procedure
CREATE PROCEDURE GetEmployeesByDept(IN dept_id_param INT)
BEGIN
    SELECT emp_id, first_name, last_name, salary
    FROM employees
    WHERE dept_id = dept_id_param
    ORDER BY last_name;
END //

DELIMITER ;

-- Call it
CALL GetEmployeesByDept(3);

-- Procedure with OUT parameter
DELIMITER //
CREATE PROCEDURE GetDeptStats(
    IN  dept_id_param INT,
    OUT emp_count     INT,
    OUT avg_sal       DECIMAL(10,2)
)
BEGIN
    SELECT COUNT(*), AVG(salary)
    INTO emp_count, avg_sal
    FROM employees
    WHERE dept_id = dept_id_param;
END //
DELIMITER ;

-- Call with OUT
CALL GetDeptStats(2, @count, @avg);
SELECT @count AS employees, @avg AS avg_salary;

-- Procedure with INOUT
DELIMITER //
CREATE PROCEDURE ApplySalaryRaise(
    INOUT sal DECIMAL(10,2),
    IN pct DECIMAL(5,2)
)
BEGIN
    SET sal = sal * (1 + pct / 100);
END //
DELIMITER ;

SET @my_sal = 70000;
CALL ApplySalaryRaise(@my_sal, 10);
SELECT @my_sal;  -- 77000

-- Procedure with IF logic
DELIMITER //
CREATE PROCEDURE CategorizeEmployee(IN emp_id_param INT)
BEGIN
    DECLARE v_salary DECIMAL(10,2);
    DECLARE v_category VARCHAR(20);
    
    SELECT salary INTO v_salary FROM employees WHERE emp_id = emp_id_param;
    
    IF v_salary < 50000 THEN
        SET v_category = 'Junior';
    ELSEIF v_salary < 80000 THEN
        SET v_category = 'Mid-level';
    ELSE
        SET v_category = 'Senior';
    END IF;
    
    SELECT emp_id_param AS emp_id, v_salary AS salary, v_category AS category;
END //
DELIMITER ;

-- Procedure with LOOP
DELIMITER //
CREATE PROCEDURE GenerateNumbers(IN n INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    CREATE TEMPORARY TABLE IF NOT EXISTS nums (num INT);
    TRUNCATE TABLE nums;
    
    WHILE i <= n DO
        INSERT INTO nums VALUES (i);
        SET i = i + 1;
    END WHILE;
    
    SELECT * FROM nums;
END //
DELIMITER ;

-- Drop procedure
DROP PROCEDURE IF EXISTS GetEmployeesByDept;

-- List all procedures
SHOW PROCEDURE STATUS WHERE Db = 'sales_db';
```

### ⚡ Recall
- `IN` = input only | `OUT` = output only | `INOUT` = both
- `DECLARE` variables inside BEGIN...END
- `SET @var` = session variable (outside proc)
- `DELIMITER //` = needed so `;` inside proc doesn't end it prematurely

---

## 22. Functions (User-Defined)

### Concept
Unlike procedures, **user-defined functions (UDFs)** return a single value and can be used inside SQL expressions just like built-in functions.

### Code
```sql
DELIMITER //

-- Simple function
CREATE FUNCTION GetFullName(
    first VARCHAR(50),
    last  VARCHAR(50)
)
RETURNS VARCHAR(101)
DETERMINISTIC
BEGIN
    RETURN CONCAT(first, ' ', last);
END //

-- Function with logic
CREATE FUNCTION GetSalaryGrade(salary DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE grade VARCHAR(20);
    
    IF salary < 40000 THEN
        SET grade = 'Entry';
    ELSEIF salary < 70000 THEN
        SET grade = 'Mid';
    ELSEIF salary < 100000 THEN
        SET grade = 'Senior';
    ELSE
        SET grade = 'Executive';
    END IF;
    
    RETURN grade;
END //

DELIMITER ;

-- Use functions in queries
SELECT 
    GetFullName(first_name, last_name) AS full_name,
    salary,
    GetSalaryGrade(salary)             AS grade
FROM employees;

-- Drop function
DROP FUNCTION IF EXISTS GetSalaryGrade;
```

### ⚡ Recall
- Function → `RETURNS` a single value
- Use inside `SELECT`, `WHERE`, `ORDER BY` etc.
- `DETERMINISTIC` = same input always gives same output
- Procedure → no return value, called with `CALL`

---

## 23. Triggers

### Concept
A **trigger** is SQL code that automatically runs **before or after** an INSERT, UPDATE, or DELETE on a table.

Use cases: audit logging, enforcing complex constraints, auto-updating related tables.

### Code
```sql
-- Audit log table
CREATE TABLE salary_audit (
    audit_id    INT AUTO_INCREMENT PRIMARY KEY,
    emp_id      INT,
    old_salary  DECIMAL(10,2),
    new_salary  DECIMAL(10,2),
    changed_by  VARCHAR(50),
    changed_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

-- BEFORE UPDATE trigger
CREATE TRIGGER before_salary_update
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END //

-- AFTER UPDATE trigger (audit log)
CREATE TRIGGER after_salary_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary != NEW.salary THEN
        INSERT INTO salary_audit (emp_id, old_salary, new_salary, changed_by)
        VALUES (NEW.emp_id, OLD.salary, NEW.salary, USER());
    END IF;
END //

-- AFTER INSERT trigger (maintain a count table)
CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    UPDATE dept_headcount
    SET count = count + 1
    WHERE dept_id = NEW.dept_id;
END //

-- BEFORE DELETE trigger (archive before delete)
CREATE TRIGGER before_employee_delete
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employees_archive
    SELECT *, NOW(), USER()
    FROM employees
    WHERE emp_id = OLD.emp_id;
END //

DELIMITER ;

-- Show triggers
SHOW TRIGGERS FROM sales_db;

-- Drop trigger
DROP TRIGGER IF EXISTS after_salary_update;
```

### ⚡ Recall
- `OLD` = values **before** the change
- `NEW` = values **after** the change
- `BEFORE` triggers can **modify** NEW values or **prevent** the operation
- `AFTER` triggers **cannot** modify the row — only side effects
- Use `SIGNAL SQLSTATE '45000'` to raise an error

---

## 24. Transactions & ACID

### Concept
A **transaction** is a group of SQL statements that are treated as one unit — either ALL succeed or ALL fail.

**ACID Properties:**
- **A**tomicity — all or nothing
- **C**onsistency — data remains valid
- **I**solation — concurrent transactions don't interfere
- **D**urability — committed data persists even after crash

### Code
```sql
-- Basic transaction
START TRANSACTION;

UPDATE accounts SET balance = balance - 1000 WHERE account_id = 1;  -- debit
UPDATE accounts SET balance = balance + 1000 WHERE account_id = 2;  -- credit

-- Check if everything looks right, then commit
COMMIT;

-- If something went wrong, undo everything
ROLLBACK;

-- Transaction with error handling
START TRANSACTION;

UPDATE accounts SET balance = balance - 500 WHERE account_id = 1;

-- Check the balance didn't go negative
SELECT balance INTO @new_balance FROM accounts WHERE account_id = 1;

IF @new_balance < 0 THEN
    ROLLBACK;
    SELECT 'Transaction failed: insufficient funds' AS message;
ELSE
    UPDATE accounts SET balance = balance + 500 WHERE account_id = 2;
    COMMIT;
    SELECT 'Transfer successful' AS message;
END IF;

-- SAVEPOINT — partial rollback
START TRANSACTION;

INSERT INTO orders (customer_id, total) VALUES (1, 500);
SAVEPOINT after_order;

INSERT INTO order_items (order_id, product_id, qty) VALUES (LAST_INSERT_ID(), 5, 2);
-- Something went wrong with items:
ROLLBACK TO after_order;  -- undo items insert, keep order insert

COMMIT;  -- commit just the order

-- Check auto-commit status
SHOW VARIABLES LIKE 'autocommit';
SET autocommit = 0;  -- disable auto-commit for session
```

### Isolation Levels
```sql
-- Set isolation level
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Levels (from lowest to highest isolation):
-- READ UNCOMMITTED — can read dirty/uncommitted data
-- READ COMMITTED   — only reads committed data (default in many DBs)
-- REPEATABLE READ  — same query returns same data within transaction (MySQL default)
-- SERIALIZABLE     — fully isolated, highest consistency, slowest
```

### ⚡ Recall
```
ACID = Atomicity, Consistency, Isolation, Durability
START TRANSACTION → do stuff → COMMIT (save) or ROLLBACK (undo)
SAVEPOINT = checkpoint within a transaction
MySQL default = REPEATABLE READ isolation
```

---

## 25. Constraints

### Concept
**Constraints** enforce rules on data. Applied at column or table level.

| Constraint | Description |
|------------|-------------|
| `PRIMARY KEY` | Unique + NOT NULL identifier |
| `FOREIGN KEY` | Enforces referential integrity |
| `UNIQUE` | No duplicate values |
| `NOT NULL` | Value required |
| `CHECK` | Custom condition |
| `DEFAULT` | Default value |

### Code
```sql
CREATE TABLE orders (
    order_id    INT           AUTO_INCREMENT,
    customer_id INT           NOT NULL,
    total       DECIMAL(10,2) NOT NULL CHECK (total >= 0),
    status      ENUM('pending','paid','cancelled') DEFAULT 'pending',
    order_date  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (order_id),
    UNIQUE KEY uk_receipt (customer_id, order_date),
    FOREIGN KEY (customer_id) 
        REFERENCES customers(customer_id)
        ON DELETE RESTRICT       -- prevent delete if orders exist
        ON UPDATE CASCADE        -- if customer_id changes, update here too
);

-- ON DELETE options:
-- RESTRICT    — block delete if child rows exist (default)
-- CASCADE     — auto-delete child rows
-- SET NULL    — set FK to NULL in child rows
-- NO ACTION   — like RESTRICT but deferred

-- ADD constraint to existing table
ALTER TABLE orders 
ADD CONSTRAINT chk_total CHECK (total >= 0);

ALTER TABLE orders
ADD CONSTRAINT fk_customer 
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

-- Drop constraint
ALTER TABLE orders DROP FOREIGN KEY fk_customer;
ALTER TABLE orders DROP CHECK chk_total;
```

---

## 26. Normalization

### Concept
**Normalization** eliminates data redundancy and ensures data integrity through a series of **Normal Forms (NF)**.

### 1NF — First Normal Form
- Each column has **atomic** (indivisible) values
- No repeating groups

```sql
-- ❌ NOT 1NF — multiple phones in one cell
-- employee_id | name  | phones
-- 1           | Alice | 555-1234, 555-5678

-- ✅ 1NF — separate table
CREATE TABLE employee_phones (
    emp_id  INT,
    phone   VARCHAR(20),
    PRIMARY KEY (emp_id, phone)
);
```

### 2NF — Second Normal Form
- Must be 1NF
- No **partial dependencies** (every non-key column depends on the WHOLE primary key, not part of it)

```sql
-- ❌ NOT 2NF — product_name depends only on product_id, not on order_id
-- order_id | product_id | product_name | quantity

-- ✅ 2NF — separate product info
CREATE TABLE products (product_id INT PK, product_name VARCHAR(100));
CREATE TABLE order_items (order_id INT, product_id INT, quantity INT, PRIMARY KEY(order_id, product_id));
```

### 3NF — Third Normal Form
- Must be 2NF
- No **transitive dependencies** (non-key column depending on another non-key column)

```sql
-- ❌ NOT 3NF — dept_location depends on dept_id, not emp_id
-- emp_id | dept_id | dept_location

-- ✅ 3NF — move dept info to departments table
CREATE TABLE departments (dept_id INT PK, dept_name VARCHAR(50), location VARCHAR(100));
CREATE TABLE employees (emp_id INT PK, dept_id INT FK→departments);
```

### ⚡ Recall
```
1NF = Atomic values (no lists in cells)
2NF = No partial key dependencies (whole PK matters)
3NF = No transitive dependencies (A→B→C: remove B→C)

"Every non-key attribute must depend on: the key (1NF), 
the whole key (2NF), and nothing but the key (3NF). So help me Codd."
```

---

## 27. Joins vs Subqueries vs CTEs — When to Use

### Decision Guide
```
Simple lookup or filter?
├── Single value → Scalar subquery or JOIN
├── List of values → IN (subquery) or JOIN
└── Complex filter → EXISTS or JOIN

Multiple aggregations or reuse same result?
└── CTE

Hierarchy / recursion?
└── Recursive CTE

Complex multi-step transformations?
└── Multiple CTEs > nested subqueries

Performance critical?
└── JOIN usually > correlated subquery
   EXPLAIN both and check execution plan
```

### Code — Same result, three ways
```sql
-- QUESTION: Find employees whose salary > their department average

-- 1. Using JOIN
SELECT e.first_name, e.salary
FROM employees e
JOIN (
    SELECT dept_id, AVG(salary) AS avg_sal
    FROM employees GROUP BY dept_id
) dept_avg ON e.dept_id = dept_avg.dept_id
WHERE e.salary > dept_avg.avg_sal;

-- 2. Using Correlated Subquery
SELECT first_name, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary) FROM employees WHERE dept_id = e.dept_id
);

-- 3. Using CTE + Window Function (cleanest)
WITH dept_avgs AS (
    SELECT emp_id, first_name, salary,
           AVG(salary) OVER (PARTITION BY dept_id) AS dept_avg
    FROM employees
)
SELECT first_name, salary
FROM dept_avgs
WHERE salary > dept_avg;
```

---

## 28. Performance & Query Optimization

### Concept
Slow queries kill applications. Use EXPLAIN to understand what MySQL is doing.

### Code

#### EXPLAIN
```sql
-- Basic EXPLAIN
EXPLAIN SELECT * FROM employees WHERE last_name = 'Smith';

-- EXPLAIN ANALYZE (MySQL 8.0+ — runs the query and shows actual times)
EXPLAIN ANALYZE SELECT * FROM employees WHERE dept_id = 2;

-- Key columns in EXPLAIN output:
-- type:  ALL=bad, index, range, ref, eq_ref, const=best
-- key:   which index was used (NULL = no index)
-- rows:  estimated rows examined (lower = better)
-- Extra: "Using filesort" / "Using temporary" = potential issues
```

#### Optimization Patterns
```sql
-- ❌ SLOW: Function on indexed column prevents index use
SELECT * FROM orders WHERE YEAR(order_date) = 2024;

-- ✅ FAST: Range condition uses index
SELECT * FROM orders WHERE order_date >= '2024-01-01' AND order_date < '2025-01-01';

-- ❌ SLOW: Leading wildcard can't use index
SELECT * FROM employees WHERE last_name LIKE '%son';

-- ✅ FAST: Trailing wildcard CAN use index
SELECT * FROM employees WHERE last_name LIKE 'John%';

-- ❌ SLOW: OR on different columns — may not use indexes
SELECT * FROM employees WHERE first_name = 'John' OR last_name = 'Smith';

-- ✅ FAST: UNION uses indexes on each part
SELECT * FROM employees WHERE first_name = 'John'
UNION
SELECT * FROM employees WHERE last_name = 'Smith';

-- ❌ SLOW: SELECT * (fetches unnecessary columns, prevents covering indexes)
SELECT * FROM employees WHERE dept_id = 2;

-- ✅ FAST: Select only needed columns
SELECT emp_id, first_name, salary FROM employees WHERE dept_id = 2;

-- ❌ SLOW: Subquery in WHERE re-runs for every row
SELECT * FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees WHERE dept_id = e.dept_id);

-- ✅ FAST: Pre-aggregate in CTE or derived table
WITH dept_avg AS (SELECT dept_id, AVG(salary) avg FROM employees GROUP BY dept_id)
SELECT e.* FROM employees e JOIN dept_avg d ON e.dept_id = d.dept_id WHERE e.salary > d.avg;

-- Check slow query log
SHOW VARIABLES LIKE 'slow_query_log';
SET GLOBAL slow_query_log = 'ON';
SET GLOBAL long_query_time = 1;  -- log queries > 1 second
```

### ⚡ Recall — Optimization Checklist
```
✅ Use indexes on WHERE, JOIN, ORDER BY columns
✅ Avoid functions on indexed columns in WHERE
✅ SELECT only columns you need (avoid SELECT *)
✅ Use LIMIT when you only need a few rows
✅ Prefer JOINs over correlated subqueries
✅ Use EXPLAIN to check execution plans
✅ Composite index column order = leftmost prefix rule
✅ Avoid leading wildcards in LIKE
```

---

## 29. User Management & Security

### Code
```sql
-- Create user
CREATE USER 'analyst'@'localhost' IDENTIFIED BY 'SecurePass123!';
CREATE USER 'app_user'@'%' IDENTIFIED BY 'AppPass456!';  -- % = any host

-- Grant privileges
GRANT SELECT ON sales_db.* TO 'analyst'@'localhost';           -- read only
GRANT SELECT, INSERT, UPDATE ON sales_db.orders TO 'app_user'@'%';
GRANT ALL PRIVILEGES ON sales_db.* TO 'admin'@'localhost';
GRANT EXECUTE ON PROCEDURE sales_db.GetEmployeesByDept TO 'analyst'@'localhost';

-- Apply privileges
FLUSH PRIVILEGES;

-- View user privileges
SHOW GRANTS FOR 'analyst'@'localhost';

-- Revoke privileges
REVOKE INSERT, UPDATE ON sales_db.orders FROM 'app_user'@'%';

-- Change password
ALTER USER 'analyst'@'localhost' IDENTIFIED BY 'NewPassword789!';

-- Drop user
DROP USER IF EXISTS 'analyst'@'localhost';

-- Show all users
SELECT user, host FROM mysql.user;

-- Create a read-only reporting user (best practice)
CREATE USER 'reporter'@'localhost' IDENTIFIED BY 'Report123!';
GRANT SELECT ON sales_db.* TO 'reporter'@'localhost';
FLUSH PRIVILEGES;
```

---

## 30. Data Analysis Patterns

### Code — Common Analysis Queries

#### Year-over-Year Growth
```sql
SELECT 
    YEAR(order_date)   AS year,
    SUM(total)         AS revenue,
    LAG(SUM(total)) OVER (ORDER BY YEAR(order_date)) AS prev_year_revenue,
    ROUND(
        (SUM(total) - LAG(SUM(total)) OVER (ORDER BY YEAR(order_date)))
        / LAG(SUM(total)) OVER (ORDER BY YEAR(order_date)) * 100
    , 2) AS yoy_growth_pct
FROM orders
GROUP BY YEAR(order_date);
```

#### Cohort Analysis
```sql
WITH cohorts AS (
    SELECT 
        customer_id,
        DATE_FORMAT(MIN(order_date), '%Y-%m') AS cohort_month
    FROM orders
    GROUP BY customer_id
),
order_months AS (
    SELECT 
        o.customer_id,
        c.cohort_month,
        DATE_FORMAT(o.order_date, '%Y-%m') AS order_month
    FROM orders o
    JOIN cohorts c ON o.customer_id = c.customer_id
)
SELECT 
    cohort_month,
    order_month,
    COUNT(DISTINCT customer_id) AS customers
FROM order_months
GROUP BY cohort_month, order_month
ORDER BY cohort_month, order_month;
```

#### Funnel Analysis
```sql
SELECT
    COUNT(DISTINCT CASE WHEN event = 'visit'    THEN user_id END) AS visitors,
    COUNT(DISTINCT CASE WHEN event = 'signup'   THEN user_id END) AS signups,
    COUNT(DISTINCT CASE WHEN event = 'purchase' THEN user_id END) AS purchasers,
    ROUND(
        COUNT(DISTINCT CASE WHEN event = 'signup' THEN user_id END)
        / COUNT(DISTINCT CASE WHEN event = 'visit' THEN user_id END) * 100
    , 2) AS visit_to_signup_pct,
    ROUND(
        COUNT(DISTINCT CASE WHEN event = 'purchase' THEN user_id END)
        / COUNT(DISTINCT CASE WHEN event = 'signup' THEN user_id END) * 100
    , 2) AS signup_to_purchase_pct
FROM events
WHERE event_date >= '2024-01-01';
```

#### Rolling 7-Day Average
```sql
SELECT 
    order_date,
    daily_revenue,
    AVG(daily_revenue) OVER (
        ORDER BY order_date 
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS rolling_7day_avg
FROM (
    SELECT DATE(order_date) AS order_date, SUM(total) AS daily_revenue
    FROM orders
    GROUP BY DATE(order_date)
) daily;
```

#### Percentile / Median
```sql
-- Median salary
SELECT AVG(salary) AS median_salary
FROM (
    SELECT salary,
           ROW_NUMBER() OVER (ORDER BY salary)                         AS rn,
           COUNT(*) OVER ()                                            AS total
    FROM employees
) t
WHERE rn IN (FLOOR((total+1)/2), CEIL((total+1)/2));

-- Percentile using NTILE
SELECT 
    NTILE(100) OVER (ORDER BY salary) AS percentile,
    salary
FROM employees;

-- 90th percentile salary
SELECT MIN(salary) AS p90_salary
FROM (
    SELECT salary, NTILE(100) OVER (ORDER BY salary) AS pct FROM employees
) t
WHERE pct >= 90;
```

#### Customer RFM Scoring (Recency, Frequency, Monetary)
```sql
WITH rfm_base AS (
    SELECT 
        customer_id,
        DATEDIFF(CURDATE(), MAX(order_date))  AS recency_days,
        COUNT(*)                              AS frequency,
        SUM(total)                            AS monetary
    FROM orders
    GROUP BY customer_id
),
rfm_scores AS (
    SELECT *,
        NTILE(5) OVER (ORDER BY recency_days  ASC)  AS r_score,  -- lower days = better
        NTILE(5) OVER (ORDER BY frequency     DESC) AS f_score,
        NTILE(5) OVER (ORDER BY monetary      DESC) AS m_score
    FROM rfm_base
)
SELECT 
    customer_id,
    recency_days, frequency, monetary,
    r_score, f_score, m_score,
    CONCAT(r_score, f_score, m_score) AS rfm_segment
FROM rfm_scores
ORDER BY rfm_segment;
```

#### Pivot Table (using conditional aggregation)
```sql
-- Revenue by product category per quarter
SELECT 
    YEAR(order_date) AS year,
    SUM(CASE WHEN category = 'Electronics' THEN total ELSE 0 END) AS Electronics,
    SUM(CASE WHEN category = 'Clothing'    THEN total ELSE 0 END) AS Clothing,
    SUM(CASE WHEN category = 'Food'        THEN total ELSE 0 END) AS Food,
    SUM(total)                                                      AS Grand_Total
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY YEAR(order_date)
ORDER BY year;
```

---

## 31. Quick Reference Cheatsheet

### DDL
```sql
CREATE DATABASE db;         USE db;              DROP DATABASE db;
CREATE TABLE t (col TYPE);  ALTER TABLE t ...;   DROP TABLE t;
TRUNCATE TABLE t;           RENAME TABLE a TO b;
```

### DML
```sql
INSERT INTO t (cols) VALUES (vals);
UPDATE t SET col=val WHERE ...;
DELETE FROM t WHERE ...;
INSERT ... ON DUPLICATE KEY UPDATE col=val;
```

### Querying
```sql
SELECT [DISTINCT] cols FROM t
[JOIN t2 ON ...]
[WHERE condition]
[GROUP BY col]
[HAVING condition]
[ORDER BY col [ASC|DESC]]
[LIMIT n [OFFSET m]];
```

### Filtering
```sql
col BETWEEN a AND b          -- inclusive
col IN (1,2,3)               -- list membership
col LIKE 'A%'                -- pattern (% = wildcard, _ = 1 char)
col IS NULL                  -- null check
col IS NOT NULL
EXISTS (subquery)
NOT EXISTS (subquery)
```

### Aggregates
```sql
COUNT(*)  COUNT(col)  COUNT(DISTINCT col)
SUM(col)  AVG(col)  MIN(col)  MAX(col)
GROUP_CONCAT(col ORDER BY col SEPARATOR ',')
```

### Window Functions
```sql
ROW_NUMBER() OVER (PARTITION BY a ORDER BY b)
RANK()        DENSE_RANK()   NTILE(n)
LAG(col, n)   LEAD(col, n)
SUM(col) OVER (ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
```

### String
```sql
CONCAT(a,b)  CONCAT_WS(',',a,b,c)  LENGTH(s)  CHAR_LENGTH(s)
UPPER(s)  LOWER(s)  TRIM(s)  LTRIM(s)  RTRIM(s)
SUBSTRING(s,start,len)  LEFT(s,n)  RIGHT(s,n)
REPLACE(s,old,new)  INSTR(s,substr)
LPAD(s,len,pad)  RPAD(s,len,pad)
```

### Date
```sql
NOW()  CURDATE()  CURTIME()
YEAR()  MONTH()  DAY()  HOUR()  MINUTE()
DATE_ADD(d, INTERVAL n UNIT)  DATE_SUB(d, INTERVAL n UNIT)
DATEDIFF(d1,d2)  TIMESTAMPDIFF(UNIT,d1,d2)
DATE_FORMAT(d,'%Y-%m-%d')  STR_TO_DATE(s,fmt)
```

### NULL Handling
```sql
IS NULL  IS NOT NULL
COALESCE(a,b,c)   -- first non-null
IFNULL(a,b)       -- if null return b
NULLIF(a,b)       -- if a=b return null
```

### Joins Quick Reference
```sql
INNER JOIN  -- matching rows only
LEFT JOIN   -- all left + matches
RIGHT JOIN  -- all right + matches
CROSS JOIN  -- cartesian product
-- self join: join table to itself with aliases
```

### Transactions
```sql
START TRANSACTION;  COMMIT;  ROLLBACK;
SAVEPOINT name;  ROLLBACK TO name;
```

### Admin
```sql
SHOW DATABASES;  SHOW TABLES;  DESCRIBE t;  SHOW COLUMNS FROM t;
SHOW INDEX FROM t;  SHOW PROCESSLIST;
EXPLAIN SELECT ...;  EXPLAIN ANALYZE SELECT ...;
CREATE USER 'u'@'h' IDENTIFIED BY 'p';
GRANT SELECT ON db.* TO 'u'@'h';
FLUSH PRIVILEGES;
```

---

## 🧠 Master Memory Aids

### The SQL Query Execution Order
```
  Write order:  SELECT → FROM → JOIN → WHERE → GROUP BY → HAVING → ORDER BY → LIMIT
Execute order:  FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
```
> **Why it matters:** You can't use a SELECT alias in WHERE because WHERE runs before SELECT!

### JOIN Decision Tree
```
Need all rows from one side?
├── Yes, left table → LEFT JOIN
├── Yes, right table → RIGHT JOIN
└── No, only matches → INNER JOIN

Comparing table to itself? → SELF JOIN
No condition, all combinations? → CROSS JOIN
Need all from both? → LEFT + UNION + RIGHT
```

### When to Use What
| Scenario | Best Tool |
|----------|-----------|
| Simple data lookup | SELECT + WHERE |
| Combine related tables | JOIN |
| Aggregate by group | GROUP BY + aggregate |
| Per-row ranking/running total | Window Function |
| Reusable result in same query | CTE |
| Repeated logic across queries | View or Stored Procedure |
| Conditional value | CASE |
| Auto-run on data change | Trigger |
| Fast lookups on large tables | Index |

---

*📌 Bookmark this file. These are the patterns that appear in 90% of real-world MySQL work.*

*⭐ Star this repo if it helped you!*