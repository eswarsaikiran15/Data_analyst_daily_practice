# 📊 Power BI Master Notes
### Complete Reference for Data Analysts & Power BI Developers

> **Covers:** Core Concepts • DAX Functions • Power Query (M) • Data Modeling • Visualizations • Row-Level Security • Performance Optimization • Interview Prep

---

## 📚 Table of Contents

1. [Power BI Architecture & Overview](#1-power-bi-architecture--overview)
2. [Power BI Desktop Components](#2-power-bi-desktop-components)
3. [Data Connectivity & Import Modes](#3-data-connectivity--import-modes)
4. [Power Query (M Language)](#4-power-query-m-language)
5. [Data Modeling](#5-data-modeling)
6. [DAX – Data Analysis Expressions](#6-dax--data-analysis-expressions)
   - [DAX Fundamentals](#61-dax-fundamentals)
   - [Aggregation Functions](#62-aggregation-functions)
   - [Filter Functions](#63-filter-functions)
   - [Time Intelligence Functions](#64-time-intelligence-functions)
   - [Logical Functions](#65-logical-functions)
   - [Text Functions](#66-text-functions)
   - [Date & Time Functions](#67-date--time-functions)
   - [Math & Statistical Functions](#68-math--statistical-functions)
   - [Information Functions](#69-information-functions)
   - [Table Functions](#610-table-functions)
   - [Relationship Functions](#611-relationship-functions)
   - [Iterator Functions (X Functions)](#612-iterator-functions-x-functions)
   - [Window Functions](#613-window-functions)
7. [Calculated Columns vs Measures](#7-calculated-columns-vs-measures)
8. [Visualizations & Chart Types](#8-visualizations--chart-types)
9. [Row-Level Security (RLS)](#9-row-level-security-rls)
10. [Power BI Service](#10-power-bi-service)
11. [Performance Optimization](#11-performance-optimization)
12. [DAX Studio & Profiling Tools](#12-dax-studio--profiling-tools)
13. [Power BI Deployment & Workspaces](#13-power-bi-deployment--workspaces)
14. [Advanced Topics](#14-advanced-topics)
15. [Quick Formula Cheat Sheet](#15-quick-formula-cheat-sheet)
16. [Interview Q&A](#16-interview-qa)

---

## 1. Power BI Architecture & Overview

### What is Power BI?
Power BI is a **business analytics tool** by Microsoft that provides interactive visualizations and business intelligence capabilities. It allows users to connect to hundreds of data sources, clean and transform data, create data models, and build dashboards/reports.

### Power BI Product Suite

| Component | Description |
|---|---|
| **Power BI Desktop** | Free Windows app for creating reports & models |
| **Power BI Service** | Cloud-based SaaS (app.powerbi.com) |
| **Power BI Mobile** | iOS / Android app for viewing reports |
| **Power BI Report Server** | On-premises report hosting |
| **Power BI Embedded** | Embed reports in custom apps (Azure) |
| **Power BI Gateway** | Bridge between on-premises data and cloud |

### Power BI Workflow
```
Data Sources → Power Query (ETL) → Data Model → DAX Measures → Visuals → Publish → Service → Share
```

### License Types

| License | Description |
|---|---|
| **Free** | Individual use, no sharing |
| **Pro** | Collaboration, workspaces, sharing |
| **Premium Per User (PPU)** | Advanced AI, paginated reports |
| **Premium Capacity (P SKU)** | Organization-wide, no per-user license for consumers |
| **Fabric** | Unified analytics platform (latest evolution) |

---

## 2. Power BI Desktop Components

### Three Views in Desktop

| View | Purpose |
|---|---|
| **Report View** | Build and arrange visuals on canvas |
| **Data View** | Browse and inspect data tables |
| **Model View** | Manage table relationships |

### Key Panels

- **Fields Pane** – All tables, columns, and measures
- **Visualizations Pane** – Chart types + formatting options
- **Filters Pane** – Visual, Page, Report-level filters
- **Properties Pane** – Format visual elements

---

## 3. Data Connectivity & Import Modes

### Storage Modes

| Mode | Description | Use Case |
|---|---|---|
| **Import** | Data loaded into Power BI's in-memory engine (VertiPaq) | Best performance, offline capable |
| **DirectQuery** | Queries sent live to source database | Always fresh data, large datasets |
| **Live Connection** | Read-only from SSAS/Azure AS/Power BI Dataset | Enterprise SSAS models |
| **Composite Model** | Mix of Import + DirectQuery in same model | Flexibility for hybrid scenarios |
| **Dual** | Table behaves as both Import and DirectQuery depending on context | Junction tables in composites |

### Import vs DirectQuery – Key Differences

| Aspect | Import | DirectQuery |
|---|---|---|
| Data freshness | Scheduled refresh | Always live |
| Performance | Fast (in-memory) | Depends on source |
| Data size limit | 1 GB (Pro), 400 GB (Premium) | No limit |
| DAX support | Full DAX | Limited DAX |
| Offline access | Yes | No |

### Common Data Sources
- **Files:** Excel (.xlsx), CSV, JSON, XML, PDF
- **Databases:** SQL Server, Oracle, MySQL, PostgreSQL, Snowflake
- **Cloud:** Azure SQL, Blob Storage, SharePoint, Dataverse
- **Online Services:** Salesforce, Google Analytics, Dynamics 365
- **Web:** Web scraping, REST APIs (OData)

### Scheduled Refresh
- Up to **8 refreshes/day** (Pro), **48 refreshes/day** (Premium)
- Requires **Gateway** for on-premises sources
- Incremental Refresh available in Premium for large tables

---

## 4. Power Query (M Language)

### What is Power Query?
Power Query is the **ETL (Extract, Transform, Load)** engine in Power BI. It uses the **M language** (functional, case-sensitive). Every transformation creates a step in the Applied Steps pane.

### Power Query Editor – Key Ribbon Tabs
- **Home** – Get data, close & apply, refresh
- **Transform** – Transpose, unpivot, data types, replace values
- **Add Column** – Custom column, conditional column, index column
- **View** – Formula bar, query settings, advanced editor

### M Language Basics

```m
// Basic structure of an M query
let
    Source = Excel.Workbook(File.Contents("C:\data.xlsx"), null, true),
    Sheet1 = Source{[Item="Sheet1",Kind="Sheet"]}[Data],
    PromotedHeaders = Table.PromoteHeaders(Sheet1),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"Date", type date},
        {"Sales", type number}
    })
in
    ChangedTypes
```

### Essential M Functions

#### Connecting to Data
```m
// Excel file
Excel.Workbook(File.Contents("path\file.xlsx"), null, true)

// CSV
Csv.Document(File.Contents("path\file.csv"), [Delimiter=",", Encoding=65001])

// SQL Server
Sql.Database("server_name", "database_name")

// Web / API
Web.Contents("https://api.example.com/data")

// SharePoint
SharePoint.Files("https://company.sharepoint.com/sites/data")
```

#### Table Functions
```m
// Remove columns
Table.RemoveColumns(table, {"Col1", "Col2"})

// Select/keep columns
Table.SelectColumns(table, {"Col1", "Col2"})

// Rename columns
Table.RenameColumns(table, {{"OldName", "NewName"}})

// Filter rows
Table.SelectRows(table, each [Status] = "Active")

// Add custom column
Table.AddColumn(table, "NewCol", each [Price] * [Qty])

// Change data types
Table.TransformColumnTypes(table, {{"Date", type date}, {"Amount", type number}})

// Merge queries (JOIN)
Table.NestedJoin(table1, {"Key"}, table2, {"Key"}, "NewCol", JoinKind.LeftOuter)

// Append queries (UNION)
Table.Combine({table1, table2})

// Group by
Table.Group(table, {"Category"}, {{"Total", each List.Sum([Sales]), type number}})

// Unpivot columns
Table.UnpivotOtherColumns(table, {"ID","Name"}, "Attribute", "Value")

// Pivot columns
Table.Pivot(table, List.Distinct(table[Month]), "Month", "Sales", List.Sum)

// Replace values
Table.ReplaceValue(table, "OldVal", "NewVal", Replacer.ReplaceText, {"ColumnName"})

// Remove duplicates
Table.Distinct(table)
// or
Table.Distinct(table, {"Column"})

// Sort
Table.Sort(table, {{"Column", Order.Ascending}})

// Fill down
Table.FillDown(table, {"Column"})

// Transpose
Table.Transpose(table)
```

#### Text Functions
```m
Text.Upper("hello")             // "HELLO"
Text.Lower("HELLO")             // "hello"
Text.Trim("  hello  ")          // "hello"
Text.Length("hello")            // 5
Text.Start("hello world", 5)    // "hello"
Text.End("hello world", 5)      // "world"
Text.Middle("hello world", 6, 5) // "world"
Text.Contains("hello", "ell")   // true
Text.Replace("hello", "l", "r") // "herro"
Text.Split("a,b,c", ",")        // {"a","b","c"}
Text.Combine({"a","b","c"}, ",") // "a,b,c"
```

#### Date Functions
```m
Date.Year(date)
Date.Month(date)
Date.Day(date)
Date.DayOfWeek(date)
Date.AddDays(date, 7)
Date.AddMonths(date, 1)
Date.From("2024-01-15")
DateTime.LocalNow()
```

#### List Functions
```m
List.Sum({1,2,3})               // 6
List.Average({1,2,3})           // 2
List.Max({1,2,3})               // 3
List.Min({1,2,3})               // 1
List.Count({1,2,3})             // 3
List.Distinct({1,1,2,3})        // {1,2,3}
List.Contains({1,2,3}, 2)       // true
List.Sort({3,1,2})              // {1,2,3}
List.First({1,2,3})             // 1
List.Last({1,2,3})              // 3
```

#### Conditional Logic
```m
// if-then-else
if [Status] = "Active" then "Yes" else "No"

// try-otherwise (error handling)
try Number.FromText([Value]) otherwise 0

// each shorthand for row-by-row
Table.SelectRows(table, each [Amount] > 100)
```

### Parameters in Power Query
```m
// Create a parameter (via Manage Parameters)
// Then use it:
let
    Source = Sql.Database(ServerName, DatabaseName)  // ServerName & DatabaseName are parameters
in
    Source
```

### Custom Functions
```m
// Define a custom function
let
    MyFunction = (x as number, y as number) as number =>
        x + y
in
    MyFunction

// Call it in another query
= MyFunction(5, 10)  // returns 15
```

---

## 5. Data Modeling

### What is a Data Model?
A data model defines **relationships between tables** and the structure used by DAX. Power BI uses **columnar in-memory storage (VertiPaq engine)** for Import mode.

### Schema Types

#### Star Schema ⭐ (Recommended)
```
               [Date Table]
                    |
[Product Table] — [Fact Sales Table] — [Customer Table]
                    |
              [Store Table]
```
- **Fact Table** – Contains numeric measures (Sales, Quantity, Revenue)
- **Dimension Tables** – Descriptive attributes (Customer, Product, Date, Geography)
- **Benefits:** Simple, fast, easy DAX, efficient VertiPaq compression

#### Snowflake Schema ❄️
- Dimension tables further normalized (e.g., Product → SubCategory → Category)
- More joins, slightly more complex but normalizes data

#### Galaxy Schema
- Multiple fact tables sharing dimension tables
- Also called "Fact Constellation"

### Relationships

#### Cardinality Types

| Type | Description | Example |
|---|---|---|
| **One-to-Many (1:*)** | Most common | 1 Customer → Many Orders |
| **Many-to-One (*:1)** | Same as above, reversed perspective | Many Orders → 1 Customer |
| **One-to-One (1:1)** | Rare, consider merging tables | Employee ↔ Employee Details |
| **Many-to-Many (*:*)** | Avoid if possible, complex | Products ↔ Orders (bridge table needed) |

#### Cross Filter Direction

| Direction | Description |
|---|---|
| **Single** | Filter flows one direction (Dimension → Fact) |
| **Both (Bidirectional)** | Filter flows both directions – use carefully |

> ⚠️ **Best Practice:** Use Single direction by default. Bidirectional can cause ambiguous filter paths and performance issues.

#### Active vs Inactive Relationships
- Only **one active relationship** can exist between two tables
- Multiple relationships allowed but all extra ones are **inactive**
- Use `USERELATIONSHIP()` in DAX to activate an inactive relationship

### Role-Playing Dimensions
A dimension used multiple times with a fact table (e.g., Date table for Order Date, Ship Date, Delivery Date).

```dax
// Example: Sales by Ship Date using inactive relationship
Sales by Ship Date = 
CALCULATE(
    [Total Sales],
    USERELATIONSHIP(Sales[ShipDate], 'Date'[Date])
)
```

### Date Table Best Practices
- **Always create a dedicated Date table** – required for Time Intelligence
- Mark it as a **Date Table** (Table Tools → Mark as date table)
- Must have a **contiguous range** of dates with no gaps
- Must have a **Date column of type Date**

#### Creating a Date Table in DAX
```dax
Date Table = 
ADDCOLUMNS(
    CALENDAR(DATE(2020,1,1), DATE(2026,12,31)),
    "Year",         YEAR([Date]),
    "Month Number", MONTH([Date]),
    "Month Name",   FORMAT([Date], "MMMM"),
    "Month Short",  FORMAT([Date], "MMM"),
    "Quarter",      "Q" & QUARTER([Date]),
    "Quarter No",   QUARTER([Date]),
    "Week Number",  WEEKNUM([Date]),
    "Day Name",     FORMAT([Date], "dddd"),
    "Day Short",    FORMAT([Date], "ddd"),
    "Day of Week",  WEEKDAY([Date], 2),
    "Is Weekend",   IF(WEEKDAY([Date], 2) >= 6, TRUE(), FALSE()),
    "Year-Month",   FORMAT([Date], "YYYY-MM"),
    "Fiscal Year",  IF(MONTH([Date]) >= 4, YEAR([Date]), YEAR([Date]) - 1)
)
```

### Model View Best Practices
- Hide foreign key columns from the report view
- Hide columns used only for relationships
- Organize tables into display folders
- Rename columns to user-friendly names in Power Query
- Create a dedicated `_Measures` table to organize all measures

---

## 6. DAX – Data Analysis Expressions

### 6.1 DAX Fundamentals

#### What is DAX?
DAX (Data Analysis Expressions) is a **formula language** used in Power BI, Power Pivot, and SSAS Tabular. It's used to create:
- **Calculated Columns** – New columns computed row-by-row
- **Measures** – Dynamic aggregations calculated at query time
- **Calculated Tables** – New tables derived from existing ones

#### DAX Syntax Rules
```dax
// Basic measure syntax
Measure Name = EXPRESSION

// Referencing columns: TableName[ColumnName]
Total Sales = SUM(Sales[Amount])

// Referencing measures: [MeasureName]
Profit Margin = DIVIDE([Profit], [Total Sales])

// DAX is NOT case-sensitive
// Comments: // single line,  /* multi line */
```

#### Evaluation Context – The Most Important DAX Concept

**Row Context**
- Exists when iterating row by row (calculated columns, iterator functions)
- Can access the value of a column in the current row

**Filter Context**
- The set of filters applied to a calculation
- Comes from: slicers, visual filters, row/column headers, CALCULATE() modifications

**Context Transition**
- When a measure is called from within an iterator (X function), row context is automatically converted to an equivalent filter context
- `CALCULATE()` triggers context transition explicitly

```dax
// Row context example (calculated column)
Profit = Sales[Revenue] - Sales[Cost]  // accesses current row

// Filter context example (measure)
Total Sales = SUM(Sales[Amount])  // sum filtered by report context

// CALCULATE changes filter context
NY Sales = CALCULATE(SUM(Sales[Amount]), Sales[State] = "New York")
```

---

### 6.2 Aggregation Functions

```dax
// SUM - adds numeric values
Total Revenue = SUM(Sales[Revenue])

// AVERAGE - arithmetic mean
Avg Order Value = AVERAGE(Sales[Amount])

// MIN / MAX
Earliest Sale = MIN(Sales[Date])
Highest Sale  = MAX(Sales[Amount])

// COUNT - counts rows with non-blank values
Num Transactions = COUNT(Sales[OrderID])

// COUNTA - counts non-blank values (any data type)
Num Customers = COUNTA(Customers[CustomerID])

// COUNTROWS - counts rows in a table
Total Orders = COUNTROWS(Sales)

// DISTINCTCOUNT - counts unique values
Unique Customers = DISTINCTCOUNT(Sales[CustomerID])

// COUNTBLANK - counts blank values
Missing Dates = COUNTBLANK(Sales[Date])
```

---

### 6.3 Filter Functions

#### CALCULATE – The Most Powerful DAX Function
```dax
// Syntax
CALCULATE(<expression>, <filter1>, <filter2>, ...)

// Basic usage
CA Sales = CALCULATE([Total Sales], Sales[State] = "California")

// Multiple filters (AND logic)
CA Electronics = CALCULATE([Total Sales], 
    Sales[State] = "California",
    Products[Category] = "Electronics"
)

// OR logic using IN or ||
Q1_Q2 Sales = CALCULATE([Total Sales], 
    Sales[Quarter] IN {1, 2}
)

// Remove all filters
All Sales = CALCULATE([Total Sales], ALL(Sales))

// Remove filter from one column
Sales All Regions = CALCULATE([Total Sales], ALL(Geography[Region]))
```

#### FILTER
```dax
// Returns a filtered table (used inside other functions)
High Value Orders = 
CALCULATE(
    [Total Sales],
    FILTER(Sales, Sales[Amount] > 1000)
)

// FILTER vs column filter in CALCULATE
// Prefer column filter for performance:
-- BETTER:
CALCULATE([Total Sales], Sales[State] = "CA")

-- SLOWER (use only when needed):
CALCULATE([Total Sales], FILTER(Sales, Sales[State] = "CA"))
```

#### ALL, ALLEXCEPT, ALLSELECTED
```dax
// ALL - removes ALL filters from table or column(s)
All Revenue = CALCULATE([Total Sales], ALL(Sales))

// All filters on a specific column removed
All Products Sales = CALCULATE([Total Sales], ALL(Products[Category]))

// ALLEXCEPT - removes filters from ALL columns EXCEPT specified ones
Sales All Dates = CALCULATE([Total Sales], ALLEXCEPT(Sales, Sales[Region]))

// ALLSELECTED - removes filters from the model but keeps slicer selections
Market Share = DIVIDE([Total Sales], CALCULATE([Total Sales], ALLSELECTED()))
```

#### KEEPFILTERS
```dax
// Keeps existing filter context and adds new filter (intersection)
CA_Filtered = CALCULATE([Total Sales], 
    KEEPFILTERS(Sales[State] = "California")
)
```

#### REMOVEFILTERS
```dax
// Alias for ALL when removing filters
Sales No Filter = CALCULATE([Total Sales], REMOVEFILTERS(Sales[Region]))
```

#### VALUES, DISTINCT, HASONEVALUE
```dax
// VALUES - returns unique values of a column (including blank if present)
Selected Region = IF(HASONEVALUE(Geography[Region]), VALUES(Geography[Region]), "Multiple")

// DISTINCT - returns unique values (excludes blank)
Unique Products Table = DISTINCT(Products[ProductName])

// HASONEVALUE - TRUE if exactly one value is filtered
Region Label = IF(HASONEVALUE(Geography[Region]), VALUES(Geography[Region]), "All Regions")

// SELECTEDVALUE - returns the single selected value or alternate result
Selected Cat = SELECTEDVALUE(Products[Category], "All Categories")
```

---

### 6.4 Time Intelligence Functions

> ⚠️ **Prerequisite:** A proper Date Table marked as Date Table, with continuous dates, is required for ALL time intelligence functions.

#### Year-To-Date, Quarter-To-Date, Month-To-Date
```dax
// Year-To-Date
Sales YTD = TOTALYTD([Total Sales], 'Date'[Date])

// With custom fiscal year end
Fiscal YTD = TOTALYTD([Total Sales], 'Date'[Date], "03/31")  // April fiscal year

// Quarter-To-Date
Sales QTD = TOTALQTD([Total Sales], 'Date'[Date])

// Month-To-Date
Sales MTD = TOTALMTD([Total Sales], 'Date'[Date])

// Alternative using DATESYTD
Sales YTD2 = CALCULATE([Total Sales], DATESYTD('Date'[Date]))
Sales YTD3 = CALCULATE([Total Sales], DATESYTD('Date'[Date], "03/31"))  // fiscal

// Quarter-To-Date alternative
Sales QTD2 = CALCULATE([Total Sales], DATESQTD('Date'[Date]))

// Month-To-Date alternative
Sales MTD2 = CALCULATE([Total Sales], DATESMTD('Date'[Date]))
```

#### Previous Period Comparisons
```dax
// Previous Year
Sales PY = CALCULATE([Total Sales], PREVIOUSYEAR('Date'[Date]))

// Previous Quarter
Sales PQ = CALCULATE([Total Sales], PREVIOUSQUARTER('Date'[Date]))

// Previous Month
Sales PM = CALCULATE([Total Sales], PREVIOUSMONTH('Date'[Date]))

// Previous Day
Sales PD = CALCULATE([Total Sales], PREVIOUSDAY('Date'[Date]))

// Year-over-Year Growth
YoY Growth = [Total Sales] - [Sales PY]
YoY Growth % = DIVIDE([YoY Growth], [Sales PY])

// Same Period Last Year
Sales SPLY = CALCULATE([Total Sales], SAMEPERIODLASTYEAR('Date'[Date]))
```

#### Date Shifting (DATEADD)
```dax
// Shift dates by any interval
Sales Last 3 Months = CALCULATE([Total Sales], DATEADD('Date'[Date], -3, MONTH))
Sales Next Year = CALCULATE([Total Sales], DATEADD('Date'[Date], 1, YEAR))
Sales -7 Days = CALCULATE([Total Sales], DATEADD('Date'[Date], -7, DAY))
```

#### Running Totals
```dax
// Running Total (Cumulative)
Running Sales = 
CALCULATE(
    [Total Sales],
    DATESYTD('Date'[Date])
)

// Running Total across all time
Cumulative Sales = 
CALCULATE(
    [Total Sales],
    FILTER(
        ALL('Date'),
        'Date'[Date] <= MAX('Date'[Date])
    )
)
```

#### Date Range Functions
```dax
// Returns dates between two dates
Between Dates = CALCULATE([Total Sales], 
    DATESBETWEEN('Date'[Date], DATE(2024,1,1), DATE(2024,3,31))
)

// Returns dates in period
In Period = CALCULATE([Total Sales], 
    DATESINPERIOD('Date'[Date], TODAY(), -30, DAY)
)

// Last N days
Last 30 Days Sales = CALCULATE([Total Sales], 
    DATESINPERIOD('Date'[Date], MAX('Date'[Date]), -30, DAY)
)

// Last N months
Last 3 Months = CALCULATE([Total Sales], 
    DATESINPERIOD('Date'[Date], MAX('Date'[Date]), -3, MONTH)
)
```

#### PARALLELPERIOD
```dax
// Same period in a shifted timeframe (full period, not partial like DATEADD)
Sales Last Year Full = CALCULATE([Total Sales], PARALLELPERIOD('Date'[Date], -1, YEAR))
Sales Last Quarter = CALCULATE([Total Sales], PARALLELPERIOD('Date'[Date], -1, QUARTER))
```

---

### 6.5 Logical Functions

```dax
// IF
Status = IF([Profit] > 0, "Profitable", "Loss")

// Nested IF
Grade = 
IF([Score] >= 90, "A",
   IF([Score] >= 80, "B",
      IF([Score] >= 70, "C", "F")
   )
)

// SWITCH (cleaner alternative to nested IF)
Grade = 
SWITCH(
    TRUE(),
    [Score] >= 90, "A",
    [Score] >= 80, "B",
    [Score] >= 70, "C",
    "F"  -- default
)

// SWITCH with exact match
Region Code = 
SWITCH(
    [Region],
    "North", "N",
    "South", "S",
    "East",  "E",
    "West",  "W",
    "Unknown"
)

// AND, OR, NOT
Is Active Senior = AND([Age] > 60, [Status] = "Active")
Is Excluded = OR([Status] = "Inactive", ISBLANK([Email]))
Not Blank = NOT(ISBLANK([Value]))

// IFERROR - handle errors
Safe Divide = IFERROR([Revenue] / [Units], 0)

// ISERROR
Has Error = ISERROR(DIVIDE([Revenue],[Units]))
```

---

### 6.6 Text Functions

```dax
// CONCATENATE - join two strings
Full Name = CONCATENATE([FirstName], CONCATENATE(" ", [LastName]))

// CONCATENATEX - join values from multiple rows
All Products = CONCATENATEX(Products, Products[ProductName], ", ")

// & operator (easier concatenation)
Full Name2 = [FirstName] & " " & [LastName]

// LEFT, RIGHT, MID
First 3 = LEFT([Code], 3)
Last 4 = RIGHT([PhoneNumber], 4)
Middle = MID([Text], 5, 3)   // start at pos 5, length 3

// LEN
Code Length = LEN([Code])

// UPPER, LOWER, PROPER
Upper = UPPER([Name])
Lower = LOWER([Email])
Proper = PROPER([Name])   // Title Case

// TRIM - remove leading/trailing spaces
Clean Name = TRIM([Name])

// SUBSTITUTE - replace text
Clean Phone = SUBSTITUTE(SUBSTITUTE([Phone], "-", ""), " ", "")

// REPLACE - replace at position
New Code = REPLACE([Code], 1, 2, "XX")

// FIND, SEARCH (SEARCH is case-insensitive)
Position = FIND("@", [Email])
Position2 = SEARCH("hello", [Text])   -- case-insensitive

// CONTAINSSTRING (case-insensitive)
Has Email = CONTAINSSTRING([Contact], "@")

// FORMAT - convert to text with format
Formatted Date = FORMAT([Date], "DD/MM/YYYY")
Formatted Number = FORMAT([Revenue], "$#,##0.00")
Month Name = FORMAT([Date], "MMMM")
Month Short = FORMAT([Date], "MMM YYYY")

// VALUE - convert text to number
Num Value = VALUE([TextNumber])

// FIXED
Rounded Text = FIXED([Number], 2, FALSE)  -- FALSE = with comma separator
```

---

### 6.7 Date & Time Functions

```dax
// TODAY, NOW
Today = TODAY()
Now = NOW()

// DATE - create a date
MyDate = DATE(2024, 6, 15)

// YEAR, MONTH, DAY
Year = YEAR([Date])
Month = MONTH([Date])
Day = DAY([Date])

// HOUR, MINUTE, SECOND
Hour = HOUR([DateTime])
Min = MINUTE([DateTime])
Sec = SECOND([DateTime])

// WEEKDAY - day of week (1=Sunday by default)
DayNum = WEEKDAY([Date])             // 1=Sun, 7=Sat
DayNum2 = WEEKDAY([Date], 2)         // 1=Mon, 7=Sun (ISO)

// WEEKNUM
WeekNo = WEEKNUM([Date])

// EOMONTH - end of month
End of Month = EOMONTH([Date], 0)    // 0 = current month
Next Month End = EOMONTH([Date], 1)  // 1 = next month

// DATEDIFF - difference between dates
Days Between = DATEDIFF([StartDate], [EndDate], DAY)
Months Between = DATEDIFF([StartDate], [EndDate], MONTH)
Years Between = DATEDIFF([StartDate], [EndDate], YEAR)

// DATEVALUE - text to date
MyDate2 = DATEVALUE("2024-06-15")

// CALENDAR - generate date range table
MyCalendar = CALENDAR(DATE(2020,1,1), DATE(2026,12,31))

// CALENDARAUTO - auto-detect range from model
AutoCal = CALENDARAUTO()

// QUARTER
Qtr = QUARTER([Date])

// EDATE - n months from date
ThreeMonthsLater = EDATE([Date], 3)
```

---

### 6.8 Math & Statistical Functions

```dax
// Basic arithmetic
ABS(-5)             // 5
SQRT(16)            // 4
POWER(2, 10)        // 1024
MOD(10, 3)          // 1 (remainder)
QUOTIENT(10, 3)     // 3 (integer division)
SIGN(-5)            // -1 (negative), 0 (zero), 1 (positive)

// Rounding
ROUND(3.567, 2)     // 3.57
ROUNDUP(3.1, 0)     // 4
ROUNDDOWN(3.9, 0)   // 3
FLOOR(3.7, 1)       // 3
CEILING(3.1, 1)     // 4
INT(3.9)            // 3
TRUNC(3.9)          // 3

// DIVIDE - safe division (no division by zero error)
Safe Div = DIVIDE([Revenue], [Units])         // returns BLANK() if divisor = 0
Safe Div2 = DIVIDE([Revenue], [Units], 0)     // returns 0 if divisor = 0

// Statistical
AVERAGE(column)
MEDIAN(column)
GEOMEAN(column)      // Geometric mean
VAR.S(column)        // Sample variance
VAR.P(column)        // Population variance
STDEV.S(column)      // Sample standard deviation
STDEV.P(column)      // Population standard deviation

// PERCENTILE
Top 90 = PERCENTILEX.INC(Sales, Sales[Amount], 0.9)

// RANK
// Use RANKX for ranking in measures (see Table Functions)

// LOG, EXP
Log10 = LOG10(100)         // 2
LogN = LOG(100, 10)        // 2
NaturalLog = LN([Value])
Exp = EXP(1)               // e = 2.718...

// PI, RAND, RANDBETWEEN
Pi = PI()
Random = RAND()                // 0 to 1
RandInt = RANDBETWEEN(1, 100)  // integer between 1 and 100

// MAX, MIN with multiple args
MaxVal = MAX(5, 10)         // 10
MinVal = MIN(5, 10)         // 5
```

---

### 6.9 Information Functions

```dax
// ISBLANK
Has No Email = ISBLANK([Email])
Default Email = IF(ISBLANK([Email]), "N/A", [Email])

// ISNUMBER, ISTEXT, ISLOGICAL, ISDATE
Is Num = ISNUMBER([Value])
Is Txt = ISTEXT([Name])
Is Date = ISDATE([Date])

// ISERROR
Has Err = ISERROR([Calculation])

// IFERROR
Safe Calc = IFERROR([Risky Calculation], 0)

// CONTAINS - check if table contains a row matching condition
Has VIP = CONTAINS(Customers, Customers[Tier], "VIP")

// CONTAINSROW - row exists in table
Exists = CONTAINSROW(
    SELECTCOLUMNS(Products, "Cat", Products[Category]),
    "Electronics"
)

// USERNAME / USERPRINCIPALNAME - for RLS
Current User = USERPRINCIPALNAME()    // "user@company.com"
User Name = USERNAME()                // "DOMAIN\username"

// HASONEFILTER / HASONEVALUE
Single Selected = HASONEFILTER(Products[Category])

// ISFILTERED
Is Filtered = ISFILTERED(Products[Category])

// ISCROSSFILTERED
Is Cross = ISCROSSFILTERED(Products[Category])

// COLUMNSTATISTICS (DAX meta)
// Used in DAX Studio for profiling

// BLANK, ISBLANK
Empty = BLANK()
Check = ISBLANK([Value])
```

---

### 6.10 Table Functions

#### SUMMARIZE
```dax
// Group by and aggregate
Sales Summary = 
SUMMARIZE(
    Sales,
    Sales[Region],
    Products[Category],
    "Total Sales", SUM(Sales[Amount]),
    "Avg Sale", AVERAGE(Sales[Amount])
)
```

#### ADDCOLUMNS
```dax
// Add calculated columns to a table expression
Extended Table = 
ADDCOLUMNS(
    Sales,
    "Profit", Sales[Revenue] - Sales[Cost],
    "Year", YEAR(Sales[Date])
)
```

#### SUMMARIZECOLUMNS
```dax
// More efficient version of SUMMARIZE for measures
Sales by Region = 
SUMMARIZECOLUMNS(
    Sales[Region],
    Products[Category],
    "Total", [Total Sales],
    "Units", [Total Units]
)
```

#### SELECTCOLUMNS
```dax
// Choose specific columns (like SELECT in SQL)
Name Email Table = 
SELECTCOLUMNS(
    Customers,
    "Name", Customers[FullName],
    "Email", Customers[Email]
)
```

#### UNION / INTERSECT / EXCEPT
```dax
// UNION - combine tables (all rows)
Combined = UNION(Table1, Table2)

// INTERSECT - rows in both tables
Common = INTERSECT(Table1, Table2)

// EXCEPT - rows in Table1 not in Table2
Unique = EXCEPT(Table1, Table2)
```

#### CROSSJOIN
```dax
// Cartesian product of two tables
All Combos = CROSSJOIN(
    DISTINCT(Products[Category]),
    DISTINCT(Geography[Region])
)
```

#### TOPN
```dax
// Top N rows by measure
Top 5 Customers = 
TOPN(5, Customers, [Total Sales], DESC)

// Used inside CALCULATE
Top 5 Sales = CALCULATE([Total Sales], TOPN(5, Customers, [Total Sales], DESC))
```

#### RANKX
```dax
// Rank customers by sales
Customer Rank = 
RANKX(
    ALL(Customers[CustomerName]),
    [Total Sales],
    ,
    DESC,
    Dense    // Dense = no gaps in rank (1,2,2,3), Skip = skips (1,2,2,4)
)
```

#### GENERATE / GENERATEALL
```dax
// Cross join where second table depends on first
Expanded = GENERATE(
    Category,
    TOPN(3, FILTER(Products, Products[CategoryID] = EARLIER(Category[CategoryID])), Products[Price], DESC)
)
```

#### ROW
```dax
// Creates a single-row table
Single Row = ROW("Sales", [Total Sales], "Date", TODAY())
```

#### DATATABLE
```dax
// Create a static data table
MyTable = DATATABLE(
    "Product", STRING,
    "Price", CURRENCY,
    {
        {"Apple", 1.50},
        {"Banana", 0.75},
        {"Cherry", 3.00}
    }
)
```

#### NATURALINNERJOIN / NATURALLEFTOUTERJOIN
```dax
// Join two tables on matching column names
Joined = NATURALINNERJOIN(Sales, Products)
Left Join = NATURALLEFTOUTERJOIN(Sales, Products)
```

---

### 6.11 Relationship Functions

```dax
// RELATED - access a column from the ONE side in a Many-to-one relationship
// (used in calculated columns on the MANY side)
Category = RELATED(Products[Category])

// RELATEDTABLE - access all matching rows from the MANY side
// (used in calculated columns on the ONE side)
Order Count = COUNTROWS(RELATEDTABLE(Orders))

// USERELATIONSHIP - activate an inactive relationship
Sales by Ship Date = 
CALCULATE(
    [Total Sales],
    USERELATIONSHIP(Sales[ShipDate], 'Date'[Date])
)

// CROSSFILTER - change cross-filter direction
Reversed Filter = 
CALCULATE(
    [Total Sales],
    CROSSFILTER(Sales[ProductID], Products[ProductID], Both)
)

// TREATAS - treat a table/column as if it filters another column
Virtual Relationship = 
CALCULATE(
    [Total Sales],
    TREATAS({"Electronics", "Clothing"}, Products[Category])
)
```

---

### 6.12 Iterator Functions (X Functions)

Iterator functions **iterate row by row** over a table, evaluate an expression for each row, and aggregate the result.

```dax
// SUMX - sum of expression evaluated per row
Total Revenue = SUMX(Sales, Sales[Quantity] * Sales[UnitPrice])

// AVERAGEX - average of row-by-row expression
Avg Profit Margin = AVERAGEX(Products, DIVIDE(Products[Profit], Products[Revenue]))

// MAXX / MINX - max/min of row-by-row expression
Max Daily Sales = MAXX(
    SUMMARIZE(Sales, 'Date'[Date], "Daily", SUM(Sales[Amount])),
    [Daily]
)

// COUNTX - count rows where expression is non-blank
Orders with Discount = COUNTX(Sales, IF(Sales[Discount] > 0, 1, BLANK()))

// RANKX (see Table Functions above)

// CONCATENATEX - concatenate row-by-row
All Regions = CONCATENATEX(
    VALUES(Geography[Region]),
    Geography[Region],
    ", ",
    Geography[Region],
    ASC
)

// PRODUCTX - product of all row values
Total Product = PRODUCTX(Sales, Sales[Factor])

// MEDIANX - median of row-by-row expression
Median Margin = MEDIANX(Products, Products[Margin])

// PERCENTILEX.INC / PERCENTILEX.EXC
P90 Sales = PERCENTILEX.INC(Sales, Sales[Amount], 0.9)

// GEOMEANX - geometric mean
GeoMean = GEOMEANX(Sales, Sales[GrowthRate])
```

---

### 6.13 Window Functions

*(Available from Power BI November 2022 / DAX 2022+)*

```dax
// INDEX - returns value at absolute or relative position
First Month Sales = INDEX(1, ALLSELECTED('Date'[YearMonth]), ORDERBY('Date'[YearMonth], ASC), PARTITIONBY(), [Total Sales])

// OFFSET - returns value relative to current row
Previous Month Sales = OFFSET(-1, ALLSELECTED('Date'[YearMonth]), ORDERBY('Date'[YearMonth], ASC), PARTITIONBY(), [Total Sales])

// WINDOW - running aggregation over a range
Running Total = WINDOW(1, ABS, 0, REL, ALLSELECTED('Date'[YearMonth]), ORDERBY('Date'[YearMonth], ASC), PARTITIONBY(), [Total Sales])

// RANK (window) - same as RANKX but for window context
Sales Rank = RANK(DENSE, ALLSELECTED(Products[Product]), ORDERBY([Total Sales], DESC))
```

---

## 7. Calculated Columns vs Measures

| Aspect | Calculated Column | Measure |
|---|---|---|
| **When Evaluated** | At data refresh time | At query time |
| **Storage** | Stored in the model | Not stored |
| **Context** | Row context | Filter context |
| **Memory** | Uses model memory | No memory overhead |
| **Use In** | Slicers, rows, filters | Values area of visuals |
| **RELATED()** | ✅ Can use | ❌ Cannot use |
| **Performance** | Increases model size | Dynamic, may be slow if complex |

### When to Use Each

**Use Calculated Columns when:**
- You need the value in a slicer or filter
- You need to use it as a row-level grouping attribute
- The computation involves row-level logic (e.g., `IF([Status] = "Active", 1, 0)`)

**Use Measures when:**
- Aggregating data (SUM, AVERAGE, etc.)
- The result depends on the filter context (dynamic)
- You're computing KPIs, ratios, percentages
- Working with time intelligence

```dax
// BAD: SUM as calculated column (wrong!)
-- Total Sales (Column) = SUM(Sales[Amount])  ❌ This is wrong

// GOOD: Calculated column for categorization
Price Band = IF(Products[Price] > 100, "High", "Low")  ✅

// GOOD: Measure for aggregation
Total Sales = SUM(Sales[Amount])  ✅
```

---

## 8. Visualizations & Chart Types

### Core Visuals

| Visual | Best For | Key Fields |
|---|---|---|
| **Bar/Column Chart** | Comparisons across categories | Axis, Values, Legend |
| **Line Chart** | Trends over time | Axis (Date), Values |
| **Pie/Donut Chart** | Part-to-whole (max 5-7 slices) | Legend, Values |
| **Area Chart** | Volume trends over time | Axis, Values |
| **Scatter Chart** | Correlation between two measures | X-axis, Y-axis, Details |
| **Treemap** | Hierarchical proportions | Group, Values |
| **Funnel** | Process stages / conversion | Category, Values |
| **Waterfall** | Running totals / variance | Category, Breakdown, Y-axis |
| **Gauge** | Progress towards a target | Value, Min, Max, Target |
| **Card** | Single KPI | Fields |
| **Multi-row Card** | Multiple KPIs | Fields |
| **Table** | Raw data tabular view | Columns |
| **Matrix** | Pivot table / drill-down | Rows, Columns, Values |
| **Map / Filled Map** | Geographical data | Location, Size, Color |
| **Slicer** | Interactive filters | Field |
| **KPI** | Target vs Actual trend | Indicator, Trend Axis, Target |
| **Ribbon Chart** | Rank change over time | Axis, Legend, Values |
| **Decomposition Tree** | AI-driven drill-down analysis | Analyze, Explain by |
| **Q&A Visual** | Natural language query | — |
| **Smart Narrative** | Auto-generated text summary | — |
| **Key Influencers** | What factors drive a metric | Analyze, Explain by |
| **Paginated Report** | Pixel-perfect, printable reports | — |

### Visual Interactions
- Click a visual → affects other visuals by default (cross-filter/highlight)
- **Edit Interactions:** Format → Edit Interactions → choose Filter, Highlight, or None
- **Drill Down:** Available when hierarchy exists in axis field
- **Drill Through:** Right-click on a data point → navigate to detail page
- **Bookmarks:** Save visual state (filter selections, visibility, position)
- **Tooltip Page:** Create a report page designated as tooltip for rich hover info

### Conditional Formatting
Available for: Background color, Font color, Data bars, Icons, Web URL

```
Format Visual → select measure → conditional formatting rules or field values
```

### Small Multiples
Repeat the same visual for each value of a category (like faceting). Add a field to the "Small Multiples" well.

---

## 9. Row-Level Security (RLS)

### What is RLS?
Row-Level Security restricts data access at the **row level** for different users. Defined in Power BI Desktop, managed in Power BI Service.

### Static RLS
```dax
// Fixed filter – all users in this role see only "North" region
[Region] = "North"

// Or using IN
[Region] IN {"North", "East"}
```

### Dynamic RLS
```dax
// Each user sees only their own data
[Email] = USERPRINCIPALNAME()

// Or with a mapping table
[Region] = LOOKUPVALUE(
    RegionAccess[Region],
    RegionAccess[Email], USERPRINCIPALNAME()
)

// Alternative with CONTAINS
CONTAINS(
    FILTER(UserRegionMap, UserRegionMap[Email] = USERPRINCIPALNAME()),
    UserRegionMap[Region],
    [Region]
)
```

### Manager Hierarchy (OBI-style Dynamic RLS)
```dax
// User sees their own data + all subordinates
[EmployeeEmail] IN
SELECTCOLUMNS(
    PATH_BASED_FUNCTION_TABLE,  -- use PATHCONTAINS with org hierarchy
    "Email", ...
)

// Using PATHCONTAINS for hierarchies
PATHCONTAINS(
    LOOKUPVALUE(Employees[ManagerPath], Employees[Email], USERPRINCIPALNAME()),
    [EmployeeID]
)
```

### RLS Steps
1. **Desktop:** Modeling tab → Manage Roles → Create role → Add DAX filter
2. **Desktop:** Modeling → View As Roles (test it)
3. **Publish** to Power BI Service
4. **Service:** Dataset → Security → Assign members to roles
5. Members see only rows that pass the DAX filter

### Object-Level Security (OLS)
- Hides entire **columns or tables** from specific roles
- Configured via Tabular Editor or XMLA endpoint
- Users see a blank instead of the column if they don't have access

---

## 10. Power BI Service

### Key Service Features

| Feature | Description |
|---|---|
| **Workspaces** | Collaborative containers for reports, datasets, dashboards |
| **Dashboards** | Pinned tiles from reports; single-page overview |
| **Reports** | Multi-page, interactive reports |
| **Datasets (Semantic Models)** | The data model behind reports |
| **Dataflows** | Reusable ETL/Power Query in the cloud |
| **Datamarts** | Self-service, fully managed SQL database (Premium) |
| **Apps** | Bundled workspace content shared to users |
| **Lineage View** | Visual map of data flow and dependencies |
| **Deployment Pipelines** | Dev → Test → Production promotion |

### Sharing & Collaboration

| Method | Description |
|---|---|
| **Share Report** | Direct share with specific users/groups |
| **Workspace Access** | Admin, Member, Contributor, Viewer roles |
| **App** | Package and distribute to broad audience |
| **Publish to Web** | Public embed (no authentication – use carefully!) |
| **Embed in SharePoint** | Secure embed in SharePoint pages |
| **Export** | PDF, PowerPoint, Excel, CSV |

### Gateway Types

| Gateway | Use Case |
|---|---|
| **On-premises Data Gateway (Standard)** | Multiple users, enterprise use |
| **On-premises Data Gateway (Personal mode)** | Single user, no sharing |

### Scheduled Refresh Setup
1. Publish dataset to service
2. Settings → Datasets → Scheduled refresh
3. Configure data source credentials
4. Set refresh frequency and time
5. Configure failure notification email

### Incremental Refresh (Premium)
```
// Define RangeStart and RangeEnd parameters in Power Query (type Date/Time/Timezone)
// Filter table by these parameters
// Configure incremental refresh policy in Desktop → right-click table
```

---

## 11. Performance Optimization

### Model Optimization

| Tip | Reason |
|---|---|
| Remove unnecessary columns | Reduces model size; VertiPaq compresses by column |
| Remove unnecessary rows | Less data = faster |
| Use star schema | Simpler relationships = faster filter propagation |
| Avoid calculated columns when measure works | Columns stored in memory |
| Use integers for keys, not text | Better compression |
| Keep high-cardinality text columns minimal | Poor VertiPaq compression |
| Disable Auto Date/Time | Removes hidden date tables |
| Set correct data types | Smaller storage footprint |

### DAX Optimization

| Tip | Reason |
|---|---|
| Prefer column filters over FILTER() in CALCULATE | Column filters are pushed to storage engine |
| Avoid row-by-row FILTER over large tables | Expensive formula engine work |
| Use DIVIDE() instead of `/` | Avoids division by zero errors cleanly |
| Use variables (VAR) | Evaluates expression once, reuses result |
| Avoid circular dependencies | Causes errors |
| Avoid bidirectional relationships | Can cause unexpected filter paths |

### Using Variables in DAX
```dax
// Variables make DAX readable and faster (expression evaluated once)
Profit Margin = 
VAR TotalRevenue = SUM(Sales[Revenue])
VAR TotalCost = SUM(Sales[Cost])
VAR Profit = TotalRevenue - TotalCost
RETURN
    DIVIDE(Profit, TotalRevenue)

// Complex example
Dynamic Title = 
VAR SelCategory = SELECTEDVALUE(Products[Category], "All")
VAR TotalSales = [Total Sales]
VAR PrevYearSales = [Sales PY]
VAR Growth = DIVIDE(TotalSales - PrevYearSales, PrevYearSales)
RETURN
    SelCategory & " | Sales: " & FORMAT(TotalSales, "$#,##0") & 
    " | YoY: " & FORMAT(Growth, "0.0%")
```

### VertiPaq Engine Understanding
- **Storage Engine (SE):** Handles data storage and scan queries (highly parallel, fast)
- **Formula Engine (FE):** Handles complex DAX, not parallel, slower
- Goal: Push as much work to **SE** as possible
- SE-friendly: Simple aggregations, column-level filters, relationships
- FE-heavy: Complex FILTER() with row context, EARLIER(), nested iterators

### Performance Analyzer
- View tab → Performance Analyzer
- Records DAX query, Visual display, and Other durations
- Click "Copy Query" to test in DAX Studio

---

## 12. DAX Studio & Profiling Tools

### DAX Studio
- Free tool: daxstudio.org
- Connect to Power BI Desktop or SSAS
- Run DAX queries, view execution plan, server timings

```dax
-- Query syntax in DAX Studio
EVALUATE
    SUMMARIZECOLUMNS(
        Products[Category],
        "Total Sales", [Total Sales]
    )
ORDER BY [Total Sales] DESC

-- Define measures for testing
DEFINE
    MEASURE Sales[Test Measure] = CALCULATE(SUM(Sales[Amount]), Sales[Region] = "North")
EVALUATE
    {[Test Measure]}
```

### Tabular Editor
- Edit model metadata, create measures in bulk, manage RLS
- Free version: Tabular Editor 2 (open source)
- Advanced: Tabular Editor 3 (paid)

### Power BI Helper / Metadata Tools
- Vertipaq Analyzer: Analyze column and table sizes
- ALM Toolkit: Compare and merge Power BI models

---

## 13. Power BI Deployment & Workspaces

### Deployment Pipeline (Dev → Test → Prod)
```
[Development Workspace] → [Test Workspace] → [Production Workspace]
         ↓                        ↓                     ↓
    Developers            QA Testing              End Users
```

**Steps:**
1. Create pipeline in Power BI Service
2. Assign workspaces to each stage
3. Deploy from Dev → Test → Prod
4. Use deployment rules to parameterize data sources per stage

### Workspace Roles

| Role | Can Publish | Can Edit | Can View | Can Add Members |
|---|---|---|---|---|
| **Admin** | ✅ | ✅ | ✅ | ✅ |
| **Member** | ✅ | ✅ | ✅ | ❌ |
| **Contributor** | ✅ | ✅ | ✅ | ❌ |
| **Viewer** | ❌ | ❌ | ✅ | ❌ |

### Apps
- Created from workspaces
- Customizable navigation (hide/show specific reports)
- Published to: Entire org, specific users/groups
- Updated independently of underlying reports

---

## 14. Advanced Topics

### Composite Models
- Mix Import and DirectQuery tables in one model
- Import dimension tables (fast slicing), DirectQuery fact table (always fresh)
- Requires careful relationship management

### Field Parameters *(November 2022)*
- Create a calculated table that users can switch dynamically to change what's shown on an axis or in values
```dax
// Field Parameter table (created via Modeling → New Parameter → Fields)
// Auto-generates something like:
Metric Selector = {
    ("Sales", NAMEOF('Sales'[Total Sales]), 0),
    ("Profit", NAMEOF('Sales'[Total Profit]), 1),
    ("Units", NAMEOF('Sales'[Total Units]), 2)
}
```

### Calculation Groups *(via Tabular Editor)*
- Create reusable calculation logic (e.g., YTD, PY, Growth%) applicable to any measure
- Define **Calculation Items** that modify measures without writing separate measures
- Applied via slicer selection

### DAX Query View *(2024)*
- Native DAX query editor inside Power BI Desktop
- Run DAX queries, debug measures, view data

### Aggregations (Pre-aggregated tables)
- Create summary tables (aggregated fact tables)
- Power BI auto-routes queries to aggregation table when possible
- Massively speeds up large DirectQuery models

### Hybrid Tables (Incremental Refresh + DirectQuery partition)
- Historical data in Import mode
- Recent data partition in DirectQuery
- Always fresh recent data + fast historical queries

### Power BI REST API
```
// Common endpoints:
GET  /v1.0/myorg/groups                          // List workspaces
GET  /v1.0/myorg/groups/{id}/reports             // List reports
POST /v1.0/myorg/groups/{id}/datasets/{id}/refreshes  // Trigger refresh
GET  /v1.0/myorg/groups/{id}/datasets/{id}/tables/{id}/rows  // Get rows
```

### Embed Token & Embedded Analytics
- **Power BI Embedded (Azure)** – Embed in custom apps without Power BI Pro licenses
- Token types: Embed token (app owns data), User token (user owns data)
- SKUs: A1–A8 (Azure), EM1–EM3 (Office 365), P1–P5 (Premium)

### Paginated Reports (Power BI Report Builder)
- Pixel-perfect, print-ready reports
- Uses RDLC format, SQL/DAX data sources
- Best for: invoices, statements, formatted documents
- Available with: Premium, PPU, Pro (service only)

---

## 15. Quick Formula Cheat Sheet

### Most Used DAX Patterns

```dax
/* ── BASIC AGGREGATIONS ── */
Total Sales     = SUM(Sales[Amount])
Total Qty       = SUM(Sales[Quantity])
Avg Sale        = AVERAGE(Sales[Amount])
Total Orders    = COUNTROWS(Sales)
Unique Cust     = DISTINCTCOUNT(Sales[CustomerID])

/* ── RATIO / PERCENTAGE ── */
Margin %        = DIVIDE([Gross Profit], [Total Sales], 0)
% of Total      = DIVIDE([Total Sales], CALCULATE([Total Sales], ALL(Products)))
% of Parent     = DIVIDE([Total Sales], CALCULATE([Total Sales], ALLSELECTED(Products[Category])))

/* ── TIME INTELLIGENCE ── */
Sales YTD       = TOTALYTD([Total Sales], 'Date'[Date])
Sales MTD       = TOTALMTD([Total Sales], 'Date'[Date])
Sales QTD       = TOTALQTD([Total Sales], 'Date'[Date])
Sales LY        = CALCULATE([Total Sales], SAMEPERIODLASTYEAR('Date'[Date]))
Sales PM        = CALCULATE([Total Sales], PREVIOUSMONTH('Date'[Date]))
YoY %           = DIVIDE([Total Sales] - [Sales LY], [Sales LY])
MoM %           = DIVIDE([Total Sales] - [Sales PM], [Sales PM])

/* ── RANKING ── */
Rank            = RANKX(ALL(Products[Product]), [Total Sales],, DESC, DENSE)

/* ── RUNNING TOTALS ── */
Cum Sales       = CALCULATE([Total Sales], DATESYTD('Date'[Date]))
Running Total   = CALCULATE([Total Sales], FILTER(ALL('Date'), 'Date'[Date] <= MAX('Date'[Date])))

/* ── DYNAMIC TITLES ── */
Chart Title     = "Sales for " & SELECTEDVALUE('Date'[Year], "All Years")

/* ── CONDITIONAL ── */
Color KPI       = SWITCH(TRUE(), [Sales] > 100000, "Green", [Sales] > 50000, "Yellow", "Red")

/* ── MOVING AVERAGE ── */
3M Moving Avg   = 
AVERAGEX(
    DATESINPERIOD('Date'[Date], LASTDATE('Date'[Date]), -3, MONTH),
    [Total Sales]
)

/* ── LAST N DAYS ── */
Last 30D Sales  = 
CALCULATE([Total Sales],
    DATESINPERIOD('Date'[Date], MAX('Date'[Date]), -30, DAY)
)

/* ── BLANK HANDLING ── */
Safe Measure    = IF(ISBLANK([Total Sales]), 0, [Total Sales])

/* ── TOP N ── */
Top 10 Sales    = CALCULATE([Total Sales], TOPN(10, ALL(Customers), [Total Sales], DESC))

/* ── BUDGET VARIANCE ── */
Variance        = [Actual Sales] - [Budget Sales]
Variance %      = DIVIDE([Variance], [Budget Sales])

/* ── CONTRIBUTION ── */
Category Share  = 
DIVIDE(
    [Total Sales],
    CALCULATE([Total Sales], ALL(Products[Category]))
)

/* ── CUSTOMER SEGMENT ── */
Customer Tier   = 
VAR TotalSpend = CALCULATE(SUM(Orders[Amount]), ALLEXCEPT(Customers, Customers[CustomerID]))
RETURN SWITCH(TRUE(), TotalSpend > 10000, "Gold", TotalSpend > 5000, "Silver", "Bronze")
```

### Power Query M Quick Reference

```m
// Promote headers
Table.PromoteHeaders(table)

// Change type
Table.TransformColumnTypes(table, {{"Col", type number}})

// Filter rows
Table.SelectRows(table, each [Status] = "Active")

// Add custom column
Table.AddColumn(table, "New", each [A] + [B])

// Remove columns
Table.RemoveColumns(table, {"Col1", "Col2"})

// Rename columns
Table.RenameColumns(table, {{"Old","New"}})

// Merge queries (LEFT JOIN)
Table.NestedJoin(t1, {"Key"}, t2, {"Key"}, "Result", JoinKind.LeftOuter)
Table.ExpandTableColumn(merged, "Result", {"Col1"}, {"t2.Col1"})

// Unpivot
Table.UnpivotOtherColumns(table, {"ID"}, "Attribute", "Value")

// Group by
Table.Group(table, {"Region"}, {{"Sum", each List.Sum([Sales]), type number}})

// Replace errors
Table.ReplaceErrorValues(table, {{"Col", null}})

// Fill down
Table.FillDown(table, {"Column"})

// Conditional column
Table.AddColumn(table, "Category", each if [Score] >= 90 then "A" else "B")

// Dynamic date filter (last 12 months)
Table.SelectRows(Source, each [Date] >= Date.AddMonths(Date.From(DateTime.LocalNow()), -12))
```

---

## 16. Interview Q&A

### Conceptual Questions

**Q: What is the difference between a measure and a calculated column?**
> A: A calculated column is computed row-by-row at data refresh and stored in the model; it has row context. A measure is computed at query time based on filter context; it's not stored and is dynamic.

**Q: What is context transition in DAX?**
> A: Context transition occurs when CALCULATE() is used inside an iterator (row context). CALCULATE automatically converts the current row context into an equivalent filter context before evaluating the expression.

**Q: What is the difference between ALL() and ALLSELECTED()?**
> A: ALL() removes all filters from the model including slicers. ALLSELECTED() removes filters applied within the visual (like matrix row/column headers) but respects slicer and page-level filters.

**Q: When would you use USERELATIONSHIP()?**
> A: When you have a role-playing dimension (e.g., a Date table linked to Order Date, Ship Date, and Delivery Date). Only one relationship can be active at a time; USERELATIONSHIP() activates an inactive relationship inside a CALCULATE().

**Q: What is the difference between FILTER() as an iterator vs column filter in CALCULATE?**
> A: A column filter (`Sales[Region] = "North"`) is pushed to the VertiPaq storage engine (fast). FILTER(Sales, Sales[Region] = "North") goes through the formula engine row-by-row (slower). Prefer column filters; use FILTER only when you need row-level expressions.

**Q: What is star schema and why is it preferred?**
> A: Star schema has one central fact table connected to multiple dimension tables. It's preferred because: simpler relationships, faster queries, better DAX filter propagation, and more efficient VertiPaq compression.

**Q: What is DirectQuery and when should you use it?**
> A: DirectQuery sends queries live to the source database instead of importing data. Use it when: data must always be fresh, dataset is too large to import, or security requirements prevent copying data.

**Q: What is RLS and how do you implement dynamic RLS?**
> A: Row-Level Security restricts which rows a user can see. Dynamic RLS uses `USERPRINCIPALNAME()` to match the logged-in user's email against a data column or mapping table, so each user automatically sees their own data.

**Q: What is the difference between SUMMARIZE and SUMMARIZECOLUMNS?**
> A: SUMMARIZECOLUMNS is newer, more efficient, and should be preferred. SUMMARIZE adds context to an existing table (can cause blank row issues). SUMMARIZECOLUMNS handles multiple grouping columns and filters more cleanly.

**Q: What are Calculation Groups?**
> A: Calculation Groups are a set of calculation items (e.g., YTD, PY, Variance) that can be dynamically applied to any measure, avoiding the need to write YTD/PY variants for every single measure. Created in Tabular Editor.

**Q: Explain CALCULATE in your own words.**
> A: CALCULATE evaluates an expression inside a modified filter context. You provide a base expression and one or more filters; CALCULATE removes any existing filters on the specified columns and applies the new ones, then evaluates the expression.

### Scenario Questions

**Q: How would you show % of total for each product category?**
```dax
Category % = 
DIVIDE(
    [Total Sales],
    CALCULATE([Total Sales], ALL(Products[Category]))
)
```

**Q: How would you calculate a 3-month rolling average?**
```dax
3M Rolling Avg = 
AVERAGEX(
    DATESINPERIOD('Date'[Date], LASTDATE('Date'[Date]), -3, MONTH),
    [Total Sales]
)
```

**Q: How would you find the first and last sale date for each customer?**
```dax
// In a calculated column on Customers table
First Sale Date = CALCULATE(MIN(Orders[OrderDate]), RELATEDTABLE(Orders))
Last Sale Date  = CALCULATE(MAX(Orders[OrderDate]), RELATEDTABLE(Orders))
```

**Q: How would you rank products and show only the top 10?**
```dax
Product Rank = RANKX(ALL(Products[Product]), [Total Sales],, DESC, DENSE)
// Then add a visual-level filter: Product Rank <= 10
```

---

## 📌 Key Concepts Summary

| Concept | One-Line Summary |
|---|---|
| **VertiPaq** | In-memory columnar engine that stores Import mode data |
| **Filter Context** | Set of active filters when a measure is evaluated |
| **Row Context** | Current row being evaluated in calculated column or iterator |
| **Context Transition** | CALCULATE converts row context to filter context |
| **CALCULATE** | Changes filter context before evaluating expression |
| **Star Schema** | Fact table surrounded by dimension tables – best practice |
| **RLS** | Restricts rows a user can see using DAX filters on roles |
| **Time Intelligence** | DAX functions for YTD, PY, MTD, QTD, etc. |
| **DirectQuery** | Live query to source; no data import |
| **DAX Iterator** | X functions that evaluate expression row-by-row |
| **VAR** | Variable – evaluates once, makes DAX readable |
| **DIVIDE** | Safe division function (avoids divide-by-zero) |
| **Deployment Pipeline** | Dev→Test→Prod promotion in Power BI Service |
| **Calculation Groups** | Reusable calc items (YTD, PY, etc.) for any measure |
| **Field Parameters** | Dynamic axis/measure switching via slicer |
| **Composite Model** | Mix of Import + DirectQuery in one model |

---

> 📝 **Note:** Power BI is continuously updated by Microsoft. Always check the [Power BI Blog](https://powerbi.microsoft.com/en-us/blog/) and [Microsoft Docs](https://docs.microsoft.com/en-us/power-bi/) for the latest features and function updates.

---

*Last Updated: 2026 | Covers Power BI Desktop, Service, DAX, Power Query M, Modeling, RLS, Optimization*