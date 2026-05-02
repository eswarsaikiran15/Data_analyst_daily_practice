
# SQL Master Guide: Aggregates → GROUP BY → HAVING → ORDER BY → LIMIT

This is a **concept-first + code-heavy guide** to understand SQL querying deeply.

If you only memorize syntax, you will fail in real queries.

---

# 🧠 1. How SQL Actually Works (Mental Model)

Think of SQL like a **data pipeline**:

Raw Table → Filter → Group → Aggregate → Filter Groups → Sort → Limit

### Execution Order (CRITICAL)

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY
7. LIMIT

👉 Most bugs come from not understanding this order.

---

# 📊 2. Aggregate Functions (Core Idea)

👉 Aggregate = "many rows → one value"

### Why needed?
Because raw data is useless without summarization.

---

## 🔑 Types

### COUNT()

```sql
SELECT COUNT(*) FROM employees;
````

* Counts all rows
* Includes NULL rows

```sql
SELECT COUNT(salary) FROM employees;
```

* Ignores NULL

---

### SUM()

```sql
SELECT SUM(salary) FROM employees;
```

👉 Adds numeric values

---

### AVG()

```sql
SELECT AVG(salary) FROM employees;
```

👉 Mean value (ignores NULL)

---

### MIN() / MAX()

```sql
SELECT MIN(salary), MAX(salary) FROM employees;
```

👉 Range of data

---

## ⚠️ Important Behavior

* Aggregates ignore NULL (except COUNT(*))
* They collapse rows → 1 output

---

# 📊 3. GROUP BY (Most Important Concept)

👉 Without GROUP BY → 1 result
👉 With GROUP BY → multiple results (per group)

---

## 🧠 Mental Model

GROUP BY = "Split data into buckets"

---

## Example

### Table

| name | dept | salary |
| ---- | ---- | ------ |
| A    | IT   | 50000  |
| B    | IT   | 60000  |
| C    | HR   | 40000  |

---

### Query

```sql
SELECT dept, AVG(salary)
FROM employees
GROUP BY dept;
```

👉 What happens internally:

1. Split into groups:

   * IT → [50000, 60000]
   * HR → [40000]

2. Apply AVG to each group

---

## ⚠️ Rule (VERY IMPORTANT)

```sql
SELECT dept, COUNT(*)
FROM employees;
```

❌ ERROR

👉 Because:

* dept is not grouped
* COUNT is aggregated

✔ Fix:

```sql
SELECT dept, COUNT(*)
FROM employees
GROUP BY dept;
```

---

# 🎯 4. HAVING (Filter Groups)

👉 WHERE filters rows
👉 HAVING filters groups

---

## Example

```sql
SELECT dept, COUNT(*)
FROM employees
GROUP BY dept
HAVING COUNT(*) > 2;
```

👉 Process:

* GROUP first
* Then filter groups

---

## ⚠️ Key Difference

```sql
-- WRONG
WHERE COUNT(*) > 2
```

👉 WHERE cannot use aggregates

---

# 🔽 5. ORDER BY (Sorting)

👉 Used AFTER everything is computed

---

## Examples

```sql
SELECT name, salary
FROM employees
ORDER BY salary ASC;
```

```sql
SELECT name, salary
FROM employees
ORDER BY salary DESC;
```

---

## Multi-column sorting

```sql
SELECT dept, salary
FROM employees
ORDER BY dept ASC, salary DESC;
```

👉 First sorts by dept, then salary within dept

---

# 🔢 6. LIMIT (Restrict Output)

👉 Controls how many rows you get

---

## Example

```sql
SELECT * FROM employees
LIMIT 5;
```

---

## With OFFSET

```sql
SELECT * FROM employees
LIMIT 5 OFFSET 5;
```

👉 Skip first 5 rows, show next 5

---

# 🔗 7. Putting Everything Together

This is where real SQL begins.

```sql
SELECT dept,
       COUNT(*) AS total,
       AVG(salary) AS avg_salary
FROM employees
WHERE salary > 30000
GROUP BY dept
HAVING COUNT(*) > 2
ORDER BY avg_salary DESC
LIMIT 3;
```

---

## 🧠 Step-by-step Execution

1. FROM → employees table
2. WHERE → remove salary <= 30000
3. GROUP BY → group by dept
4. HAVING → keep groups with >2 people
5. SELECT → compute aggregates
6. ORDER BY → sort results
7. LIMIT → take top 3

---

# ⚠️ 8. Common Mistakes (Reality Check)

## ❌ 1. Thinking SELECT runs first

👉 It doesn’t

---

## ❌ 2. Mixing grouped & non-grouped columns

```sql
SELECT dept, name, COUNT(*)
FROM employees
GROUP BY dept;
```

❌ INVALID

---

## ❌ 3. Using LIMIT without ORDER BY

```sql
SELECT * FROM employees LIMIT 5;
```

👉 Random rows, not meaningful

---

## ❌ 4. Confusing WHERE vs HAVING

| Wrong thinking          | Reality |
| ----------------------- | ------- |
| WHERE works after GROUP | ❌       |
| HAVING filters rows     | ❌       |

---
