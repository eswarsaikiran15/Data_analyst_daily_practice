# Data Analyst Daily Practice 📊

A comprehensive learning repository for aspiring data analysts containing notes, tutorials, cheat sheets, and practical examples covering SQL, Python Data Stack, Excel, Power BI, and Computer Science Fundamentals.

## Repository Overview

This repository is organized into multiple learning domains with both theoretical knowledge (markdown notes, PDFs) and practical implementations (SQL queries, Jupyter Notebooks).

**Language Composition:** 100% Jupyter Notebooks

---

## 📁 Directory Structure

### 1. **CS_FUNDEMENTALS/** - Computer Science Fundamentals
Essential CS concepts for data professionals:

- **Computer Networking Notes for Tech Placements.pdf** - Networking fundamentals for interviews
- **DBMS_Notes.pdf** - Database Management Systems concepts
- **Operating System Notes.pdf** - OS core concepts
- **SQL (notes) by APNA COLLEGE.pdf** - Comprehensive SQL notes
- **SQL Notes by Apna College.pdf** - Alternative SQL reference
- **git-cheat-sheet-education.pdf** - Git version control guide

### 2. **EXCEL/** - Microsoft Excel Tutorials
Excel skills for data analysts:

- **COMPLETE_EXCEL.md** - Comprehensive Excel learning guide with functions, formulas, and best practices

### 3. **My_Sql/** - MySQL Database Tutorials
Practical SQL implementation with 18 files covering:

**Core Concepts:**
- `Basic_example.sql` - Getting started with SQL
- `primary_key_usage.sql` - Primary key implementation
- `unique_constraint.sql` - Unique constraints
- `using_default.sql` - Default values
- `using_foreign_key.sql` - Foreign key relationships
- `Cascading_in_fk.sql` - Cascading delete/update

**SQL Operations:**
- `using_where.sql` - WHERE clause fundamentals
- `order_by.sql` - Sorting results
- `limit_clause.sql` - Limiting result sets
- `Group_by.sql` - Grouping and aggregation
- `having_clause.sql` - HAVING clause for filtered groups
- `operators.sql` - SQL operators reference
- `using_operators_in_where.md` - Operator usage guide

**Data Manipulation:**
- `delete.sql` - DELETE statement
- `update.sql` - UPDATE statement
- `truncate_delete_drop_practice.sql` - Comparison of delete operations
- `joins_concepts.sql` - JOIN types and concepts
- `union.sql` - UNION operations

**Advanced Topics:**
- `alter_table_practice.sql` - Altering table structures
- `practice_upto_delete_command.sql` - Comprehensive practice examples
- `sql_aggregate_functions.md` - Aggregate functions reference

**Reference Guides:**
- `Complete_My_Sql_Notes.md` - Complete MySQL tutorial and reference
- `general_sql_query_oerder.sql` - Query execution order

### 4. **Power_BI/** - Power BI Analytics
Business Intelligence tools and techniques:

- **Complete_Power_BI_Notes.md** - Comprehensive Power BI learning guide covering data modeling, DAX, visualizations, and best practices

### 5. **python_data_stack/** - Python Data Analysis Libraries
Extensive Jupyter Notebooks and markdown guides for Python data tools:

**NumPy - Numerical Computing:**
- `Numpy.md` - NumPy comprehensive guide
- `Numpy_data_analysis_use.md` - Practical NumPy applications
- `complete_Numpy_tutotial.ipynb` - Complete NumPy tutorial notebook

**Pandas - Data Manipulation:**
- `Pandas.md` - Pandas comprehensive guide
- `Pandas_data_analysis_use.md` - Practical Pandas applications
- `complete_Pandas.ipynb` - Complete Pandas tutorial notebook

**Matplotlib - Data Visualization:**
- `Matplotlib.md` - Matplotlib comprehensive guide
- `matplotlib/` subdirectory with specialized plot tutorials:
  - `BAR PLOT.ipynb` - Bar chart implementations
  - `LINE PLOT.ipynb` - Line plot techniques
  - `SCATTER PLOT.ipynb` - Scatter plot examples
  - `PIE PLOT.ipynb` - Pie chart visualizations
  - `HIST PLOT.ipynb` - Histogram plots
  - `IMSHOW.ipynb` - Image display techniques
  - `SUBPLOT.ipynb` - Multiple plot layouts
  - `IRIS.csv` - Sample dataset (Iris flowers)
  - `SUPERMARKET.csv` - Sample dataset (Supermarket transactions)

**Seaborn - Statistical Visualization:**
- `seaborn.md` - Seaborn comprehensive guide
- `Seaborn .ipynb` - Seaborn tutorial notebook

### 6. **cheatsheets/** - Quick Reference Guides
Collection of 9 quick reference PDFs for rapid skill lookup:

- **DataLemur SQL Cheat Sheet (1).pdf** - SQL syntax quick reference
- **Data_Storytelling_Cheat_Sheet.pdf** - Data visualization and storytelling
- **Excel_Cheat_Sheet.pdf** - Excel functions and shortcuts
- **ML+Cheat+Sheet_2.pdf** - Machine Learning concepts
- **Power+BI_Cheat+Sheet.pdf** - Power BI quick reference
- **cheatsheet.pdf** - General data analysis cheat sheet
- **python-basics-cheat-sheet-v4.pdf** - Python syntax and functions
- **python-cheat-sheets.pdf** - Extended Python reference
- **sql-basics-cheat-sheet-a4.pdf** - SQL basics quick reference
- **statacheatsheets.pdf** - Statistical analysis reference

