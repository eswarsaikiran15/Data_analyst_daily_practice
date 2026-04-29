# 🐼 Pandas MASTER NOTES — Data Analysis & Basic ML
> **Complete Reference: Concept + Code + Recall**  
> Covers everything from installation to ML-ready pipelines.

---

## 📚 Table of Contents

1. [Installation & Imports](#1-installation--imports)
2. [Core Data Structures](#2-core-data-structures)
3. [Creating DataFrames](#3-creating-dataframes)
4. [Reading & Writing Data](#4-reading--writing-data)
5. [Exploring Data (EDA)](#5-exploring-data-eda)
6. [Selecting & Filtering Data](#6-selecting--filtering-data)
7. [Modifying Data](#7-modifying-data)
8. [Handling Missing Values](#8-handling-missing-values)
9. [Sorting & Ranking](#9-sorting--ranking)
10. [GroupBy & Aggregation](#10-groupby--aggregation)
11. [Merging, Joining & Concatenating](#11-merging-joining--concatenating)
12. [String Operations](#12-string-operations)
13. [DateTime Operations](#13-datetime-operations)
14. [Apply, Map & Lambda](#14-apply-map--lambda)
15. [Pivot Tables & Crosstabs](#15-pivot-tables--crosstabs)
16. [Reshaping Data (melt, stack, unstack)](#16-reshaping-data-melt-stack-unstack)
17. [Data Type Conversions](#17-data-type-conversions)
18. [Window Functions (Rolling & Expanding)](#18-window-functions-rolling--expanding)
19. [Visualization with Pandas](#19-visualization-with-pandas)
20. [Pandas for Basic ML (Preprocessing Pipeline)](#20-pandas-for-basic-ml-preprocessing-pipeline)
21. [Performance Tips](#21-performance-tips)
22. [Quick Recall Cheat Sheet](#22-quick-recall-cheat-sheet)

---

## 1. Installation & Imports

```python
# Install
pip install pandas numpy matplotlib seaborn scikit-learn

# Standard imports
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Check version
print(pd.__version__)
```

> 💡 **Recall:** Always alias pandas as `pd`. It's the universal convention.

---

## 2. Core Data Structures

### 📌 Series — 1D labeled array

```python
# Create a Series
s = pd.Series([10, 20, 30, 40], index=['a', 'b', 'c', 'd'])
print(s)
# a    10
# b    20
# c    30
# d    40

# Access by label
print(s['b'])       # 20

# Access by position
print(s.iloc[1])    # 20

# Series has index + values
print(s.index)      # Index(['a', 'b', 'c', 'd'], dtype='object')
print(s.values)     # [10 20 30 40]
print(s.dtype)      # int64
print(s.name)       # None (can be set)
```

### 📌 DataFrame — 2D labeled table

```python
# DataFrame = collection of Series (columns)
df = pd.DataFrame({
    'Name': ['Alice', 'Bob', 'Charlie'],
    'Age':  [25, 30, 35],
    'Score': [88.5, 92.0, 78.3]
})

print(df)
#       Name  Age  Score
# 0    Alice   25   88.5
# 1      Bob   30   92.0
# 2  Charlie   35   78.3
```

> 💡 **Recall:** Series = one column. DataFrame = full table. Both share the same index concept.

---

## 3. Creating DataFrames

```python
# From dictionary of lists
df = pd.DataFrame({'col1': [1, 2, 3], 'col2': ['a', 'b', 'c']})

# From list of dicts
data = [{'Name': 'Alice', 'Age': 25}, {'Name': 'Bob', 'Age': 30}]
df = pd.DataFrame(data)

# From NumPy array
arr = np.random.rand(4, 3)
df = pd.DataFrame(arr, columns=['X', 'Y', 'Z'])

# From a range with custom index
df = pd.DataFrame({'values': range(5)}, index=['a','b','c','d','e'])

# Empty DataFrame with defined columns
df_empty = pd.DataFrame(columns=['Name', 'Age', 'Score'])

# With specified dtypes
df = pd.DataFrame({'A': pd.array([1, 2, 3], dtype='int32'),
                   'B': pd.array([1.1, 2.2, 3.3], dtype='float32')})
```

> 💡 **Recall:** `pd.DataFrame(dict)` is the most common way. Keys = column names, Values = lists.

---

## 4. Reading & Writing Data

### 📥 Reading

```python
# CSV
df = pd.read_csv('data.csv')
df = pd.read_csv('data.csv', index_col=0)          # first col as index
df = pd.read_csv('data.csv', usecols=['A', 'B'])   # select specific cols
df = pd.read_csv('data.csv', nrows=100)            # only first 100 rows
df = pd.read_csv('data.csv', skiprows=2)           # skip first 2 rows
df = pd.read_csv('data.csv', sep=';')              # semicolon delimiter
df = pd.read_csv('data.csv', na_values=['NA', '-', '?'])  # custom NaN

# Excel
df = pd.read_excel('data.xlsx', sheet_name='Sheet1')

# JSON
df = pd.read_json('data.json')

# SQL (requires sqlalchemy or sqlite3)
import sqlite3
conn = sqlite3.connect('database.db')
df = pd.read_sql('SELECT * FROM table_name', conn)

# Clipboard (paste from Excel/sheets)
df = pd.read_clipboard()

# From URL
df = pd.read_csv('https://example.com/data.csv')
```

### 📤 Writing

```python
# CSV
df.to_csv('output.csv', index=False)              # index=False: don't save index

# Excel
df.to_excel('output.xlsx', sheet_name='Results', index=False)

# JSON
df.to_json('output.json', orient='records')

# SQL
df.to_sql('table_name', conn, if_exists='replace', index=False)

# Clipboard
df.to_clipboard(index=False)
```

> 💡 **Recall:** `index=False` in `to_csv` / `to_excel` prevents writing the row numbers as a column. Almost always needed.

---

## 5. Exploring Data (EDA)

```python
# Basic info
df.shape          # (rows, cols) → (150, 5)
df.dtypes         # data type of each column
df.columns        # Index of column names
df.index          # Row index info
len(df)           # number of rows

# Preview
df.head()         # first 5 rows
df.head(10)       # first 10 rows
df.tail()         # last 5 rows
df.sample(5)      # 5 random rows

# Summary stats
df.info()         # dtypes + non-null counts + memory usage
df.describe()     # count, mean, std, min, 25%, 50%, 75%, max (numeric only)
df.describe(include='all')      # includes categorical columns too
df.describe(include=['object']) # only string columns

# Value counts
df['Gender'].value_counts()          # frequency of each unique value
df['Gender'].value_counts(normalize=True)  # proportions (0 to 1)
df['Age'].nunique()                  # number of unique values
df['Age'].unique()                   # array of unique values

# Missing data overview
df.isnull().sum()           # count of nulls per column
df.isnull().sum() / len(df) # proportion of nulls per column
df.notnull().sum()

# Correlation matrix
df.corr()                   # Pearson correlation (numeric cols)
df.corr(method='spearman')  # Spearman correlation

# Memory usage
df.memory_usage(deep=True)
```

> 💡 **Recall:** EDA checklist → `shape → dtypes → head → describe → isnull → value_counts → corr`

---

## 6. Selecting & Filtering Data

### 📌 Column Selection

```python
df['Name']                    # returns Series
df[['Name', 'Age']]           # returns DataFrame (list of cols)
df.Name                       # dot notation (avoid if col has spaces)
```

### 📌 Row Selection

```python
# By label (index name)
df.loc[0]                    # row with index label 0
df.loc[0:3]                  # rows with labels 0, 1, 2, 3 (INCLUSIVE)
df.loc[[1, 3, 5]]            # specific rows by label

# By position (always integer)
df.iloc[0]                   # first row
df.iloc[0:3]                 # rows 0, 1, 2 (exclusive end)
df.iloc[[0, 2, 4]]           # rows at position 0, 2, 4
```

### 📌 Loc with Labels (Rows + Columns)

```python
df.loc[0, 'Name']                    # single cell
df.loc[0:2, ['Name', 'Age']]         # rows 0-2, specific cols
df.loc[:, 'Age']                     # all rows, one column
```

### 📌 Iloc with Positions

```python
df.iloc[0, 1]            # row 0, col 1
df.iloc[:, 1:3]          # all rows, cols 1 and 2
df.iloc[0:3, 0:2]        # rows 0-2, cols 0-1
```

### 📌 Boolean Filtering (Conditional Selection)

```python
# Single condition
df[df['Age'] > 25]
df[df['Name'] == 'Alice']
df[df['Score'].between(80, 95)]

# Multiple conditions — use & (AND), | (OR), ~ (NOT)
df[(df['Age'] > 25) & (df['Score'] > 80)]
df[(df['Age'] < 20) | (df['Age'] > 40)]
df[~(df['Name'] == 'Bob')]          # NOT Bob

# isin — filter by list of values
df[df['City'].isin(['Mumbai', 'Delhi', 'Chennai'])]

# str contains (partial match)
df[df['Name'].str.contains('Al')]

# query method — readable syntax
df.query('Age > 25 and Score > 80')
df.query('City in ["Mumbai", "Delhi"]')
df.query('Age > @threshold', threshold=25)  # use external var with @
```

> 💡 **Recall:** `loc` = label-based. `iloc` = integer position-based. For conditions, wrap each in `()` when using `&` or `|`.

---

## 7. Modifying Data

### 📌 Adding Columns

```python
df['Tax'] = df['Salary'] * 0.2             # derived column
df['Full_Name'] = df['First'] + ' ' + df['Last']  # string concat
df['Pass'] = df['Score'] >= 50             # boolean column
df.insert(2, 'New_Col', df['A'] + df['B']) # insert at position 2
```

### 📌 Renaming

```python
df.rename(columns={'Name': 'Full_Name', 'Age': 'Years'}, inplace=True)
df.columns = ['col1', 'col2', 'col3']      # rename all at once
df.rename(index={0: 'first', 1: 'second'}, inplace=True)
```

### 📌 Dropping

```python
df.drop('Age', axis=1, inplace=True)                  # drop column
df.drop(['Age', 'Score'], axis=1, inplace=True)       # drop multiple cols
df.drop([0, 1, 2], axis=0, inplace=True)              # drop rows by index
df.drop(df[df['Score'] < 50].index, inplace=True)     # drop rows by condition
```

### 📌 Updating Values

```python
df.loc[0, 'Age'] = 26                    # update single cell
df['Score'] = df['Score'] + 5            # update entire column
df.loc[df['Score'] > 90, 'Grade'] = 'A' # conditional update
df['City'].replace('Bombay', 'Mumbai', inplace=True)  # replace value
df.replace({'Y': True, 'N': False}, inplace=True)     # replace multiple
```

### 📌 Setting Index

```python
df.set_index('Name', inplace=True)       # use a column as index
df.reset_index(inplace=True)             # bring index back as column
df.reset_index(drop=True, inplace=True)  # reset index, discard old
```

> 💡 **Recall:** Always use `inplace=True` to modify in place OR reassign: `df = df.drop(...)`. Without one of these, nothing changes.

---

## 8. Handling Missing Values

```python
# Detect
df.isnull()                        # True/False DataFrame
df.isnull().sum()                  # count nulls per column
df[df['Age'].isnull()]             # rows where Age is null

# Drop
df.dropna()                        # drop any row with ANY null
df.dropna(axis=1)                  # drop any COLUMN with any null
df.dropna(subset=['Age', 'Score']) # drop rows where THESE cols are null
df.dropna(thresh=3)                # keep rows with at least 3 non-null values

# Fill
df.fillna(0)                       # replace all NaN with 0
df['Age'].fillna(df['Age'].mean(), inplace=True)   # fill with mean
df['City'].fillna('Unknown', inplace=True)         # fill with string
df.fillna(method='ffill')          # forward fill (use previous value)
df.fillna(method='bfill')          # backward fill (use next value)
df['Score'].fillna(df.groupby('Class')['Score'].transform('mean'), inplace=True)
# ↑ Fill with group mean

# Interpolate (numeric only)
df['Price'].interpolate(method='linear', inplace=True)

# Replace specific sentinel values with NaN
df.replace(-999, np.nan, inplace=True)
df.replace({'?': np.nan, 'N/A': np.nan}, inplace=True)
```

> 💡 **Recall:** Three strategies → **Drop** (if too many nulls), **Fill with stat** (mean/median for numeric, mode for categorical), **Interpolate** (for time series).

---

## 9. Sorting & Ranking

```python
# Sort by values
df.sort_values('Age')                          # ascending default
df.sort_values('Age', ascending=False)         # descending
df.sort_values(['Dept', 'Salary'], ascending=[True, False])  # multi-col sort

# Sort by index
df.sort_index()                                # ascending index
df.sort_index(ascending=False)

# Rank
df['Score_Rank'] = df['Score'].rank()                        # average method
df['Score_Rank'] = df['Score'].rank(method='min')            # min rank for ties
df['Score_Rank'] = df['Score'].rank(ascending=False)         # rank from highest

# Get top / bottom N rows
df.nlargest(5, 'Score')          # top 5 by Score
df.nsmallest(5, 'Salary')        # bottom 5 by Salary
```

---

## 10. GroupBy & Aggregation

### 📌 Basic GroupBy

```python
grouped = df.groupby('Department')

grouped['Salary'].mean()          # mean salary per dept
grouped['Salary'].sum()
grouped['Salary'].count()
grouped['Salary'].max()
grouped['Salary'].min()
grouped['Salary'].std()
grouped['Salary'].median()
```

### 📌 Multiple Aggregations — agg()

```python
df.groupby('Department').agg({
    'Salary': ['mean', 'max', 'min'],
    'Age':    ['mean', 'count']
})

# Named aggregations (pandas ≥ 0.25)
df.groupby('Department').agg(
    Avg_Salary=('Salary', 'mean'),
    Max_Salary=('Salary', 'max'),
    Employee_Count=('Name', 'count')
)
```

### 📌 GroupBy on Multiple Columns

```python
df.groupby(['Department', 'Gender'])['Salary'].mean()
df.groupby(['Department', 'Gender']).agg({'Salary': 'mean', 'Age': 'median'})
```

### 📌 transform() — Returns Same Shape

```python
# Add a column with group mean (keeps alignment with original df)
df['Dept_Avg_Salary'] = df.groupby('Department')['Salary'].transform('mean')
df['Salary_vs_Avg'] = df['Salary'] - df['Dept_Avg_Salary']
```

### 📌 filter() — Filter Groups

```python
# Keep only departments with more than 5 employees
df.groupby('Department').filter(lambda x: len(x) > 5)
```

### 📌 apply() on Groups

```python
# Apply custom function to each group
def top2(group):
    return group.nlargest(2, 'Salary')

df.groupby('Department').apply(top2)
```

> 💡 **Recall:** `groupby + agg` = aggregation (shrinks df). `groupby + transform` = keeps same size. Most powerful combo in pandas.

---

## 11. Merging, Joining & Concatenating

### 📌 concat — Stack DataFrames

```python
# Vertical stack (append rows)
df_all = pd.concat([df1, df2, df3], ignore_index=True)

# Horizontal stack (add columns)
df_wide = pd.concat([df1, df2], axis=1)
```

### 📌 merge — SQL-style Joins

```python
# Inner join (only matching keys)
df_merged = pd.merge(df_left, df_right, on='ID', how='inner')

# Left join (all left rows, matched right)
df_merged = pd.merge(df_left, df_right, on='ID', how='left')

# Right join
df_merged = pd.merge(df_left, df_right, on='ID', how='right')

# Outer join (all rows from both)
df_merged = pd.merge(df_left, df_right, on='ID', how='outer')

# Merge on different column names
df_merged = pd.merge(df_left, df_right, left_on='emp_id', right_on='employee_id')

# Merge on multiple keys
df_merged = pd.merge(df1, df2, on=['Year', 'Month'])

# Merge with suffixes for overlapping column names
df_merged = pd.merge(df1, df2, on='ID', suffixes=('_left', '_right'))
```

### 📌 join — Join on Index

```python
df1.join(df2, how='left')         # join on index
df1.join(df2, on='key_col')       # use a column from df1 to join with df2 index
```

> 💡 **Recall:** Use `concat` for stacking same-structured DataFrames. Use `merge` for SQL-like joins on key columns. Think of `merge` as `JOIN` in SQL.

---

## 12. String Operations

All string methods are under `Series.str.*`

```python
df['Name'].str.upper()                    # UPPERCASE
df['Name'].str.lower()                    # lowercase
df['Name'].str.title()                    # Title Case
df['Name'].str.strip()                    # remove leading/trailing spaces
df['Name'].str.lstrip() / str.rstrip()

df['Name'].str.len()                      # length of string
df['Name'].str.replace('old', 'new')      # replace substring
df['Email'].str.split('@')               # split returns list
df['Email'].str.split('@', expand=True)  # expand into DataFrame

df['Name'].str.contains('Ali')           # returns True/False
df['Name'].str.startswith('A')
df['Name'].str.endswith('e')
df['Name'].str.match(r'^[A-Z]')          # regex match

df['ID'].str.zfill(5)                    # zero-pad: '42' → '00042'
df['Name'].str.ljust(10) / str.rjust(10) # pad with spaces

df['Code'].str.extract(r'(\d+)')          # extract first regex group
df['Code'].str.findall(r'\d+')            # find all matches → list

df['Name'].str.get(0)                     # get first character
df['Name'].str.slice(0, 3)               # first 3 characters

df['Name'].str.cat(df['City'], sep=', ') # concatenate two string cols
```

> 💡 **Recall:** `str.contains` for filtering, `str.split(expand=True)` for splitting into columns, `str.extract` for regex.

---

## 13. DateTime Operations

```python
# Convert string to datetime
df['Date'] = pd.to_datetime(df['Date'])
df['Date'] = pd.to_datetime(df['Date'], format='%d/%m/%Y')  # custom format

# Extract components
df['Year']    = df['Date'].dt.year
df['Month']   = df['Date'].dt.month
df['Day']     = df['Date'].dt.day
df['Hour']    = df['Date'].dt.hour
df['Weekday'] = df['Date'].dt.day_name()       # 'Monday', 'Tuesday'...
df['Quarter'] = df['Date'].dt.quarter
df['Week']    = df['Date'].dt.isocalendar().week

# Timedelta (difference between dates)
df['Days_Since'] = (pd.Timestamp.now() - df['Date']).dt.days
df['Age_Years']  = (pd.Timestamp.now() - df['DOB']).dt.days // 365

# Date arithmetic
df['Due_Date'] = df['Start_Date'] + pd.Timedelta(days=30)

# Filter by date
df[df['Date'] > '2023-01-01']
df[df['Date'].between('2023-01-01', '2023-06-30')]

# Set date as index (for time series)
df.set_index('Date', inplace=True)
df['2023']                          # select entire year
df['2023-03']                       # select entire month

# Resample (time series aggregation)
df.resample('M').mean()             # monthly average
df.resample('W').sum()              # weekly sum
df.resample('Q').mean()             # quarterly average
df.resample('Y').last()             # year-end value
```

> 💡 **Recall:** Always `pd.to_datetime()` first. Then use `.dt.*` accessor for extraction.

---

## 14. Apply, Map & Lambda

### 📌 map() — Element-wise on Series

```python
# Map values using dictionary
df['Gender_Code'] = df['Gender'].map({'Male': 1, 'Female': 0})

# Map using a function
df['Name_Length'] = df['Name'].map(len)
df['Score_Sq'] = df['Score'].map(lambda x: x ** 2)
```

### 📌 apply() — Apply function to Series or DataFrame

```python
# On a Series (column)
df['Score_Rounded'] = df['Score'].apply(round)
df['Grade'] = df['Score'].apply(lambda x: 'A' if x >= 90 else ('B' if x >= 75 else 'C'))

# Custom function
def classify(score):
    if score >= 90: return 'Excellent'
    elif score >= 70: return 'Good'
    else: return 'Needs Improvement'

df['Category'] = df['Score'].apply(classify)

# On a DataFrame row (axis=1)
df['BMI'] = df.apply(lambda row: row['Weight'] / (row['Height'] ** 2), axis=1)

# On a DataFrame column (axis=0, default)
df.apply(lambda col: col.max() - col.min())   # range of each column
```

### 📌 applymap() / map() on entire DataFrame

```python
# Apply element-wise to entire DataFrame
df_numeric.applymap(lambda x: round(x, 2))   # pandas < 2.1
df_numeric.map(lambda x: round(x, 2))         # pandas ≥ 2.1
```

### 📌 np.where() — Vectorized Conditional (Faster than apply)

```python
df['Pass'] = np.where(df['Score'] >= 50, 'Pass', 'Fail')

# Nested conditions
df['Grade'] = np.where(df['Score'] >= 90, 'A',
              np.where(df['Score'] >= 75, 'B',
              np.where(df['Score'] >= 60, 'C', 'D')))
```

> 💡 **Recall:** For speed: `np.where` > vectorized ops > `apply` > `map` > for loops. Avoid row-wise `apply` on large DataFrames.

---

## 15. Pivot Tables & Crosstabs

### 📌 Pivot Table

```python
# Basic pivot table
pivot = df.pivot_table(
    values='Sales',
    index='Region',
    columns='Product',
    aggfunc='sum',
    fill_value=0
)

# Multiple values
pivot = df.pivot_table(
    values=['Sales', 'Profit'],
    index=['Region', 'Year'],
    columns='Product',
    aggfunc={'Sales': 'sum', 'Profit': 'mean'}
)

# With margins (totals)
pivot = df.pivot_table(values='Sales', index='Region',
                       columns='Month', aggfunc='sum',
                       margins=True, margins_name='Total')
```

### 📌 Crosstab (Frequency Table)

```python
# Frequency count of two categorical variables
pd.crosstab(df['Gender'], df['Department'])

# With normalization (proportions)
pd.crosstab(df['Gender'], df['Department'], normalize='index')  # row %
pd.crosstab(df['Gender'], df['Department'], normalize='columns') # col %
pd.crosstab(df['Gender'], df['Department'], normalize='all')     # total %

# Crosstab with values
pd.crosstab(df['Region'], df['Product'], values=df['Sales'], aggfunc='sum')
```

### 📌 pivot() — Simple Reshape (No Aggregation)

```python
# Reshape long → wide (no duplicate index+col combos)
df_wide = df.pivot(index='Date', columns='City', values='Temperature')
```

> 💡 **Recall:** `pivot_table` = flexible, handles duplicates, allows aggregation. `pivot` = strict, no duplicates allowed. `crosstab` = frequency counts between two categoricals.

---

## 16. Reshaping Data (melt, stack, unstack)

### 📌 melt() — Wide → Long

```python
# Unpivot columns into rows
df_long = pd.melt(
    df,
    id_vars=['Name', 'Department'],      # columns to keep as-is
    value_vars=['Q1', 'Q2', 'Q3', 'Q4'],  # columns to unpivot
    var_name='Quarter',                  # name for the new variable col
    value_name='Sales'                   # name for the new value col
)
```

### 📌 stack() and unstack()

```python
# stack: move column level → row level (wide → long)
df_stacked = df.stack()

# unstack: move row level → column level (long → wide)
df_unstacked = df_stacked.unstack()
df_unstacked = df_stacked.unstack(level=0)  # specify which level
```

### 📌 explode() — Expand Lists in Cells

```python
# If a column contains lists
df = pd.DataFrame({'Name': ['Alice', 'Bob'], 'Skills': [['Python', 'SQL'], ['R', 'Excel', 'Python']]})
df_exploded = df.explode('Skills')
#     Name  Skills
# 0  Alice  Python
# 0  Alice     SQL
# 1    Bob       R
# ...
```

> 💡 **Recall:** `melt` = wide to long (columns become rows). The opposite is `pivot` or `pivot_table`.

---

## 17. Data Type Conversions

```python
# Check dtypes
df.dtypes
df['col'].dtype

# Convert types
df['Age'] = df['Age'].astype(int)
df['Score'] = df['Score'].astype(float)
df['Name'] = df['Name'].astype(str)
df['IsActive'] = df['IsActive'].astype(bool)

# To category (saves memory for low-cardinality strings)
df['Gender'] = df['Gender'].astype('category')
df['Department'] = df['Department'].astype('category')

# Numeric conversion (handles errors)
df['Age'] = pd.to_numeric(df['Age'], errors='coerce')  # NaN on failure

# datetime
df['Date'] = pd.to_datetime(df['Date'])

# Integer nullable type (allows NaN in int column)
df['Count'] = df['Count'].astype('Int64')  # capital I = nullable

# Convert all object columns to category
for col in df.select_dtypes('object').columns:
    df[col] = df[col].astype('category')
```

> 💡 **Recall:** `astype()` for direct casting. `pd.to_numeric(errors='coerce')` for safe numeric conversion (won't crash on bad data).

---

## 18. Window Functions (Rolling & Expanding)

```python
# Rolling mean (moving average)
df['MA_7'] = df['Price'].rolling(window=7).mean()      # 7-day moving avg
df['MA_30'] = df['Price'].rolling(window=30).mean()

# Rolling with min_periods
df['MA_7'] = df['Price'].rolling(window=7, min_periods=1).mean()

# Rolling sum, std
df['Rolling_Sum'] = df['Sales'].rolling(window=4).sum()
df['Rolling_Std'] = df['Price'].rolling(window=7).std()

# Expanding (cumulative)
df['Cumulative_Sum'] = df['Sales'].expanding().sum()
df['Cumulative_Max'] = df['Price'].expanding().max()

# Shift (lag values)
df['Prev_Day'] = df['Price'].shift(1)          # 1 period back
df['Next_Day'] = df['Price'].shift(-1)         # 1 period forward
df['Pct_Change'] = df['Price'].pct_change()    # % change from previous

# Diff (difference from previous)
df['Daily_Change'] = df['Price'].diff()
df['2_Day_Change'] = df['Price'].diff(2)
```

> 💡 **Recall:** `rolling(n).mean()` = moving average over n periods. `expanding().sum()` = cumulative sum from start.

---

## 19. Visualization with Pandas

Pandas has built-in plotting (uses Matplotlib under the hood).

```python
import matplotlib.pyplot as plt

# Line plot
df['Sales'].plot(kind='line', title='Sales Over Time', figsize=(10, 4))
plt.show()

# Bar chart
df.groupby('Department')['Salary'].mean().plot(kind='bar', color='steelblue', rot=0)
plt.title('Avg Salary by Department')
plt.ylabel('Salary')
plt.tight_layout()
plt.show()

# Horizontal bar
df.plot(kind='barh', x='Name', y='Score')

# Histogram
df['Age'].plot(kind='hist', bins=20, color='orange', edgecolor='black')

# Box plot
df[['Math', 'Science', 'English']].plot(kind='box')

# Scatter plot
df.plot(kind='scatter', x='Age', y='Salary', alpha=0.6, c='blue')

# Pie chart
df['Department'].value_counts().plot(kind='pie', autopct='%1.1f%%')

# Area chart
df[['Sales', 'Profit']].plot(kind='area', alpha=0.4)

# Heatmap with seaborn (correlation)
sns.heatmap(df.corr(), annot=True, cmap='coolwarm', fmt='.2f')
plt.title('Correlation Matrix')
plt.show()

# Pair plot
sns.pairplot(df[['Age', 'Salary', 'Score', 'Department']], hue='Department')
```

---

## 20. Pandas for Basic ML (Preprocessing Pipeline)

This is the most critical section for ML workflows.

### 📌 Step 1: Load and Inspect

```python
df = pd.read_csv('data.csv')
print(df.shape)
print(df.dtypes)
print(df.isnull().sum())
print(df.describe())
```

### 📌 Step 2: Handle Missing Values

```python
# Numeric: fill with median (robust to outliers)
numeric_cols = df.select_dtypes(include=['float64', 'int64']).columns
df[numeric_cols] = df[numeric_cols].fillna(df[numeric_cols].median())

# Categorical: fill with mode
cat_cols = df.select_dtypes(include=['object', 'category']).columns
for col in cat_cols:
    df[col].fillna(df[col].mode()[0], inplace=True)
```

### 📌 Step 3: Encode Categorical Variables

```python
# Label Encoding (ordinal categories)
df['Grade'] = df['Grade'].map({'A': 4, 'B': 3, 'C': 2, 'D': 1})

# One-Hot Encoding (nominal categories)
df = pd.get_dummies(df, columns=['Gender', 'City'], drop_first=True)
# drop_first=True avoids dummy variable trap

# Using pd.Categorical for ordered encoding
df['Size'] = pd.Categorical(df['Size'], categories=['S', 'M', 'L', 'XL'], ordered=True)
df['Size_Code'] = df['Size'].cat.codes  # converts to 0, 1, 2, 3
```

### 📌 Step 4: Feature Engineering

```python
# New features
df['Age_Group'] = pd.cut(df['Age'], bins=[0, 18, 35, 60, 100],
                          labels=['Teen', 'Young', 'Middle', 'Senior'])

df['Income_per_Year'] = df['Monthly_Income'] * 12
df['Debt_Ratio'] = df['Debt'] / df['Income']
df['Has_Loan'] = (df['Loan_Amount'] > 0).astype(int)

# Binning with qcut (equal-frequency bins)
df['Score_Quartile'] = pd.qcut(df['Score'], q=4, labels=['Q1','Q2','Q3','Q4'])

# Log transformation (reduce skewness)
df['Log_Income'] = np.log1p(df['Income'])  # log(1+x) handles zeros
```

### 📌 Step 5: Remove Outliers

```python
# IQR method
Q1 = df['Salary'].quantile(0.25)
Q3 = df['Salary'].quantile(0.75)
IQR = Q3 - Q1

lower = Q1 - 1.5 * IQR
upper = Q3 + 1.5 * IQR

df_clean = df[(df['Salary'] >= lower) & (df['Salary'] <= upper)]
print(f"Removed {len(df) - len(df_clean)} outliers")
```

### 📌 Step 6: Feature Scaling

```python
from sklearn.preprocessing import StandardScaler, MinMaxScaler

# Standardization (mean=0, std=1) — use for most ML algos
scaler = StandardScaler()
df[['Age', 'Salary', 'Score']] = scaler.fit_transform(df[['Age', 'Salary', 'Score']])

# Min-Max Normalization (0 to 1) — use for neural nets
scaler = MinMaxScaler()
df[['Age', 'Salary']] = scaler.fit_transform(df[['Age', 'Salary']])
```

### 📌 Step 7: Train-Test Split

```python
from sklearn.model_selection import train_test_split

X = df.drop('Target', axis=1)     # features
y = df['Target']                   # label

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42, stratify=y
)

print(f"Train: {X_train.shape}, Test: {X_test.shape}")
```

### 📌 Step 8: Full Pipeline Example

```python
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score, classification_report

# Prepare data
df = pd.read_csv('titanic.csv')
df.drop(['Name', 'Ticket', 'Cabin', 'PassengerId'], axis=1, inplace=True)

# Fill missing
df['Age'].fillna(df['Age'].median(), inplace=True)
df['Embarked'].fillna(df['Embarked'].mode()[0], inplace=True)

# Encode
df = pd.get_dummies(df, columns=['Sex', 'Embarked'], drop_first=True)

# Split
X = df.drop('Survived', axis=1)
y = df['Survived']
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train
model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

# Evaluate
y_pred = model.predict(X_test)
print(f"Accuracy: {accuracy_score(y_test, y_pred):.4f}")
print(classification_report(y_test, y_pred))

# Feature importance
feat_imp = pd.Series(model.feature_importances_, index=X.columns)
feat_imp.sort_values(ascending=False).plot(kind='bar')
plt.title('Feature Importance')
plt.tight_layout()
plt.show()
```

---

## 21. Performance Tips

```python
# 1. Use vectorized operations instead of loops
# SLOW:
for i in range(len(df)):
    df.loc[i, 'Tax'] = df.loc[i, 'Salary'] * 0.2
# FAST:
df['Tax'] = df['Salary'] * 0.2

# 2. Use category dtype for low-cardinality strings
df['Gender'] = df['Gender'].astype('category')  # huge memory saving

# 3. Specify dtypes when reading CSV
df = pd.read_csv('data.csv', dtype={'ID': 'int32', 'Score': 'float32'})

# 4. Use query() instead of boolean indexing for complex filters
df.query('Age > 25 and Salary > 50000')  # faster and cleaner

# 5. Use eval() for complex expressions
df.eval('Tax = Salary * 0.2 + Bonus * 0.1', inplace=True)

# 6. Read only needed columns
df = pd.read_csv('data.csv', usecols=['Name', 'Salary', 'Department'])

# 7. Chunking large files
chunk_list = []
for chunk in pd.read_csv('huge_file.csv', chunksize=10000):
    processed = chunk[chunk['Sales'] > 1000]
    chunk_list.append(processed)
df = pd.concat(chunk_list, ignore_index=True)

# 8. Check memory usage
df.info(memory_usage='deep')
df.memory_usage(deep=True).sum() / 1024**2  # MB

# 9. Avoid using apply for element-wise numeric ops — use vectorized instead
# SLOW:
df['log_sal'] = df['Salary'].apply(np.log)
# FAST:
df['log_sal'] = np.log(df['Salary'])

# 10. copy() to avoid SettingWithCopyWarning
df_sub = df[df['Age'] > 25].copy()
df_sub['New_Col'] = 1   # safe — working on a true copy
```

---

## 22. Quick Recall Cheat Sheet

| Task | Code |
|------|------|
| Load CSV | `pd.read_csv('file.csv')` |
| Shape | `df.shape` |
| Column types | `df.dtypes` |
| First n rows | `df.head(n)` |
| Summary stats | `df.describe()` |
| Null counts | `df.isnull().sum()` |
| Select col | `df['col']` |
| Select cols | `df[['col1','col2']]` |
| Filter rows | `df[df['col'] > val]` |
| By label | `df.loc[row, col]` |
| By position | `df.iloc[row, col]` |
| Add column | `df['new'] = expr` |
| Drop column | `df.drop('col', axis=1)` |
| Rename | `df.rename(columns={'old':'new'})` |
| Sort | `df.sort_values('col')` |
| GroupBy | `df.groupby('col').agg(...)` |
| Merge | `pd.merge(df1, df2, on='key')` |
| Stack rows | `pd.concat([df1, df2])` |
| Fill nulls | `df.fillna(val)` |
| Drop nulls | `df.dropna()` |
| One-hot encode | `pd.get_dummies(df, columns=[...])` |
| Label encode | `df['col'].map({...})` |
| Rolling avg | `df['col'].rolling(7).mean()` |
| Value counts | `df['col'].value_counts()` |
| Unique values | `df['col'].unique()` |
| Apply fn | `df['col'].apply(fn)` |
| To datetime | `pd.to_datetime(df['col'])` |
| Save CSV | `df.to_csv('out.csv', index=False)` |

---

## 🧠 Key Mental Models

```
DataFrame = Dict of Series = Spreadsheet with superpowers

Axis 0 = rows (down)     → axis=0 for operations across rows
Axis 1 = columns (right) → axis=1 for operations across columns

loc  → Labels (index names, column names)
iloc → Integers (position: 0, 1, 2...)

groupby+agg    → shrinks DataFrame (one row per group)
groupby+transform → same shape (broadcasts group stats back)

merge = SQL JOIN
concat = SQL UNION / UNION ALL

apply() = for custom logic
vectorize first, apply() only when needed
```

---

> 📌 **Made with ❤️ for Data Science learners**  
> Practice these on real datasets: [Titanic](https://www.kaggle.com/c/titanic), [Iris](https://archive.ics.uci.edu/ml/datasets/iris), [Housing Prices](https://www.kaggle.com/c/house-prices-advanced-regression-techniques)
