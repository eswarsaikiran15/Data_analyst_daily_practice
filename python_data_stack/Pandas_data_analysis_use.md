

# Pandas for Data Analysis

## Overview

**Pandas** is a Python library used for **data manipulation and analysis**.
It provides powerful tools to work with structured data (tables, CSV files, Excel, etc.).

---

## Why Pandas is Used

* Handle large datasets easily
* Clean and preprocess data
* Perform analysis and generate insights
* Works seamlessly with NumPy, Matplotlib, and ML libraries

---

## Core Data Structures

### 1. Series (1D data)

```python
import pandas as pd

s = pd.Series([10, 20, 30])
```

---

### 2. DataFrame (2D table)

```python
data = {
    "Name": ["A", "B", "C"],
    "Sales": [100, 200, 150]
}

df = pd.DataFrame(data)
```

---

## Real Uses in Data Analysis

### 1. Loading Data

```python
df = pd.read_csv("data.csv")
df = pd.read_excel("data.xlsx")
```

**Use:**

* Import datasets from files

---

### 2. Viewing Data

```python
df.head()
df.tail()
df.info()
df.describe()
```

**Use:**

* Quick understanding of dataset

---

### 3. Selecting Data

```python
df["Sales"]          # single column
df[["Name","Sales"]] # multiple columns
df.iloc[0]           # first row
df.loc[0:2]          # rows by label
```

**Use:**

* Access specific data

---

### 4. Filtering Data

```python
df[df["Sales"] > 150]
```

**Use:**

* High-value customers
* Conditional analysis

---

### 5. Data Cleaning

```python
df.dropna()
df.fillna(0)
df.rename(columns={"Sales":"Revenue"})
```

**Use:**

* Handle missing values
* Fix column names

---

### 6. Aggregations

```python
df["Sales"].mean()
df["Sales"].sum()
df.groupby("Name")["Sales"].sum()
```

**Use:**

* KPIs
* Group-based analysis

---

### 7. Sorting Data

```python
df.sort_values(by="Sales", ascending=False)
```

**Use:**

* Rank performance

---

### 8. Adding New Columns

```python
df["Profit"] = df["Sales"] * 0.2
```

**Use:**

* Feature creation
* Derived metrics

---

### 9. Merging Data

```python
pd.merge(df1, df2, on="ID")
```

**Use:**

* Combine datasets

---

### 10. Exporting Data

```python
df.to_csv("output.csv", index=False)
```

**Use:**

* Save processed data

---

## Workflow in Data Analysis

```text
Load Data → Clean Data → Analyze → Visualize → Export
```

---

## Minimum Skills Required (Data Analyst)

* Reading datasets (CSV/Excel)
* Filtering and selecting data
* Handling missing values
* GroupBy operations
* Basic aggregations
* Sorting and merging

---

## Common Mistakes

* Ignoring missing values
* Not understanding data types
* Using loops instead of vectorized operations
* Skipping NumPy basics

---

## Bottom Line

Pandas is used to:

> **clean, transform, analyze, and extract insights from structured data**
