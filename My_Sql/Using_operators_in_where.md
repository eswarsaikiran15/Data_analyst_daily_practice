

---

````markdown
# 📘 SQL WHERE Clause – Complete Practice Guide

This repository covers all essential SQL `WHERE` clause operators with examples for practice and revision.

---

## 📌 Table Structure Used

```sql
CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student (rollno, name, marks, grade, city)
VALUES
(101, 'anil', 78, 'C', 'Pune'),
(102, 'bhumika', 93, 'A', 'Mumbai'),
(103, 'chetan', 85, 'B', 'Mumbai'),
(104, 'dhruv', 96, 'A', 'Delhi'),
(105, 'emanuel', 12, 'F', 'Delhi'),
(106, 'farah', 82, 'B', 'Delhi');
````

---

# 🔹 1. Comparison Operators

Used to compare values.

| Operator | Meaning          |
| -------- | ---------------- |
| =        | Equal to         |
| >        | Greater than     |
| <        | Less than        |
| >=       | Greater or equal |
| <=       | Less or equal    |
| !=       | Not equal to     |

### Examples

```sql
-- Marks greater than 80
SELECT * FROM student WHERE marks > 80;

-- Students from Mumbai
SELECT * FROM student WHERE city = 'Mumbai';

-- Students not having grade A
SELECT * FROM student WHERE grade != 'A';
```

---

# 🔹 2. Logical Operators

Used to combine conditions.

| Operator | Meaning                     |
| -------- | --------------------------- |
| AND      | All conditions must be true |
| OR       | At least one condition true |
| NOT      | Reverse condition           |

### Examples

```sql
-- Marks > 80 AND city is Delhi
SELECT * FROM student
WHERE marks > 80 AND city = 'Delhi';

-- Marks < 50 OR grade F
SELECT * FROM student
WHERE marks < 50 OR grade = 'F';

-- Not from Delhi
SELECT * FROM student
WHERE NOT city = 'Delhi';
```

### ⚠️ Precedence Rule

`AND` is evaluated before `OR`.

```sql
-- Correct usage with brackets
SELECT * FROM student
WHERE (marks > 80 AND city = 'Delhi') OR grade = 'C';
```

---

# 🔹 3. BETWEEN (Range)

Used for range filtering (inclusive).

```sql
SELECT * FROM student
WHERE marks BETWEEN 80 AND 95;
```

Equivalent:

```sql
WHERE marks >= 80 AND marks <= 95;
```

---

# 🔹 4. IN (Multiple Values)

Cleaner alternative to multiple OR conditions.

```sql
SELECT * FROM student
WHERE city IN ('Mumbai', 'Delhi');
```

Equivalent:

```sql
WHERE city = 'Mumbai' OR city = 'Delhi';
```

---

# 🔹 5. LIKE (Pattern Matching)

Used for searching patterns.

| Symbol | Meaning                  |
| ------ | ------------------------ |
| %      | Any number of characters |
| _      | Single character         |

### Examples

```sql
-- Names starting with 'a'
SELECT * FROM student
WHERE name LIKE 'a%';

-- Names ending with 'h'
SELECT * FROM student
WHERE name LIKE '%h';

-- Names with exactly 5 letters
SELECT * FROM student
WHERE name LIKE '_____';
```

---

# 🔹 6. NULL Handling

Used to check missing values.

```sql
-- NULL values
SELECT * FROM student
WHERE grade IS NULL;

-- NOT NULL values
SELECT * FROM student
WHERE grade IS NOT NULL;
```

---

# ⚡ Key Differences (Important)

| Feature | Use                           |
| ------- | ----------------------------- |
| =       | Exact match                   |
| LIKE    | Pattern search                |
| IN      | Multiple values (same column) |
| OR      | Different conditions          |
| BETWEEN | Range (inclusive)             |

---

# ⚠️ Common Mistakes

* Using `=` instead of `LIKE` for patterns
* Forgetting `BETWEEN` is inclusive
* Misusing `OR` instead of `IN`
* Ignoring operator precedence (`AND` vs `OR`)


