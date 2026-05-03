# 📊 Excel Master Notes for Data Analysts
> **Complete Reference**: Concepts + Formulas + Quick Recall  
> Organized for Data Analysis, Reporting, and Business Intelligence

---

## 📚 Table of Contents

1. [Cell References](#1-cell-references)
2. [Data Types & Formatting](#2-data-types--formatting)
3. [Math & Statistical Functions](#3-math--statistical-functions)
4. [Logical Functions](#4-logical-functions)
5. [Lookup & Reference Functions](#5-lookup--reference-functions)
6. [Text Functions](#6-text-functions)
7. [Date & Time Functions](#7-date--time-functions)
8. [Array Formulas & Dynamic Arrays](#8-array-formulas--dynamic-arrays)
9. [Data Cleaning Techniques](#9-data-cleaning-techniques)
10. [Pivot Tables](#10-pivot-tables)
11. [Conditional Formatting](#11-conditional-formatting)
12. [Data Validation](#12-data-validation)
13. [Charts & Visualization](#13-charts--visualization)
14. [Power Query (Get & Transform)](#14-power-query-get--transform)
15. [Named Ranges & Tables](#15-named-ranges--tables)
16. [Error Handling](#16-error-handling)
17. [Database Functions (DSUM, DAVERAGE...)](#17-database-functions)
18. [Financial Functions](#18-financial-functions)
19. [Keyboard Shortcuts (Must Know)](#19-keyboard-shortcuts-must-know)
20. [Quick Recall Cheat Sheet](#20-quick-recall-cheat-sheet)

---

## 1. Cell References

### 🧠 Concept
Cell references tell Excel where to find data. The type of reference controls what happens when you **copy** a formula.

| Type | Syntax | Row Changes? | Column Changes? |
|------|--------|-------------|-----------------|
| Relative | `A1` | ✅ Yes | ✅ Yes |
| Absolute | `$A$1` | ❌ No | ❌ No |
| Mixed (fix col) | `$A1` | ✅ Yes | ❌ No |
| Mixed (fix row) | `A$1` | ❌ No | ✅ Yes |

### 📝 Formulas
```excel
=A1          → Relative: moves with copy
=$A$1        → Absolute: stays locked always
=$A1         → Column A locked, row changes
=A$1         → Row 1 locked, column changes
=Sheet2!A1   → Cross-sheet reference
=[Book1.xlsx]Sheet1!A1  → Cross-workbook reference
```

### ⚡ Quick Recall
- Press **F4** to toggle between reference types while editing
- Use `$` to lock what should NOT change when copying
- Rule: Lock the reference that points to a **fixed lookup table or assumption**

---

## 2. Data Types & Formatting

### 🧠 Concept
Excel stores data as one of four types: **Number, Text, Logical (TRUE/FALSE), Error**. Getting this right is critical for calculations.

### Common Formatting Codes
```excel
# Number formats
0          → No decimals (e.g., 1234)
0.00       → 2 decimals (e.g., 1234.56)
#,##0      → Thousands separator (e.g., 1,234)
#,##0.00   → Thousands + 2 decimals
0%         → Percentage (e.g., 75%)
0.0%       → Percentage with 1 decimal

# Date formats
dd/mm/yyyy → 01/06/2024
mmm-yy     → Jun-24
dddd       → Full weekday name (Monday)
mmmm       → Full month name (June)

# Custom / special
"$"#,##0   → Dollar currency
[Red]0     → Red color for numbers
0;(0);"-"  → Positive; Negative in brackets; Zero as dash
```

### ⚡ Quick Recall
- Numbers stored as text won't SUM → use `VALUE()` to convert
- Dates are secretly numbers (Jan 1, 1900 = 1). This is why date math works.
- Use **CTRL+1** to open Format Cells dialog quickly

---

## 3. Math & Statistical Functions

### 🧠 Concept
These are the backbone of data analysis — from simple sums to conditional aggregations.

### Basic Math
```excel
=SUM(A1:A10)               → Sum of range
=SUMIF(B:B,"Sales",C:C)    → Sum C where B = "Sales"
=SUMIFS(C:C, B:B,"Sales", D:D,">100")  → Multiple conditions
=SUMPRODUCT(A1:A5,B1:B5)   → Multiply arrays then sum (powerful!)
=PRODUCT(A1:A5)             → Multiply all values
=MOD(A1,B1)                 → Remainder after division
=ROUND(A1,2)                → Round to 2 decimal places
=ROUNDUP(A1,0)              → Always round up
=ROUNDDOWN(A1,0)            → Always round down
=INT(A1)                    → Drop decimals (floor)
=ABS(A1)                    → Absolute value (removes negative sign)
=POWER(A1,2)                → A1 squared (same as A1^2)
=SQRT(A1)                   → Square root
```

### Statistical
```excel
=AVERAGE(A1:A10)            → Mean
=AVERAGEIF(B:B,"East",C:C)  → Conditional average
=AVERAGEIFS(C:C,B:B,"East",D:D,">50)
=MEDIAN(A1:A10)             → Middle value
=MODE(A1:A10)               → Most frequent value (old)
=MODE.SNGL(A1:A10)          → Single mode (Excel 2010+)
=MODE.MULT(A1:A10)          → All modes (array)
=STDEV(A1:A10)              → Sample standard deviation
=STDEVP(A1:A10)             → Population standard deviation
=VAR(A1:A10)                → Sample variance
=MIN(A1:A10)                → Minimum
=MAX(A1:A10)                → Maximum
=SMALL(A1:A10,2)            → 2nd smallest value
=LARGE(A1:A10,3)            → 3rd largest value
=COUNT(A1:A10)              → Count numbers only
=COUNTA(A1:A10)             → Count non-empty cells
=COUNTBLANK(A1:A10)         → Count empty cells
=COUNTIF(B:B,"Sales")       → Count matching cells
=COUNTIFS(B:B,"Sales",C:C,">100)  → Multiple conditions
=PERCENTILE(A1:A10,0.9)     → 90th percentile
=QUARTILE(A1:A10,1)         → Q1 (25th percentile)
=RANK(A1,A$1:A$10,0)        → Rank descending
=RANK.EQ(A1,A$1:A$10,1)     → Rank ascending
=CORREL(A1:A10,B1:B10)      → Correlation coefficient
```

### ⚡ Quick Recall
- `SUMIF` = one condition | `SUMIFS` = multiple conditions
- `SUMPRODUCT` is the Swiss Army knife — use it for weighted averages, conditional counts/sums without array entry
- `COUNTIF(range,"*text*")` uses wildcards: `*` = anything, `?` = one character

---

## 4. Logical Functions

### 🧠 Concept
Logical functions evaluate conditions and return TRUE/FALSE or custom results. Essential for categorization, flags, and dynamic calculations.

```excel
=IF(A1>100,"High","Low")          → Basic IF
=IF(A1="","Empty","Has Data")     → Check for blank
=IFS(A1>100,"High",A1>50,"Mid",TRUE,"Low")  → Multiple conditions (no nesting!)
=AND(A1>0, B1<100)                → TRUE only if ALL are true
=OR(A1="Yes", B1="Yes")           → TRUE if ANY is true
=NOT(A1="Cancelled")              → Reverses logical value

# Nested IF (use IFS instead when possible)
=IF(A1>90,"A",IF(A1>80,"B",IF(A1>70,"C","F")))

# Combining with AND/OR
=IF(AND(A1>0,B1="Active"),"Valid","Invalid")
=IF(OR(A1="Cash",A1="Card"),"Paid","Pending")

# SWITCH — like a lookup table for logic
=SWITCH(A1,"Mon","Monday","Tue","Tuesday","Other")

# IFERROR — handle errors gracefully
=IFERROR(A1/B1,"Div Error")
=IFNA(VLOOKUP(...),"Not Found")   → Only catches #N/A errors
```

### ⚡ Quick Recall
- `IF` nesting limit = 7 levels (use `IFS` or `SWITCH` instead)
- `AND` → All must be TRUE | `OR` → At least one must be TRUE
- Always wrap risky formulas (like VLOOKUP) in `IFERROR`

---

## 5. Lookup & Reference Functions

### 🧠 Concept
The most important category for data analysts — used to merge datasets, find values, and build dynamic references.

### VLOOKUP (Old but widely used)
```excel
=VLOOKUP(lookup_value, table_array, col_index_num, [range_lookup])

=VLOOKUP(A2, $F$2:$H$100, 2, 0)
# lookup_value  → What you're looking for (A2)
# table_array   → Where to look ($F$2:$H$100) — lock with $!
# col_index_num → Which column to return (2 = 2nd column)
# range_lookup  → 0 or FALSE = Exact match (always use this for data)
#               → 1 or TRUE  = Approximate match (for ranges/tiers)

# Double VLOOKUP — dynamic column index
=VLOOKUP(A2,$F$2:$H$100,MATCH(B1,$F$1:$H$1,0),0)
```

### HLOOKUP
```excel
=HLOOKUP(lookup_value, table_array, row_index_num, [range_lookup])
# Same as VLOOKUP but searches horizontally (across rows)
=HLOOKUP("Q2", $A$1:$D$3, 2, 0)
```

### INDEX + MATCH (Better than VLOOKUP)
```excel
=INDEX(return_range, MATCH(lookup_value, lookup_range, 0))

=INDEX(C:C, MATCH(A2, B:B, 0))
# MATCH finds the ROW position → INDEX returns the value

# Why better than VLOOKUP?
# ✅ Can look LEFT (VLOOKUP can only look right)
# ✅ Faster on large datasets
# ✅ Column won't break if you insert columns

# Two-way lookup (match both row and column)
=INDEX(B2:E10, MATCH(G2, A2:A10, 0), MATCH(H2, B1:E1, 0))
```

### XLOOKUP (Modern — Excel 365 / 2021+)
```excel
=XLOOKUP(lookup_value, lookup_array, return_array, [if_not_found], [match_mode], [search_mode])

=XLOOKUP(A2, F:F, G:G)              → Basic lookup
=XLOOKUP(A2, F:F, G:G, "Not Found") → Custom error message
=XLOOKUP(A2, F:F, G:G,,-1)         → Next smaller match
=XLOOKUP(A2, F:F, B2:D2)           → Return multiple columns!

# match_mode: 0=exact, -1=next smaller, 1=next larger, 2=wildcard
# search_mode: 1=first to last, -1=last to first, 2=binary asc, -2=binary desc
```

### MATCH & INDEX Standalone
```excel
=MATCH(lookup_value, lookup_array, [match_type])
=MATCH("Sales", A:A, 0)   → Returns row number of "Sales"
# match_type: 0=exact, 1=less than (sorted asc), -1=greater than (sorted desc)

=INDEX(array, row_num, [col_num])
=INDEX(A1:D10, 3, 2)      → Returns value at row 3, col 2
=INDEX(A:A, MATCH(MAX(B:B), B:B, 0))  → Name with max score
```

### CHOOSE
```excel
=CHOOSE(index_num, value1, value2, ...)
=CHOOSE(2, "Jan","Feb","Mar")   → Returns "Feb"
=CHOOSE(MONTH(TODAY()), "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
```

### OFFSET
```excel
=OFFSET(reference, rows, cols, [height], [width])
=OFFSET(A1, 2, 1)           → Cell 2 rows down, 1 col right (B3)
=SUM(OFFSET(A1,0,0,5,1))    → Sum 5 rows from A1 dynamically
# ⚠️ OFFSET is volatile — recalculates every change (slow on big files)
```

### INDIRECT
```excel
=INDIRECT(ref_text)
=INDIRECT("A"&B1)           → Dynamic cell reference using B1 as row number
=INDIRECT(C1&"!A1")         → Reference sheet name stored in C1
# ⚠️ INDIRECT is volatile — use sparingly
```

### ⚡ Quick Recall
```
VLOOKUP  → Simple, right-only, fragile with column inserts
INDEX+MATCH → Flexible, left/right, preferred for large data
XLOOKUP  → Best modern option, replaces both above
MATCH alone → Find position (row/col number)
INDEX alone → Get value by position
```

---

## 6. Text Functions

### 🧠 Concept
Text functions are essential for data cleaning, parsing imported data, and building dynamic labels.

```excel
# Joining text
=CONCATENATE(A1," ",B1)         → Join with space (old)
=A1&" "&B1                      → Same using & operator (preferred)
=TEXTJOIN(", ",TRUE,A1:A5)      → Join range with delimiter, skip blanks

# Case
=UPPER(A1)                      → ALL CAPS
=LOWER(A1)                      → all lowercase
=PROPER(A1)                     → Title Case

# Length & position
=LEN(A1)                        → Number of characters
=FIND("@",A1)                   → Position of "@" (case-sensitive)
=SEARCH("@",A1)                 → Position of "@" (case-insensitive, allows wildcards)

# Extracting text
=LEFT(A1,5)                     → First 5 characters
=RIGHT(A1,4)                    → Last 4 characters
=MID(A1,3,5)                    → 5 characters starting from position 3
=TRIM(A1)                       → Remove extra spaces (leading, trailing, multiple internal)
=CLEAN(A1)                      → Remove non-printable characters (from imports)

# Replacing & substituting
=SUBSTITUTE(A1,"Old","New")     → Replace all occurrences
=SUBSTITUTE(A1,"Old","New",2)   → Replace only 2nd occurrence
=REPLACE(A1,3,2,"XX")           → Replace 2 chars starting at position 3

# Checking text
=EXACT(A1,B1)                   → TRUE if identical (case-sensitive)
=ISNUMBER(VALUE(A1))            → Check if text is actually a number

# Converting
=VALUE(A1)                      → Text → Number
=TEXT(A1,"dd/mm/yyyy")          → Number/Date → Formatted text
=TEXT(1234.5,"$#,##0.00")       → "$1,234.50"
=NUMBERVALUE(A1,".",",")        → Convert with custom separators

# Parsing emails & data
=LEFT(A1,FIND("@",A1)-1)        → Extract username from email
=MID(A1,FIND("@",A1)+1,LEN(A1))→ Extract domain from email

# CHAR & CODE
=CHAR(65)                       → "A" (ASCII to character)
=CODE("A")                      → 65 (character to ASCII)
=CHAR(10)                       → Line break (use in cell with wrap text)
```

### ⚡ Quick Recall
- `TRIM` + `CLEAN` → Always run on imported data
- `SUBSTITUTE` vs `REPLACE`: SUBSTITUTE finds text, REPLACE uses position
- `FIND` is case-sensitive; `SEARCH` is not and allows `*` wildcards
- Extract before `@`: `=LEFT(A1,FIND("@",A1)-1)`

---

## 7. Date & Time Functions

### 🧠 Concept
Excel stores dates as serial numbers (Jan 1, 1900 = 1). This enables date arithmetic. Times are decimal fractions of a day.

```excel
# Current date/time
=TODAY()                          → Today's date (updates daily) ⚠️ volatile
=NOW()                            → Current date and time ⚠️ volatile

# Building dates
=DATE(2024,6,15)                  → June 15, 2024
=TIME(14,30,0)                    → 2:30 PM
=DATEVALUE("15-Jun-2024")         → Converts text date to serial number
=TIMEVALUE("14:30:00")            → Converts text time to decimal

# Extracting parts
=YEAR(A1)                         → Year (e.g., 2024)
=MONTH(A1)                        → Month number (1–12)
=DAY(A1)                          → Day (1–31)
=HOUR(A1)                         → Hour (0–23)
=MINUTE(A1)                       → Minute (0–59)
=SECOND(A1)                       → Second (0–59)
=WEEKDAY(A1,2)                    → Day of week (2=Mon=1 through Sun=7)
=WEEKNUM(A1,2)                    → Week number of year

# Date arithmetic
=A1-B1                            → Days between two dates
=DATEDIF(start,end,"Y")           → Complete years between dates
=DATEDIF(start,end,"M")           → Complete months
=DATEDIF(start,end,"D")           → Total days
=DATEDIF(start,end,"YM")          → Months ignoring years
=EDATE(A1,3)                      → Date 3 months from A1
=EOMONTH(A1,0)                    → Last day of A1's month
=EOMONTH(A1,1)                    → Last day of next month
=EOMONTH(A1,-1)+1                 → First day of A1's month

# Working day functions
=WORKDAY(A1,10)                   → 10 working days from A1
=WORKDAY(A1,10,holidays)          → Exclude holidays
=NETWORKDAYS(start,end)           → Working days between dates
=NETWORKDAYS(start,end,holidays)  → Excluding holidays

# Formatting dates as text
=TEXT(A1,"mmmm yyyy")             → "June 2024"
=TEXT(A1,"dd-mmm-yy")            → "15-Jun-24"
=TEXT(A1,"dddd")                  → "Saturday"
```

### ⚡ Quick Recall
- Age formula: `=DATEDIF(birthdate, TODAY(), "Y")`
- Days overdue: `=MAX(0, TODAY()-due_date)`
- First day of month: `=EOMONTH(A1,-1)+1`
- Last day of month: `=EOMONTH(A1,0)`
- `DATEDIF` is hidden/undocumented but works — "Y","M","D","YM","MD","YD"

---

## 8. Array Formulas & Dynamic Arrays

### 🧠 Concept
Arrays let you perform operations on multiple values at once. **Legacy arrays** need CTRL+SHIFT+ENTER. **Dynamic arrays** (Excel 365) spill automatically.

### Legacy Array Formulas (CSE)
```excel
# Press CTRL+SHIFT+ENTER to confirm (shows curly braces {})
{=SUM(IF(A1:A10="Sales",B1:B10,0))}    → Conditional sum (use SUMIF instead)
{=MAX(IF(A1:A10="East",B1:B10))}        → Max with condition
{=MIN(IF(A1:A10>0,A1:A10))}             → Min of positive values only
{=COUNT(IF(A1:A10>100,1))}              → Count with condition
```

### Dynamic Array Functions (Excel 365 / 2021+)
```excel
# SPILL — results automatically fill cells below/right (no CSE needed)

=SORT(A1:A10)                          → Sort ascending
=SORT(A1:A10,1,-1)                     → Sort descending
=SORT(A1:C10,2,-1)                     → Sort by 2nd column descending

=SORTBY(A1:A10,B1:B10,-1)              → Sort A by B column descending
=SORTBY(A1:C10,C1:C10,-1,B1:B10,1)   → Multi-level sort

=UNIQUE(A1:A10)                        → Unique values (removes duplicates)
=UNIQUE(A1:A10,FALSE,TRUE)             → Only values that appear once

=FILTER(A1:C10, B1:B10="Sales")        → Filter rows where B = "Sales"
=FILTER(A1:C10, (B1:B10="Sales")*(C1:C10>100))  → Multiple conditions (AND)
=FILTER(A1:C10, (B1:B10="Sales")+(C1:C10>100))  → OR condition
=FILTER(A1:C10, B1:B10="Sales","No Results")     → Custom if empty

=SEQUENCE(5)                           → {1;2;3;4;5} vertically
=SEQUENCE(3,4)                         → 3×4 array of 1–12
=SEQUENCE(12,1,1,1)                    → Months 1–12

=RANDARRAY(5,3)                        → 5×3 array of random numbers
=RANDARRAY(5,3,1,100,TRUE)            → Random integers 1–100

=TOCOL(A1:C3)                          → Convert 2D range to single column
=TOROW(A1:C3)                          → Convert 2D range to single row
=HSTACK(A1:A5, B1:B5)                 → Stack arrays horizontally
=VSTACK(A1:C3, D1:F3)                 → Stack arrays vertically

=TAKE(A1:A10,3)                        → First 3 rows
=TAKE(A1:A10,-3)                       → Last 3 rows
=DROP(A1:A10,2)                        → Remove first 2 rows
=EXPAND(A1:B2,4,4,0)                  → Expand to 4×4, fill with 0

# Reference spill range with #
=SUM(A1#)     → Sum the entire spilled range from A1
```

### ⚡ Quick Recall
- `#` after a cell reference = entire spill range (e.g., `A1#`)
- `FILTER + SORT` combo = instant dynamic reporting
- `UNIQUE + COUNTIF` = frequency analysis without Pivot Tables
- `SEQUENCE` + `INDEX` = dynamic row-by-row references

---

## 9. Data Cleaning Techniques

### 🧠 Concept
Real-world data is messy. These techniques are the first step in any analysis.

### Common Cleaning Formulas
```excel
# Remove whitespace
=TRIM(A1)                              → Remove leading/trailing spaces, normalize internal
=SUBSTITUTE(A1," ","")                 → Remove ALL spaces
=SUBSTITUTE(TRIM(A1),"  "," ")        → Extra safety for double spaces

# Remove non-printable chars (from copy-paste or imports)
=CLEAN(A1)
=CLEAN(TRIM(A1))                       → Combine both

# Standardize text
=PROPER(TRIM(LOWER(A1)))               → Normalize capitalization

# Check and convert number-stored-as-text
=ISNUMBER(A1)                          → TRUE if numeric
=VALUE(A1)                             → Convert text "123" → 123
=A1*1                                  → Force conversion trick
=A1+0                                  → Alternative force conversion

# Handle blanks and nulls
=IF(A1="","Missing",A1)               → Replace blank with label
=IF(ISBLANK(A1),B1,A1)               → Use fallback value
=COALESCE logic: =IF(A1<>"",A1,IF(B1<>"",B1,C1))  → First non-blank

# Deduplicate (check for duplicates)
=COUNTIF(A$1:A1,A1)                   → 1 = first occurrence, >1 = duplicate
=COUNTIF(A:A,A1)>1                    → TRUE if duplicate exists anywhere

# Standardize dates from text
=DATEVALUE(TEXT(A1,"00\/00\/0000"))   → Parse messy date text
=DATE(RIGHT(A1,4),MID(A1,4,2),LEFT(A1,2))  → Parse "DD/MM/YYYY" text

# Flag anomalies
=ABS(A1-AVERAGE(A:A))>2*STDEV(A:A)   → TRUE = outlier (>2 std devs)

# Split text to columns (formula method)
=LEFT(A1,FIND(" ",A1)-1)              → First name (before space)
=MID(A1,FIND(" ",A1)+1,LEN(A1))      → Last name (after space)

# Reverse split (combine columns)
=A1&" "&B1                             → Full name
=TEXTJOIN(" ",TRUE,A1:C1)             → Join multiple with space
```

### ⚡ Quick Recall
```
Step 1: TRIM + CLEAN all text columns
Step 2: VALUE() any number-as-text columns  
Step 3: COUNTIF to flag duplicates
Step 4: Check date columns with ISNUMBER or ISDATE
Step 5: Handle blanks with IF(ISBLANK(...))
```

---

## 10. Pivot Tables

### 🧠 Concept
Pivot Tables are the fastest way to summarize, group, and explore large datasets without formulas.

### Key Steps
```
1. Click anywhere in your data → Insert → PivotTable
2. Ensure data has headers and no blank columns/rows
3. Drag fields:
   - ROWS: Categories to group by (Region, Product, Date)
   - COLUMNS: Cross-tabulation (e.g., Year)
   - VALUES: What to measure (Sales, Count, Average)
   - FILTERS: Top-level slicer (e.g., Segment)
```

### GETPIVOTDATA Formula
```excel
=GETPIVOTDATA("Sales", $A$3, "Region","East", "Year",2024)
# "Sales"    → Data field name
# $A$3       → Any cell inside the Pivot Table
# "Region","East" → Filter by Region = East
# "Year",2024    → Filter by Year = 2024

# Disable auto-GETPIVOTDATA: File → Options → Formulas → uncheck
```

### Value Field Settings (Right-click the Values field)
```
Sum         → Total
Count       → Number of rows
Average     → Mean
Max/Min     → Extremes
% of Total  → Each row as % of grand total
% of Row    → Each value as % of its row total
% of Col    → Each value as % of its column total
Running Total → Cumulative sum
Rank        → Rank within group
```

### ⚡ Quick Recall
- **Refresh data**: Right-click → Refresh (or Alt+F5 for all)
- **Group dates**: Right-click a date → Group → by Month/Quarter/Year
- **Calculated field**: PivotTable Analyze → Fields, Items → Calculated Field
- **Slicers**: Insert → Slicer → visually filter multiple Pivot Tables at once

---

## 11. Conditional Formatting

### 🧠 Concept
Automatically change cell appearance based on rules — great for dashboards and exception highlighting.

### Common Rules
```
Home → Conditional Formatting:

Highlight Cell Rules:
  → Greater Than / Less Than / Between / Equal To / Duplicate Values

Top/Bottom Rules:
  → Top 10 Items / Bottom 10% / Above Average / Below Average

Data Bars      → Mini bar chart in cell
Color Scales   → Heat map (3-color or 2-color gradient)
Icon Sets      → Arrows, traffic lights, stars (3–5 categories)
```

### Custom Formula Rules (Most Powerful)
```excel
# Apply to entire rows based on one column
=  $C1="Cancelled"              → Highlight row if Status = Cancelled
=  $D1<TODAY()                  → Highlight overdue dates
=  MOD(ROW(),2)=0               → Alternate row shading (zebra stripes)
=  COUNTIF($A$1:$A1,$A1)>1      → Highlight duplicate values
=  $B1=MAX($B$1:$B$100)         → Highlight maximum value
=  AND($B1>100,$C1="Active")    → Multi-condition highlight

# Note: Use $ to lock columns in row-based rules
# Apply to range: $A$1:$Z$100 with formula starting at row 1
```

### ⚡ Quick Recall
- Formula-based rules → Use `$` to lock the column, leave row relative
- Check rule order (top rules win) — manage via **Manage Rules**
- Don't overuse conditional formatting — it slows down large files

---

## 12. Data Validation

### 🧠 Concept
Control what users can enter in cells — prevents errors at the source.

```
Data → Data Validation → Settings

Allow:
  Whole Number   → Integer within range
  Decimal        → e.g., between 0 and 1 for percentages
  List           → Dropdown menu
  Date           → Valid date range
  Time           → Valid time range
  Text Length    → e.g., max 50 characters
  Custom         → Formula-based rule
```

### Dropdown List
```excel
# Static list (type directly in Source):
Pending,Active,Closed,On Hold

# Dynamic list from range:
=$F$1:$F$10   → Fixed range
=Table1[Status]  → From a named table (best practice)

# Dependent dropdown (Region → City):
Step 1: Name your city lists (e.g., "East" = D1:D5, "West" = E1:E5)
Step 2: In second dropdown, Source: =INDIRECT($A2)
# Requires exact name match between list name and first dropdown value
```

### Custom Validation Formulas
```excel
=AND(A1>=0,A1<=100)              → 0–100 only
=ISNUMBER(A1)                    → Numbers only
=LEN(A1)<=10                     → Max 10 characters
=COUNTIF($A$1:$A$100,A1)=1      → No duplicates
=NOT(ISNUMBER(FIND(" ",A1)))     → No spaces allowed
=A1>TODAY()                      → Future dates only
```

### ⚡ Quick Recall
- Add **Input Message**: what shows when cell is selected
- Add **Error Alert**: custom error if rule is violated (Stop / Warning / Information)
- Circle invalid data: Data → Data Validation → Circle Invalid Data

---

## 13. Charts & Visualization

### 🧠 Concept
Choose chart type based on what you're communicating, not aesthetics.

### Chart Type Selection Guide
```
📊 Bar / Column Chart    → Compare categories
📈 Line Chart           → Trends over time
🥧 Pie / Donut Chart    → Part-to-whole (max 5–6 slices!)
📉 Area Chart           → Cumulative trends
🔵 Scatter Plot         → Correlation between 2 variables
📦 Box Plot             → Distribution & outliers
🌡️ Waterfall            → How components add/subtract to total
🗺️ Map Chart            → Geographic data
📊 Combo Chart          → Dual axis (Bar + Line)
```

### Key Chart Elements
```
Chart Title         → Clear, descriptive (e.g., "Monthly Revenue Jan–Jun 2024")
Axis Labels         → Always label axes with units
Data Labels         → Show values on bars/points
Legend              → Only if multiple series; position matters
Gridlines           → Horizontal only; keep minimal
Colors              → Use max 4–5 colors; color-blind safe
```

### Useful Tricks
```excel
# Dynamic chart title linked to cell
→ Click chart title → type = in formula bar → click the cell

# Sparklines (mini charts in cells)
→ Insert → Sparklines → Line/Column/Win-Loss
→ Great for trend-at-a-glance in dashboards

# Named range in chart (for dynamic charts)
→ Define name: =OFFSET(Sheet1!$A$1,0,0,COUNTA(Sheet1!$A:$A),1)
→ Use in chart data source: =Sheet1!SalesData
```

---

## 14. Power Query (Get & Transform)

### 🧠 Concept
Power Query is Excel's ETL (Extract, Transform, Load) tool. Use it for repeatable data cleaning and combining multiple sources. Changes are recorded as steps — no formulas needed.

### Key Operations
```
Data → Get Data → From File / Database / Web / etc.

Common Transformations:
  Remove Columns/Rows
  Filter Rows
  Split Column (by delimiter, by position)
  Merge Columns
  Change Data Type
  Replace Values
  Fill Down / Up
  Unpivot Columns → Convert wide to long format (crucial!)
  Pivot Columns   → Convert long to wide format
  Group By        → Aggregate (sum, count, avg)
  Merge Queries   → Like SQL JOIN
  Append Queries  → Stack tables (like UNION ALL)
```

### M Language Snippets
```m
// Filter rows
Table.SelectRows(Source, each [Region] = "East")

// Add conditional column
Table.AddColumn(Source, "Category",
  each if [Sales] > 1000 then "High"
  else if [Sales] > 500 then "Medium"
  else "Low")

// Remove duplicates
Table.Distinct(Source, {"Customer ID"})

// Clean text
Table.TransformColumns(Source, {{"Name", Text.Trim}})
```

### ⚡ Quick Recall
- Power Query edits don't change source data — safe to experiment
- **Refresh All** (Ctrl+Alt+F5) updates all queries
- Use Power Query instead of formulas for: combining 12 monthly sheets, cleaning messy imports, pivoting/unpivoting data

---

## 15. Named Ranges & Tables

### 🧠 Concept
Names make formulas readable and less error-prone. Excel Tables (CTRL+T) are structured and auto-expand.

### Named Ranges
```excel
# Create: Formulas → Define Name (or use Name Box top-left)
Name: TaxRate   Refers to: =Sheet1!$B$1

# Use in formulas
=A1 * TaxRate              → Instead of =A1 * $B$1
=VLOOKUP(A2, ProductTable, 2, 0)   → Self-documenting

# Dynamic named range (expands automatically)
=OFFSET(Sheet1!$A$2,0,0,COUNTA(Sheet1!$A:$A)-1,1)

# Manage names: Formulas → Name Manager (Ctrl+F3)
```

### Excel Tables (CTRL+T)
```excel
# Structured references
=Table1[Sales]            → Entire Sales column
=[@Sales]                 → This row's Sales value (in table formula)
=Table1[[Sales]:[Profit]] → Multiple columns range
=Table1[#Totals]          → Total row
=Table1[#Headers]         → Header row

# Advantages:
✅ Auto-expands when you add rows
✅ Formulas auto-fill down
✅ Works perfectly with VLOOKUP, PivotTables
✅ Built-in filter buttons
✅ Structured references are self-documenting
```

### ⚡ Quick Recall
- Name your key assumption cells: `TaxRate`, `DiscountRate`, `FYStart`
- Always convert analysis data to Tables (CTRL+T) — they auto-expand
- Tables + XLOOKUP + Pivot Tables = clean, maintainable workbooks

---

## 16. Error Handling

### 🧠 Concept
Understand what each error means, then handle or prevent it.

### Error Types Reference
| Error | Meaning | Common Cause | Fix |
|-------|---------|-------------|-----|
| `#DIV/0!` | Division by zero | `/0` or `/""` | `=IFERROR(A/B,0)` |
| `#VALUE!` | Wrong data type | Math on text | `=VALUE()` or check types |
| `#REF!` | Invalid reference | Deleted row/col | Rebuild formula |
| `#NAME?` | Unknown name | Typo in formula/function name | Check spelling |
| `#N/A` | Value not found | VLOOKUP miss | `=IFNA(VLOOKUP(...),"")` |
| `#NULL!` | Incorrect range | Space instead of comma | Check range separators |
| `#NUM!` | Invalid number | `=SQRT(-1)` | Check inputs |
| `######` | Column too narrow | Not really an error | Widen column |

### Error Handling Formulas
```excel
=IFERROR(formula, value_if_error)    → Catch any error
=IFNA(formula, value_if_na)         → Catch only #N/A (VLOOKUP misses)
=ISERROR(A1)                        → TRUE if any error
=ISNA(A1)                           → TRUE if #N/A
=ISNUMBER(A1)                       → TRUE if numeric
=ISTEXT(A1)                         → TRUE if text
=ISBLANK(A1)                        → TRUE if empty

# Best practice patterns
=IFERROR(VLOOKUP(A1,Table,2,0),"Not Found")
=IFERROR(A1/B1,0)                   → Return 0 for division errors
=IF(B1=0,"N/A",A1/B1)              → Prevent before it happens (better)
```

---

## 17. Database Functions

### 🧠 Concept
DSUM, DAVERAGE, etc. work like SUMIF but use a **criteria range** (external table) instead of inline conditions. Useful for complex, reusable criteria.

```excel
=DSUM(database, field, criteria)
=DSUM(A1:D100, "Sales", F1:G2)
# database  → Full data range including headers
# field     → Column name in quotes OR column number
# criteria  → Separate range with matching header + condition row(s)

=DSUM(A1:D100,"Sales",F1:G2)      → Sum Sales where criteria match
=DCOUNT(A1:D100,"Sales",F1:G2)    → Count numeric values
=DCOUNTA(A1:D100,"Name",F1:G2)    → Count non-empty
=DAVERAGE(A1:D100,"Sales",F1:G2)  → Average
=DMAX(A1:D100,"Sales",F1:G2)      → Maximum
=DMIN(A1:D100,"Sales",F1:G2)      → Minimum

# Criteria range setup:
| Region | Sales  |     (same header as database)
| East   | >1000  |     (condition row — AND within row, OR between rows)
| West   |        |     (second row = OR condition)
```

### ⚡ Quick Recall
- Database functions = SUMIFS on steroids with reusable criteria table
- Criteria rows in same row = AND logic; separate rows = OR logic
- Most analysts prefer SUMIFS — use D-functions when criteria are complex and reused

---

## 18. Financial Functions

### 🧠 Concept
Essential for business analytics involving cash flows, loans, investments, and time value of money.

```excel
# Time Value of Money
=PV(rate, nper, pmt, [fv])         → Present Value
=FV(rate, nper, pmt, [pv])         → Future Value
=NPV(rate, value1, value2,...)      → Net Present Value (starts period 1)
=XNPV(rate, values, dates)         → NPV with irregular cash flows
=IRR(values)                        → Internal Rate of Return
=XIRR(values, dates)               → IRR with irregular cash flows
=PMT(rate, nper, pv)               → Loan payment amount
=IPMT(rate, per, nper, pv)         → Interest portion of payment
=PPMT(rate, per, nper, pv)         → Principal portion of payment
=NPER(rate, pmt, pv)               → Number of periods
=RATE(nper, pmt, pv)               → Interest rate

# Examples
=PMT(5%/12, 360, -200000)          → Monthly mortgage payment
# 5%/12 = monthly rate, 360 = 30 years × 12, -200000 = loan amount

=NPV(10%, B2:B6)+B1                → NPV where B1 = initial investment (period 0)
# ⚠️ NPV() assumes first value is at end of period 1, so add period 0 separately

=FV(8%/12, 12*10, -500)            → Save $500/month for 10 years at 8%

# Depreciation
=SLN(cost, salvage, life)          → Straight-line depreciation
=DB(cost, salvage, life, period)   → Declining balance
=DDB(cost, salvage, life, period)  → Double declining balance

# Other Financial
=EFFECT(nominal_rate, npery)        → Effective annual rate
=NOMINAL(effect_rate, npery)       → Nominal rate from effective
```

### ⚡ Quick Recall
- Sign convention: cash out = negative, cash in = positive
- Divide annual rate by 12 for monthly calculations
- `XNPV` / `XIRR` are more realistic than `NPV` / `IRR` (handle real dates)

---

## 19. Keyboard Shortcuts (Must Know)

### Navigation
```
Ctrl+Home        → Go to A1
Ctrl+End         → Last used cell
Ctrl+Arrow       → Jump to end of data block
Ctrl+Shift+Arrow → Select to end of data block
Ctrl+Page Up/Down → Switch sheets
F5 or Ctrl+G     → Go To (jump to cell or named range)
```

### Editing
```
F2               → Edit cell (enters edit mode)
F4               → Toggle $-reference OR repeat last action
Ctrl+D           → Fill Down (copy formula from top of selection)
Ctrl+R           → Fill Right (copy formula from left of selection)
Ctrl+;           → Insert today's date (static)
Ctrl+Shift+;     → Insert current time (static)
Alt+Enter        → New line within a cell
Ctrl+Z / Ctrl+Y  → Undo / Redo
```

### Selection
```
Ctrl+Shift+End   → Select to last used cell
Ctrl+*           → Select current region (data block)
Ctrl+Space       → Select entire column
Shift+Space      → Select entire row
Ctrl+A           → Select all (twice = entire sheet)
```

### Formatting
```
Ctrl+1           → Format Cells dialog
Ctrl+B/I/U       → Bold / Italic / Underline
Ctrl+Shift+$     → Currency format
Ctrl+Shift+%     → Percentage format
Ctrl+Shift+#     → Date format
Ctrl+Shift+!     → Number format with commas
Alt+H+H          → Fill color (ribbon shortcut)
```

### Data & Formulas
```
Ctrl+T           → Create Table
Ctrl+L           → Create Table (same)
Alt+=            → AutoSum (SUM of above cells)
Ctrl+Shift+Enter → Confirm array formula (legacy)
F9               → Calculate now / Evaluate selected formula part
Ctrl+`           → Toggle show formulas vs values
Ctrl+[           → Trace precedents (jump to referenced cells)
F5+Enter         → Go to (select blank cells, etc.)
```

### Pivot Tables
```
Alt+N+V+T        → Insert PivotTable
Alt+F5           → Refresh all pivot tables
Ctrl+Shift+*     → Select pivot table data range
```

---

## 20. Quick Recall Cheat Sheet

### 🔥 Most Used Formulas at a Glance

```excel
# ── LOOKUP ──────────────────────────────────────────────
=XLOOKUP(val, lookup, return, "Not Found")         # Best lookup
=INDEX(C:C, MATCH(A1, B:B, 0))                    # Flexible lookup
=VLOOKUP(A1, $F:$H, 2, 0)                         # Classic (exact match)

# ── CONDITIONAL AGGREGATION ──────────────────────────────
=SUMIFS(sum_rng, rng1, crit1, rng2, crit2)
=COUNTIFS(rng1, crit1, rng2, crit2)
=AVERAGEIFS(avg_rng, rng1, crit1)

# ── TEXT ─────────────────────────────────────────────────
=TRIM(CLEAN(A1))                                   # Clean imported text
=LEFT(A1,FIND(" ",A1)-1)                          # First word
=TEXT(A1,"mmm-yy")                                # Date to text

# ── DATE ─────────────────────────────────────────────────
=DATEDIF(start, TODAY(), "Y")                      # Age in years
=EOMONTH(A1,0)                                     # Last day of month
=NETWORKDAYS(A1,B1)                                # Working days

# ── LOGIC ─────────────────────────────────────────────────
=IFS(cond1,val1, cond2,val2, TRUE,default)
=IFERROR(formula, "Error message")

# ── DYNAMIC ARRAYS ────────────────────────────────────────
=FILTER(range, condition)
=SORT(range, col, -1)
=UNIQUE(range)
=SEQUENCE(n)
```

### 📐 Formula Anatomy Reference
```
= [FUNCTION] ( [argument1], [argument2], ... )
              ↑ required      ↑ optional (shown in [] in help)

Operators:    +  -  *  /  ^  &  =  <>  >  <  >=  <=
Wildcards:    *  (any chars)   ?  (one char)   ~  (escape)
```

### 🚨 Common Mistakes & Fixes
| Mistake | Fix |
|---------|-----|
| VLOOKUP returns wrong value | Check 4th arg: use `0` (exact match) |
| SUM returns 0 on numbers | Numbers stored as text → `VALUE()` or Data → Text to Columns |
| Formula not calculating | Calc mode set to manual → `F9` or Formulas → Calculate Now |
| `#N/A` in VLOOKUP | Wrap in `IFNA(VLOOKUP(...), "Not Found")` |
| Pivot Table not updating | Right-click → Refresh |
| Date shows as number | Format cell as Date (Ctrl+Shift+#) |
| Formula copies wrong | Check absolute/relative references — use `F4` |

### 📋 Data Analyst Workflow Checklist
```
□ 1. Raw data → Convert to Table (Ctrl+T)
□ 2. Clean text → TRIM + CLEAN
□ 3. Fix number-as-text → VALUE() or multiply by 1
□ 4. Check dates → ISNUMBER / reformat
□ 5. Flag duplicates → COUNTIF > 1
□ 6. Build lookups → XLOOKUP or INDEX+MATCH
□ 7. Aggregate → SUMIFS / COUNTIFS / AVERAGEIFS
□ 8. Summarize → PivotTable
□ 9. Visualize → Choose right chart type
□ 10. Protect → Data Validation + Locked formulas
```

---

## 📌 Function Reference Index

| Function | Category | Key Use |
|----------|----------|---------|
| `SUMIFS` | Math | Conditional sum, multiple criteria |
| `COUNTIFS` | Math | Conditional count |
| `XLOOKUP` | Lookup | Best modern lookup |
| `INDEX+MATCH` | Lookup | Flexible, works in all directions |
| `VLOOKUP` | Lookup | Legacy right-only lookup |
| `FILTER` | Dynamic | Filter rows by condition |
| `UNIQUE` | Dynamic | Remove duplicates |
| `SORT/SORTBY` | Dynamic | Sort arrays |
| `IFERROR` | Logic | Handle any error |
| `IFS` | Logic | Multi-condition without nesting |
| `TEXTJOIN` | Text | Join range with delimiter |
| `TEXT` | Text | Format values as text |
| `TRIM+CLEAN` | Text | Clean imported data |
| `DATEDIF` | Date | Age/duration calculation |
| `EOMONTH` | Date | Month-end dates |
| `NETWORKDAYS` | Date | Working days count |
| `SUMPRODUCT` | Math | Array math without CSE |
| `OFFSET` | Reference | Dynamic range (volatile) |
| `INDIRECT` | Reference | Dynamic sheet/cell reference |
| `GETPIVOTDATA` | Pivot | Extract from Pivot Table |

---

*📝 Last updated: 2026 | Excel versions: 2016, 2019, 2021, Microsoft 365*  
*✅ Tested formulas — copy-paste ready*  
*🔖 Star this repo for quick access during analysis work*