### 7. **docs/** - Documentation
Supporting documentation files:

- **LEARNING_PATH.md** - Recommended learning progression
- **RESOURCES.md** - External resources and references
- **SETUP.md** - Environment setup and installation guide

---

## 🛠️ Requirements

The project requires the following Python packages (see `requirements.txt`):

```
pandas>=1.3.0       # Data manipulation and analysis
numpy>=1.21.0       # Numerical computing
matplotlib>=3.4.0   # Data visualization
seaborn>=0.11.0     # Statistical data visualization
jupyter>=1.0.0      # Interactive notebooks
ipython>=7.0.0      # Enhanced Python shell
```

---

## 📚 Learning Topics Covered

### Data Management & Querying
- SQL fundamentals and advanced queries
- MySQL database design and operations
- Database relationships and constraints
- Data aggregation and analysis

### Data Analysis with Python
- NumPy for numerical operations
- Pandas for data manipulation
- Data cleaning and transformation
- Data exploration and analysis

### Data Visualization
- Matplotlib for basic and advanced plots
- Seaborn for statistical visualization
- Chart types and best practices
- Data storytelling techniques

### Business Intelligence
- Power BI dashboard creation
- Data modeling and DAX
- Interactive visualizations

### Spreadsheet Skills
- Excel formulas and functions
- Data organization
- Analysis techniques

### Fundamentals
- Computer networking
- Database management systems
- Operating systems
- Version control with Git

---

## 🎯 Getting Started

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/eswarsaikiran15/Data_analyst_daily_practice.git
   cd Data_analyst_daily_practice
   ```

2. **Install Dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

3. **Start Learning:**
   - Begin with `docs/LEARNING_PATH.md` for recommended progression
   - Explore relevant `.md` files for theoretical understanding
   - Work through `.ipynb` notebooks for hands-on practice
   - Reference `.pdf` files for quick lookup

4. **Practice SQL:**
   - Review SQL files in `My_Sql/` directory
   - Execute queries in your MySQL database
   - Understand concepts before moving to next topic

---

## 📖 File Organization

| Type | Purpose | Location |
|------|---------|----------|
| **Notebooks (.ipynb)** | Interactive Python tutorials with outputs | `python_data_stack/`, `python_data_stack/matplotlib/` |
| **Markdown (.md)** | Detailed learning guides and notes | All subdirectories |
| **SQL Scripts (.sql)** | Database operations and practice queries | `My_Sql/` |
| **PDF Files** | Reference materials and cheat sheets | `CS_FUNDEMENTALS/`, `cheatsheets/` |
| **Data Files (.csv)** | Sample datasets for practice | `python_data_stack/matplotlib/` |

---

## 🎓 Recommended Learning Path

1. **Foundations** (CS_FUNDEMENTALS/)
   - Start with CS fundamentals and Git basics
   - Understand database concepts

2. **SQL Mastery** (My_Sql/)
   - Progress from basic queries to advanced operations
   - Practice with provided examples

3. **Python Stack** (python_data_stack/)
   - Master NumPy for numerical operations
   - Learn Pandas for data manipulation
   - Create visualizations with Matplotlib and Seaborn

4. **Tools & Platforms**
   - Excel for spreadsheet analysis
   - Power BI for business intelligence

5. **Quick Reference** (cheatsheets/)
   - Use during interviews and on-the-job

---

## 📝 File Statistics

- **Total Jupyter Notebooks:** 10+
- **SQL Query Files:** 18+
- **Markdown Guides:** 15+
- **PDF Reference Materials:** 16+
- **Sample Datasets:** 2

---

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Add more examples and tutorials
- Fix any errors or typos
- Suggest improvements to existing content
- Share your own learning notes

Please see `CONTRIBUTING.md` for detailed guidelines.

---

## 📄 License

This repository is licensed under the MIT License. See the `LICENSE` file for details.

---

## 📞 Contact & Support

- **Repository:** [eswarsaikiran15/Data_analyst_daily_practice](https://github.com/eswarsaikiran15/Data_analyst_daily_practice)
- **Issues:** Use GitHub Issues for questions or problems
- **Documentation:** See `docs/` folder for setup and resources

---

## ✨ Key Features

✅ **Comprehensive Content** - From fundamentals to advanced topics
✅ **Hands-on Practice** - Jupyter notebooks with executable code
✅ **Multiple Formats** - Markdown guides, PDF references, SQL scripts
✅ **Sample Data** - CSV files for practicing with real-world datasets
✅ **Quick References** - Cheat sheets for rapid lookup
✅ **Well-Organized** - Logical folder structure for easy navigation
✅ **Beginner-Friendly** - Suitable for learners at all levels

---

## 🎯 Next Steps

- Start with your area of interest
- Review the corresponding guide in that directory
- Practice with provided examples
- Refer to cheat sheets for quick lookups
- Check `docs/LEARNING_PATH.md` for a structured progression

Happy learning! 📊📈📉

---

**Last Updated:** 2026-05-03
**Maintainer:** [@eswarsaikiran15](https://github.com/eswarsaikiran15)
