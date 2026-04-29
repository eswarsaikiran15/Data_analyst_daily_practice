# 🎨 Seaborn MASTER NOTES — Data Analysis & Basic ML
> **Complete Reference: Concept + Code + Recall**  
> Covers everything from setup to publication-quality EDA plots for ML pipelines.

---

## 📚 Table of Contents

1. [Installation & Setup](#1-installation--setup)
2. [Seaborn vs Matplotlib — Mental Model](#2-seaborn-vs-matplotlib--mental-model)
3. [The Figure-Level vs Axes-Level Distinction](#3-the-figure-level-vs-axes-level-distinction)
4. [Themes & Aesthetics](#4-themes--aesthetics)
5. [Color Palettes](#5-color-palettes)
6. [Loading Built-in Datasets](#6-loading-built-in-datasets)
7. [Relational Plots — scatterplot & lineplot](#7-relational-plots--scatterplot--lineplot)
8. [Distribution Plots — histplot, kdeplot, ecdfplot, rugplot](#8-distribution-plots--histplot-kdeplot-ecdfplot-rugplot)
9. [Categorical Plots — barplot, boxplot, violinplot & more](#9-categorical-plots--barplot-boxplot-violinplot--more)
10. [Matrix Plots — heatmap & clustermap](#10-matrix-plots--heatmap--clustermap)
11. [Regression Plots — regplot & lmplot](#11-regression-plots--regplot--lmplot)
12. [Multi-Plot Grids — FacetGrid, PairGrid, pairplot, jointplot](#12-multi-plot-grids--facetgrid-pairgrid-pairplot-jointplot)
13. [Customizing Plots (Titles, Labels, Ticks, Annotations)](#13-customizing-plots-titles-labels-ticks-annotations)
14. [Combining Seaborn with Matplotlib](#14-combining-seaborn-with-matplotlib)
15. [Seaborn for EDA — Full Workflow](#15-seaborn-for-eda--full-workflow)
16. [Seaborn for ML — Visualizing Preprocessing & Results](#16-seaborn-for-ml--visualizing-preprocessing--results)
17. [Saving Figures](#17-saving-figures)
18. [Quick Recall Cheat Sheet](#18-quick-recall-cheat-sheet)

---

## 1. Installation & Setup

```python
# Install
pip install seaborn matplotlib pandas numpy scikit-learn

# Standard imports (always use these together)
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

# Check version
print(sns.__version__)
```

### Jupyter / Notebook Setup

```python
# Render plots inline in Jupyter notebooks
%matplotlib inline

# Retina display (sharper plots on Mac)
%config InlineBackend.figure_format = 'retina'

# Larger default figure size
plt.rcParams['figure.figsize'] = (10, 6)
```

> 💡 **Recall:** Seaborn sits ON TOP of Matplotlib. You always need both imported. `sns` = seaborn alias. `plt` = matplotlib alias.

---

## 2. Seaborn vs Matplotlib — Mental Model

| Feature | Matplotlib | Seaborn |
|---|---|---|
| Level | Low-level (manual control) | High-level (smart defaults) |
| Data input | Arrays / lists | Pandas DataFrames |
| Statistical features | None built-in | Built-in (CI, regression, KDE) |
| Aesthetics | Basic | Beautiful by default |
| Customization | Full control | Customizable via Matplotlib |
| Best for | Fine-tuned control | EDA and statistical plots |

```python
# Matplotlib way — verbose
fig, ax = plt.subplots()
ax.scatter(df['Age'], df['Salary'])
ax.set_xlabel('Age')
ax.set_ylabel('Salary')
ax.set_title('Age vs Salary')
plt.show()

# Seaborn way — clean and smart
sns.scatterplot(data=df, x='Age', y='Salary')
plt.title('Age vs Salary')
plt.show()
```

> 💡 **Recall:** Use Seaborn for quick, beautiful statistical plots. Drop down to Matplotlib when you need precise customization.

---

## 3. The Figure-Level vs Axes-Level Distinction

This is the most important concept in Seaborn to understand.

### 📌 Axes-Level Functions
- Draw on a **single Matplotlib Axes** object
- Can be embedded in multi-panel figures
- Return an `Axes` object
- Examples: `sns.scatterplot()`, `sns.boxplot()`, `sns.histplot()`

```python
fig, axes = plt.subplots(1, 2, figsize=(12, 5))

sns.histplot(data=df, x='Age', ax=axes[0])
axes[0].set_title('Age Distribution')

sns.boxplot(data=df, x='Gender', y='Salary', ax=axes[1])
axes[1].set_title('Salary by Gender')

plt.tight_layout()
plt.show()
```

### 📌 Figure-Level Functions
- Manage their **own Figure** internally
- Include `FacetGrid` machinery — auto-create subplots across categories
- Return a Grid object (not an Axes)
- Examples: `sns.relplot()`, `sns.displot()`, `sns.catplot()`, `sns.lmplot()`

```python
# Figure-level: auto-creates subplots per category
g = sns.relplot(
    data=df,
    x='Age', y='Salary',
    col='Department',    # one subplot per department
    hue='Gender',
    kind='scatter'
)
g.set_titles("{col_name}")
plt.show()
```

> 💡 **Recall:**  
> **Axes-level** → `sns.histplot()`, `sns.scatterplot()`, `sns.boxplot()` — use `ax=` to place in a subplot  
> **Figure-level** → `sns.displot()`, `sns.relplot()`, `sns.catplot()` — use `col=` / `row=` to facet

---

## 4. Themes & Aesthetics

Seaborn provides 5 themes and 4 context scales.

### 📌 set_style() — Background & Grid

```python
# Available styles: 'darkgrid', 'whitegrid', 'dark', 'white', 'ticks'
sns.set_style('whitegrid')   # most common for papers/reports
sns.set_style('darkgrid')    # default seaborn style
sns.set_style('white')       # minimal — no grid
sns.set_style('ticks')       # axes ticks, no grid

# Remove spines (top and right borders)
sns.despine()                # call after plotting
sns.despine(left=True)       # remove left spine too
```

### 📌 set_context() — Element Sizes

```python
# Scales all text, lines, and markers
# 'paper' < 'notebook' < 'talk' < 'poster'
sns.set_context('talk')      # good for presentations
sns.set_context('poster')    # maximum size
sns.set_context('notebook')  # default for notebooks
sns.set_context('paper')     # small, for journals

# With custom font scale
sns.set_context('talk', font_scale=1.2)
```

### 📌 set_theme() — Apply Everything at Once

```python
# Recommended: one-liner setup
sns.set_theme(style='whitegrid', context='talk', palette='deep')

# Reset to default Matplotlib
sns.reset_defaults()

# Global font settings
sns.set_theme(font='sans-serif', font_scale=1.3)
```

> 💡 **Recall:** Always call `sns.set_theme()` at the top of your notebook. `style` = background, `context` = sizes, `palette` = colors.

---

## 5. Color Palettes

### 📌 Types of Palettes

```python
# Qualitative (categorical — no natural order)
sns.color_palette('deep')       # default seaborn
sns.color_palette('pastel')
sns.color_palette('muted')
sns.color_palette('bright')
sns.color_palette('dark')
sns.color_palette('colorblind') # ← best for accessibility

# Sequential (ordered numeric data)
sns.color_palette('Blues')
sns.color_palette('Greens')
sns.color_palette('Oranges')
sns.color_palette('viridis')    # perceptually uniform — great for heatmaps
sns.color_palette('plasma')
sns.color_palette('magma')

# Diverging (data that diverges from a midpoint — e.g. correlation: -1 to +1)
sns.color_palette('coolwarm')
sns.color_palette('RdBu')
sns.color_palette('RdYlGn')
sns.color_palette('vlag')
```

### 📌 Viewing Palettes

```python
# Visualize a palette
sns.color_palette('deep')                          # shows swatches in Jupyter
sns.palplot(sns.color_palette('viridis', 10))     # 10-color swatch
plt.show()
```

### 📌 Applying Palettes

```python
# Apply globally
sns.set_palette('colorblind')

# Apply to a single plot
sns.boxplot(data=df, x='Dept', y='Salary', palette='Set2')
sns.scatterplot(data=df, x='Age', y='Salary', hue='Gender',
                palette={'Male': '#1f77b4', 'Female': '#ff7f0e'})

# Custom palette
custom = ['#e74c3c', '#3498db', '#2ecc71', '#f39c12']
sns.barplot(data=df, x='Category', y='Value', palette=custom)
```

> 💡 **Recall:** Qualitative → `deep/colorblind`. Sequential → `viridis/Blues`. Diverging → `coolwarm/RdBu`. For ML correlation matrices: always `coolwarm`.

---

## 6. Loading Built-in Datasets

Seaborn ships with classic datasets for practice.

```python
# List all available datasets
print(sns.get_dataset_names())

# Load datasets
tips    = sns.load_dataset('tips')       # restaurant tips — great for categorical
iris    = sns.load_dataset('iris')       # classic ML classification dataset
titanic = sns.load_dataset('titanic')   # survival classification
penguins = sns.load_dataset('penguins') # modern iris alternative
flights = sns.load_dataset('flights')   # time series — monthly passengers
fmri    = sns.load_dataset('fmri')      # neuroscience time-series
diamonds = sns.load_dataset('diamonds') # gem prices — regression
mpg     = sns.load_dataset('mpg')       # car fuel efficiency
anscombe = sns.load_dataset('anscombe') # famous quartet — why visualize!

# Quick exploration
print(tips.head())
print(tips.dtypes)
print(tips.describe())
```

---

## 7. Relational Plots — scatterplot & lineplot

### 📌 scatterplot()

```python
tips = sns.load_dataset('tips')

# Basic scatter
sns.scatterplot(data=tips, x='total_bill', y='tip')
plt.show()

# With hue (color by category)
sns.scatterplot(data=tips, x='total_bill', y='tip', hue='sex')

# With size (marker size by numeric variable)
sns.scatterplot(data=tips, x='total_bill', y='tip',
                hue='sex', size='size', sizes=(20, 200))

# With style (marker shape by category)
sns.scatterplot(data=tips, x='total_bill', y='tip',
                hue='sex', style='smoker')

# Alpha for overplotting
sns.scatterplot(data=tips, x='total_bill', y='tip', alpha=0.6)

# Custom marker size and color
sns.scatterplot(data=tips, x='total_bill', y='tip',
                color='steelblue', s=80, edgecolor='white', linewidth=0.5)
```

### 📌 lineplot()

```python
flights = sns.load_dataset('flights')

# Basic line plot (auto computes mean + CI across repeated x values)
sns.lineplot(data=flights, x='year', y='passengers')

# With confidence interval turned off
sns.lineplot(data=flights, x='year', y='passengers', errorbar=None)

# With hue
sns.lineplot(data=flights, x='year', y='passengers',
             hue='month', palette='tab10')

# Custom CI
sns.lineplot(data=flights, x='year', y='passengers',
             errorbar=('ci', 95))       # 95% confidence interval
sns.lineplot(data=flights, x='year', y='passengers',
             errorbar='sd')             # ± 1 standard deviation

# Markers on line
sns.lineplot(data=flights, x='year', y='passengers',
             marker='o', markersize=6, linewidth=2)
```

### 📌 relplot() — Figure-Level Wrapper

```python
# Facet by column
g = sns.relplot(
    data=tips,
    x='total_bill', y='tip',
    col='time',           # subplot per 'time' category
    hue='sex',
    style='smoker',
    kind='scatter',
    height=5, aspect=0.8
)
g.set_axis_labels('Total Bill ($)', 'Tip ($)')
g.set_titles("{col_name}")

# Facet by row and column
g = sns.relplot(
    data=tips,
    x='total_bill', y='tip',
    row='sex', col='time',
    kind='scatter',
    height=4
)
```

> 💡 **Recall:** `hue` = color, `size` = marker size, `style` = marker shape. These three encoding channels work in most seaborn plots.

---

## 8. Distribution Plots — histplot, kdeplot, ecdfplot, rugplot

### 📌 histplot()

```python
penguins = sns.load_dataset('penguins')

# Basic histogram
sns.histplot(data=penguins, x='flipper_length_mm')

# With KDE overlay
sns.histplot(data=penguins, x='flipper_length_mm', kde=True)

# Control bins
sns.histplot(data=penguins, x='flipper_length_mm', bins=20)
sns.histplot(data=penguins, x='flipper_length_mm', binwidth=5)

# By category
sns.histplot(data=penguins, x='flipper_length_mm', hue='species')

# Stacked
sns.histplot(data=penguins, x='flipper_length_mm',
             hue='species', multiple='stack')

# Normalized to proportion
sns.histplot(data=penguins, x='flipper_length_mm',
             hue='species', stat='density', common_norm=False)

# 2D histogram (heatmap-like)
sns.histplot(data=penguins, x='flipper_length_mm', y='body_mass_g')
```

### 📌 kdeplot() — Kernel Density Estimate

```python
# Basic KDE (smooth distribution curve)
sns.kdeplot(data=penguins, x='flipper_length_mm')

# By group — great for comparing distributions
sns.kdeplot(data=penguins, x='flipper_length_mm',
            hue='species', fill=True, alpha=0.4)

# Bandwidth control (bw_adjust: smaller = more detail, larger = smoother)
sns.kdeplot(data=penguins, x='flipper_length_mm', bw_adjust=0.5)  # detailed
sns.kdeplot(data=penguins, x='flipper_length_mm', bw_adjust=2.0)  # smooth

# 2D KDE (contour plot — shows bivariate distribution)
sns.kdeplot(data=penguins, x='flipper_length_mm', y='body_mass_g',
            fill=True, cmap='Blues')

# Cumulative KDE
sns.kdeplot(data=penguins, x='flipper_length_mm', cumulative=True)
```

### 📌 ecdfplot() — Empirical Cumulative Distribution

```python
# What % of data is below each value?
sns.ecdfplot(data=penguins, x='flipper_length_mm')
sns.ecdfplot(data=penguins, x='flipper_length_mm', hue='species')
```

### 📌 rugplot() — Individual Observations

```python
# Tiny tick marks showing every data point
sns.rugplot(data=penguins, x='flipper_length_mm')

# Combine with KDE
sns.kdeplot(data=penguins, x='flipper_length_mm')
sns.rugplot(data=penguins, x='flipper_length_mm', color='red', height=0.05)
```

### 📌 displot() — Figure-Level Distribution Wrapper

```python
# Histogram faceted by variable
sns.displot(data=penguins, x='flipper_length_mm',
            col='species', kind='hist', kde=True, height=4)

# KDE faceted
sns.displot(data=penguins, x='flipper_length_mm',
            hue='species', kind='kde', fill=True)

# ECDF faceted
sns.displot(data=penguins, x='flipper_length_mm',
            hue='species', kind='ecdf')
```

> 💡 **Recall:** `histplot` = counts. `kdeplot` = smooth density. `ecdfplot` = cumulative %. `rugplot` = raw data ticks. Always check distributions before ML!

---

## 9. Categorical Plots — barplot, boxplot, violinplot & more

### 📌 barplot() — Mean with Confidence Interval

```python
tips = sns.load_dataset('tips')

# Basic bar (shows mean + 95% CI by default)
sns.barplot(data=tips, x='day', y='total_bill')

# Grouped bars
sns.barplot(data=tips, x='day', y='total_bill', hue='sex')

# Change estimator
import numpy as np
sns.barplot(data=tips, x='day', y='total_bill', estimator=np.median)
sns.barplot(data=tips, x='day', y='total_bill', estimator=np.sum)

# Remove CI
sns.barplot(data=tips, x='day', y='total_bill', errorbar=None)

# Horizontal bars
sns.barplot(data=tips, x='total_bill', y='day', orient='h')

# Rotate x labels
ax = sns.barplot(data=tips, x='day', y='total_bill')
ax.set_xticklabels(ax.get_xticklabels(), rotation=45, ha='right')
```

### 📌 countplot() — Frequency Count

```python
# Count of each category (no y variable needed)
sns.countplot(data=tips, x='day')

# With hue (grouped)
sns.countplot(data=tips, x='day', hue='sex')

# Horizontal
sns.countplot(data=tips, y='day')

# Sorted by frequency
order = tips['day'].value_counts().index
sns.countplot(data=tips, x='day', order=order)
```

### 📌 boxplot() — Five-Number Summary

```python
# Shows: min, Q1, median, Q3, max + outliers
sns.boxplot(data=tips, x='day', y='total_bill')

# Grouped
sns.boxplot(data=tips, x='day', y='total_bill', hue='sex')

# Notched box (shows CI around median)
sns.boxplot(data=tips, x='day', y='total_bill', notch=True)

# Single variable distribution
sns.boxplot(data=tips, y='total_bill')

# Width and flier style
sns.boxplot(data=tips, x='day', y='total_bill',
            width=0.4, flierprops={'marker': 'o', 'color': 'red', 'alpha': 0.5})

# Order categories
sns.boxplot(data=tips, x='day', y='total_bill',
            order=['Thur', 'Fri', 'Sat', 'Sun'])
```

### 📌 violinplot() — Boxplot + KDE

```python
# Shows full distribution shape + box stats
sns.violinplot(data=tips, x='day', y='total_bill')

# Split violin (hue with 2 categories)
sns.violinplot(data=tips, x='day', y='total_bill', hue='sex', split=True)

# Inner display options
sns.violinplot(data=tips, x='day', y='total_bill', inner='box')     # mini boxplot
sns.violinplot(data=tips, x='day', y='total_bill', inner='point')   # raw points
sns.violinplot(data=tips, x='day', y='total_bill', inner='stick')   # line per obs
sns.violinplot(data=tips, x='day', y='total_bill', inner=None)      # just the shape

# Bandwidth
sns.violinplot(data=tips, x='day', y='total_bill', bw_adjust=0.5)  # tighter
```

### 📌 boxenplot() — Letter-Value Plot (Better for Large Data)

```python
# Shows more quantiles than boxplot — good for n > 1000
diamonds = sns.load_dataset('diamonds')
sns.boxenplot(data=diamonds, x='cut', y='price')
sns.boxenplot(data=diamonds, x='cut', y='price', hue='color')
```

### 📌 stripplot() — Raw Data Points

```python
# Scatter every point along a categorical axis
sns.stripplot(data=tips, x='day', y='total_bill')

# Jitter to avoid overplotting
sns.stripplot(data=tips, x='day', y='total_bill', jitter=True, alpha=0.5)

# Overlay on boxplot
sns.boxplot(data=tips, x='day', y='total_bill', width=0.4)
sns.stripplot(data=tips, x='day', y='total_bill',
              color='black', alpha=0.4, size=3)
```

### 📌 swarmplot() — Non-Overlapping Points

```python
# Like stripplot but points don't overlap (uses beeswarm algorithm)
sns.swarmplot(data=tips, x='day', y='total_bill')

# Combine with violinplot
sns.violinplot(data=tips, x='day', y='total_bill', inner=None, color='lightblue')
sns.swarmplot(data=tips, x='day', y='total_bill', color='black', alpha=0.5, size=3)
```

### 📌 pointplot() — Means Connected by Lines

```python
# Shows mean + CI, connected across categories — great for interactions
sns.pointplot(data=tips, x='day', y='total_bill', hue='sex')
sns.pointplot(data=tips, x='day', y='total_bill', hue='sex',
              markers=['o', 's'], linestyles=['-', '--'])
```

### 📌 catplot() — Figure-Level Categorical Wrapper

```python
# One interface for all categorical plots
g = sns.catplot(
    data=tips,
    x='day', y='total_bill',
    col='time',              # one subplot per time
    kind='box',              # 'box','violin','bar','strip','swarm','point','count'
    height=5, aspect=0.7
)

g = sns.catplot(data=tips, x='day', y='total_bill',
                hue='sex', col='time', kind='violin',
                split=True, inner='box', height=5)
```

> 💡 **Recall:**  
> `barplot` = mean bars. `countplot` = frequency bars. `boxplot` = 5-number summary.  
> `violinplot` = boxplot + distribution. `stripplot` = raw points. `swarmplot` = non-overlapping points.

---

## 10. Matrix Plots — heatmap & clustermap

### 📌 heatmap() — 2D Color-Encoded Matrix

```python
# Most common use: correlation matrix
corr = df.corr()
sns.heatmap(corr)

# With annotations (show values)
sns.heatmap(corr, annot=True, fmt='.2f')

# Full customization
sns.heatmap(
    corr,
    annot=True,
    fmt='.2f',
    cmap='coolwarm',          # diverging colormap centered at 0
    vmin=-1, vmax=1,          # fix color scale to correlation range
    center=0,                 # center color scale at 0
    linewidths=0.5,           # grid lines between cells
    linecolor='white',
    square=True,              # square cells
    cbar_kws={'shrink': 0.8}  # colorbar size
)
plt.title('Correlation Matrix', fontsize=14, pad=15)

# Mask upper triangle (symmetric matrix — no need to show twice)
mask = np.triu(np.ones_like(corr, dtype=bool))
sns.heatmap(corr, annot=True, fmt='.2f', cmap='coolwarm',
            mask=mask, vmin=-1, vmax=1, square=True)

# Custom rectangular data (not just correlation)
flights = sns.load_dataset('flights')
pivot = flights.pivot_table(index='month', columns='year', values='passengers')
sns.heatmap(pivot, annot=True, fmt='d', cmap='YlOrRd')
```

### 📌 clustermap() — Hierarchical Clustering Heatmap

```python
iris = sns.load_dataset('iris')
iris_data = iris.drop('species', axis=1)

# Cluster rows and columns by similarity
sns.clustermap(iris_data, cmap='viridis', standard_scale=1)

# With row colors to highlight groups
species_colors = iris['species'].map({'setosa':'red','versicolor':'blue','virginica':'green'})
sns.clustermap(iris_data, cmap='viridis', row_colors=species_colors,
               standard_scale=1, figsize=(10, 8))
```

> 💡 **Recall:** `heatmap` for correlation matrices — always use `annot=True`, `cmap='coolwarm'`, `vmin=-1, vmax=1`. Mask upper triangle with `np.triu` to avoid redundancy.

---

## 11. Regression Plots — regplot & lmplot

### 📌 regplot() — Scatter + Regression Line (Axes-Level)

```python
tips = sns.load_dataset('tips')

# Basic linear regression
sns.regplot(data=tips, x='total_bill', y='tip')

# Confidence interval control
sns.regplot(data=tips, x='total_bill', y='tip', ci=95)   # 95% CI (default)
sns.regplot(data=tips, x='total_bill', y='tip', ci=None)  # no CI

# Polynomial regression
sns.regplot(data=tips, x='total_bill', y='tip', order=2)

# Logistic regression (for binary y)
titanic = sns.load_dataset('titanic')
sns.regplot(data=titanic, x='age', y='survived', logistic=True,
            scatter_kws={'alpha': 0.2}, line_kws={'color': 'red'})

# LOWESS (locally weighted smoothing — no assumption of linearity)
sns.regplot(data=tips, x='total_bill', y='tip', lowess=True)

# Style the scatter and line separately
sns.regplot(data=tips, x='total_bill', y='tip',
            scatter_kws={'color': 'steelblue', 'alpha': 0.5, 's': 40},
            line_kws={'color': 'red', 'linewidth': 2, 'linestyle': '--'})
```

### 📌 lmplot() — Figure-Level Regression (with Facets)

```python
# Regression by category (hue)
sns.lmplot(data=tips, x='total_bill', y='tip', hue='sex')

# Faceted by column
sns.lmplot(data=tips, x='total_bill', y='tip',
           col='time', hue='sex', height=5)

# Faceted by row and column
sns.lmplot(data=tips, x='total_bill', y='tip',
           row='sex', col='time', height=4)

# Logistic across facets
sns.lmplot(data=titanic, x='age', y='survived',
           logistic=True, col='sex', height=5)
```

### 📌 residplot() — Residuals of Regression

```python
# Shows if residuals are randomly scattered (good fit) or patterned (bad fit)
sns.residplot(data=tips, x='total_bill', y='tip')
sns.residplot(data=tips, x='total_bill', y='tip', lowess=True, color='red')
```

> 💡 **Recall:** `regplot` = one regression on one axes. `lmplot` = regression with facets (figure-level). `residplot` = check regression quality.

---

## 12. Multi-Plot Grids — FacetGrid, PairGrid, pairplot, jointplot

### 📌 pairplot() — All Pairwise Relationships

```python
iris = sns.load_dataset('iris')

# Basic pairplot
sns.pairplot(iris)

# Colored by species
sns.pairplot(iris, hue='species')

# Diagonal: KDE instead of histogram
sns.pairplot(iris, hue='species', diag_kind='kde')

# Specific variables only
sns.pairplot(iris, vars=['sepal_length', 'sepal_width', 'petal_length'])

# Lower triangle only
g = sns.pairplot(iris, hue='species')
for i, j in zip(*np.triu_indices_from(g.axes, k=1)):
    g.axes[i, j].set_visible(False)

# Different plot kinds
sns.pairplot(iris, hue='species', kind='reg')    # with regression
sns.pairplot(iris, hue='species', kind='kde')    # KDE everywhere

# Corner (lower triangle only, cleaner)
sns.pairplot(iris, hue='species', corner=True)
```

### 📌 jointplot() — Bivariate + Marginal Distributions

```python
# Scatter + histograms on margins
sns.jointplot(data=tips, x='total_bill', y='tip')

# KDE version
sns.jointplot(data=tips, x='total_bill', y='tip', kind='kde')

# Hexbin (good for large data)
sns.jointplot(data=tips, x='total_bill', y='tip', kind='hex')

# With regression line
sns.jointplot(data=tips, x='total_bill', y='tip', kind='reg')

# Customize
g = sns.jointplot(data=tips, x='total_bill', y='tip', kind='scatter',
                  marginal_kws={'bins': 20, 'fill': True},
                  joint_kws={'alpha': 0.5})
g.set_axis_labels('Total Bill ($)', 'Tip ($)')
g.figure.suptitle('Bill vs Tip Joint Distribution', y=1.02)

# Add hue
g = sns.jointplot(data=tips, x='total_bill', y='tip', hue='sex')
```

### 📌 FacetGrid — Custom Multi-Panel Grid

```python
# Create grid based on data
g = FacetGrid(tips, col='time', row='sex', height=4)
g.map(sns.scatterplot, 'total_bill', 'tip')
g.set_axis_labels('Total Bill', 'Tip')
g.set_titles(row_template='{row_name}', col_template='{col_name}')
g.add_legend()

# With hue
g = sns.FacetGrid(tips, col='day', hue='sex', height=4, col_wrap=2)
g.map(sns.scatterplot, 'total_bill', 'tip', alpha=0.6)
g.add_legend()

# Map any plotting function
g = sns.FacetGrid(tips, col='time', height=4)
g.map(sns.histplot, 'total_bill', bins=15, kde=True)
```

### 📌 PairGrid — Custom Pair Plots

```python
iris = sns.load_dataset('iris')

g = sns.PairGrid(iris, hue='species')
g.map_diag(sns.histplot)          # diagonal: histograms
g.map_upper(sns.scatterplot)      # upper triangle: scatter
g.map_lower(sns.kdeplot)          # lower triangle: KDE
g.add_legend()

# All same
g = sns.PairGrid(iris)
g.map(sns.scatterplot)
```

> 💡 **Recall:** `pairplot` = quick overview of all relationships (most used in EDA). `jointplot` = deep dive into one pair. `FacetGrid` = custom multi-panel for any plot.

---

## 13. Customizing Plots (Titles, Labels, Ticks, Annotations)

```python
# Basic customization — works for axes-level plots
ax = sns.scatterplot(data=tips, x='total_bill', y='tip', hue='sex')

# Title and labels
ax.set_title('Total Bill vs Tip', fontsize=16, fontweight='bold', pad=15)
ax.set_xlabel('Total Bill ($)', fontsize=13)
ax.set_ylabel('Tip ($)', fontsize=13)

# Axis limits
ax.set_xlim(0, 60)
ax.set_ylim(0, 12)

# Tick customization
ax.tick_params(axis='both', labelsize=11)
ax.set_xticks([0, 10, 20, 30, 40, 50, 60])
ax.set_xticklabels(['$0','$10','$20','$30','$40','$50','$60'])
plt.xticks(rotation=45, ha='right')

# Legend
ax.legend(title='Gender', title_fontsize=12, fontsize=11,
          loc='upper left', framealpha=0.9)

# Add text annotation to specific point
ax.annotate('High Tip!', xy=(50, 10), xytext=(40, 11),
            arrowprops=dict(arrowstyle='->', color='red'),
            fontsize=11, color='red')

# Add horizontal/vertical reference lines
ax.axhline(y=tips['tip'].mean(), color='red', linestyle='--',
           linewidth=1.5, label='Mean Tip')
ax.axvline(x=20, color='gray', linestyle=':', linewidth=1.5)

# Grid customization
ax.grid(True, alpha=0.3, linestyle='--')
ax.set_axisbelow(True)   # grid behind data

# Remove spines
sns.despine(ax=ax, top=True, right=True)

plt.tight_layout()
plt.show()
```

### 📌 Figure-Level Customization

```python
# For relplot, displot, catplot, lmplot — returns Grid object, not Axes
g = sns.relplot(data=tips, x='total_bill', y='tip', col='time')

# Set titles per subplot
g.set_titles("{col_name} Service")

# Set axis labels for all subplots
g.set_axis_labels('Total Bill ($)', 'Tip ($)')

# Overall figure title
g.figure.suptitle('Tips by Service Time', y=1.03, fontsize=14, fontweight='bold')

# Adjust layout
g.figure.subplots_adjust(top=0.9)
```

---

## 14. Combining Seaborn with Matplotlib

```python
# Create figure and axes manually, then pass ax= to seaborn
fig, axes = plt.subplots(2, 3, figsize=(16, 10))

# Row 1
sns.histplot(data=tips, x='total_bill', kde=True, ax=axes[0, 0])
axes[0, 0].set_title('Bill Distribution')

sns.boxplot(data=tips, x='day', y='total_bill', ax=axes[0, 1])
axes[0, 1].set_title('Bill by Day')

sns.scatterplot(data=tips, x='total_bill', y='tip', hue='sex', ax=axes[0, 2])
axes[0, 2].set_title('Bill vs Tip')

# Row 2
sns.violinplot(data=tips, x='day', y='tip', ax=axes[1, 0])
axes[1, 0].set_title('Tip Distribution by Day')

sns.countplot(data=tips, x='day', hue='sex', ax=axes[1, 1])
axes[1, 1].set_title('Count by Day and Gender')

corr = tips.select_dtypes('number').corr()
sns.heatmap(corr, annot=True, fmt='.2f', cmap='coolwarm', ax=axes[1, 2])
axes[1, 2].set_title('Correlation Matrix')

plt.suptitle('Tips Dataset — EDA Dashboard', fontsize=16, fontweight='bold', y=1.01)
plt.tight_layout()
plt.show()
```

---

## 15. Seaborn for EDA — Full Workflow

A step-by-step visual EDA template for any dataset.

```python
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

sns.set_theme(style='whitegrid', context='notebook', palette='deep')

# Load data
df = sns.load_dataset('penguins').dropna()

# ── Step 1: Distribution of each numeric variable ─────────────────────────────
numeric_cols = df.select_dtypes('number').columns
n = len(numeric_cols)

fig, axes = plt.subplots(2, n, figsize=(5*n, 8))
for i, col in enumerate(numeric_cols):
    sns.histplot(data=df, x=col, kde=True, ax=axes[0, i])
    axes[0, i].set_title(f'Distribution of {col}')

    sns.boxplot(data=df, y=col, ax=axes[1, i])
    axes[1, i].set_title(f'Boxplot of {col}')

plt.suptitle('Numeric Variable Distributions', fontsize=14, fontweight='bold')
plt.tight_layout()
plt.show()

# ── Step 2: Categorical variable frequency ────────────────────────────────────
cat_cols = df.select_dtypes(['object', 'category']).columns

fig, axes = plt.subplots(1, len(cat_cols), figsize=(5*len(cat_cols), 5))
for i, col in enumerate(cat_cols):
    order = df[col].value_counts().index
    sns.countplot(data=df, x=col, order=order, palette='Set2', ax=axes[i])
    axes[i].set_title(f'Count of {col}')
    axes[i].tick_params(axis='x', rotation=30)

plt.suptitle('Categorical Variable Frequencies', fontsize=14, fontweight='bold')
plt.tight_layout()
plt.show()

# ── Step 3: Pairwise relationships (colored by target) ───────────────────────
sns.pairplot(df, hue='species', diag_kind='kde', corner=True,
             plot_kws={'alpha': 0.6, 's': 40})
plt.suptitle('Pairwise Relationships by Species', y=1.02, fontsize=13)
plt.show()

# ── Step 4: Correlation matrix ───────────────────────────────────────────────
corr = df[numeric_cols].corr()
mask = np.triu(np.ones_like(corr, dtype=bool))

plt.figure(figsize=(8, 6))
sns.heatmap(corr, annot=True, fmt='.2f', cmap='coolwarm',
            vmin=-1, vmax=1, center=0, mask=mask,
            square=True, linewidths=0.5, linecolor='white')
plt.title('Correlation Matrix', fontsize=14, fontweight='bold')
plt.tight_layout()
plt.show()

# ── Step 5: Numeric vs Categorical (boxplots) ────────────────────────────────
fig, axes = plt.subplots(1, n, figsize=(5*n, 5))
for i, col in enumerate(numeric_cols):
    sns.violinplot(data=df, x='species', y=col, inner='box',
                   palette='Set2', ax=axes[i])
    axes[i].set_title(f'{col} by Species')

plt.suptitle('Numeric Variables by Species', fontsize=14, fontweight='bold')
plt.tight_layout()
plt.show()

# ── Step 6: Outlier detection ─────────────────────────────────────────────────
fig, axes = plt.subplots(1, n, figsize=(5*n, 5))
for i, col in enumerate(numeric_cols):
    sns.boxplot(data=df, x='species', y=col, palette='pastel', ax=axes[i])
    sns.stripplot(data=df, x='species', y=col, color='black',
                  alpha=0.3, size=3, ax=axes[i])
    axes[i].set_title(f'Outliers in {col}')

plt.suptitle('Outlier Detection', fontsize=14, fontweight='bold')
plt.tight_layout()
plt.show()
```

---

## 16. Seaborn for ML — Visualizing Preprocessing & Results

### 📌 Before ML: Check Class Imbalance

```python
sns.countplot(data=df, x='target', palette='Set2')
plt.title('Class Distribution (Check for Imbalance)')
plt.show()
```

### 📌 Before ML: Feature Distributions Before/After Scaling

```python
from sklearn.preprocessing import StandardScaler

fig, axes = plt.subplots(1, 2, figsize=(12, 5))

sns.histplot(data=df, x='income', kde=True, ax=axes[0], color='steelblue')
axes[0].set_title('Before Scaling')

scaler = StandardScaler()
df['income_scaled'] = scaler.fit_transform(df[['income']])
sns.histplot(data=df, x='income_scaled', kde=True, ax=axes[1], color='orange')
axes[1].set_title('After Standard Scaling')

plt.suptitle('Feature Scaling Effect', fontsize=13, fontweight='bold')
plt.tight_layout()
plt.show()
```

### 📌 Feature Correlation vs Target

```python
# Which features correlate most with target?
corr_with_target = df.corr()['target'].drop('target').sort_values()
colors = ['#e74c3c' if x < 0 else '#2ecc71' for x in corr_with_target]

plt.figure(figsize=(8, 6))
corr_with_target.plot(kind='barh', color=colors, edgecolor='white')
plt.axvline(x=0, color='black', linewidth=0.8)
plt.title('Feature Correlation with Target', fontsize=13)
plt.xlabel('Pearson Correlation')
plt.tight_layout()
plt.show()
```

### 📌 Confusion Matrix Heatmap

```python
from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay

# After model prediction
cm = confusion_matrix(y_test, y_pred)
labels = ['Class 0', 'Class 1']   # adjust to your classes

plt.figure(figsize=(6, 5))
sns.heatmap(cm, annot=True, fmt='d', cmap='Blues',
            xticklabels=labels, yticklabels=labels,
            linewidths=0.5, cbar=False)
plt.ylabel('True Label', fontsize=12)
plt.xlabel('Predicted Label', fontsize=12)
plt.title('Confusion Matrix', fontsize=14, fontweight='bold')
plt.tight_layout()
plt.show()
```

### 📌 Feature Importance Plot

```python
from sklearn.ensemble import RandomForestClassifier

model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

feat_imp = pd.Series(model.feature_importances_, index=X_train.columns)
feat_imp = feat_imp.sort_values(ascending=True)

plt.figure(figsize=(8, 6))
colors = sns.color_palette('viridis', len(feat_imp))
feat_imp.plot(kind='barh', color=colors, edgecolor='white')
plt.title('Feature Importance — Random Forest', fontsize=13, fontweight='bold')
plt.xlabel('Importance Score')
plt.tight_layout()
plt.show()
```

### 📌 ROC Curve

```python
from sklearn.metrics import roc_curve, auc

y_prob = model.predict_proba(X_test)[:, 1]
fpr, tpr, _ = roc_curve(y_test, y_prob)
roc_auc = auc(fpr, tpr)

plt.figure(figsize=(7, 6))
plt.plot(fpr, tpr, color='steelblue', lw=2,
         label=f'ROC Curve (AUC = {roc_auc:.2f})')
plt.plot([0, 1], [0, 1], color='gray', lw=1.5, linestyle='--', label='Random')
plt.fill_between(fpr, tpr, alpha=0.1, color='steelblue')
plt.xlabel('False Positive Rate', fontsize=12)
plt.ylabel('True Positive Rate', fontsize=12)
plt.title('ROC Curve', fontsize=14, fontweight='bold')
plt.legend(fontsize=11)
sns.despine()
plt.tight_layout()
plt.show()
```

### 📌 Learning Curve (Overfitting Detection)

```python
from sklearn.model_selection import learning_curve

train_sizes, train_scores, val_scores = learning_curve(
    model, X, y, cv=5, scoring='accuracy',
    train_sizes=np.linspace(0.1, 1.0, 10)
)

train_mean = train_scores.mean(axis=1)
val_mean   = val_scores.mean(axis=1)
train_std  = train_scores.std(axis=1)
val_std    = val_scores.std(axis=1)

plt.figure(figsize=(8, 5))
plt.plot(train_sizes, train_mean, 'o-', color='steelblue', label='Training Score')
plt.plot(train_sizes, val_mean,   'o-', color='orange',    label='Validation Score')
plt.fill_between(train_sizes, train_mean-train_std, train_mean+train_std, alpha=0.1, color='steelblue')
plt.fill_between(train_sizes, val_mean-val_std,     val_mean+val_std,     alpha=0.1, color='orange')
plt.xlabel('Training Size', fontsize=12)
plt.ylabel('Accuracy', fontsize=12)
plt.title('Learning Curve', fontsize=14, fontweight='bold')
plt.legend(fontsize=11)
sns.despine()
plt.tight_layout()
plt.show()
```

### 📌 Residual Plot (Regression)

```python
from sklearn.linear_model import LinearRegression

model = LinearRegression()
model.fit(X_train, y_train)
y_pred = model.predict(X_test)
residuals = y_test - y_pred

fig, axes = plt.subplots(1, 2, figsize=(12, 5))

# Actual vs Predicted
axes[0].scatter(y_test, y_pred, alpha=0.5, color='steelblue')
axes[0].plot([y_test.min(), y_test.max()],
             [y_test.min(), y_test.max()], 'r--', lw=2)
axes[0].set_xlabel('Actual')
axes[0].set_ylabel('Predicted')
axes[0].set_title('Actual vs Predicted')

# Residuals
axes[1].scatter(y_pred, residuals, alpha=0.5, color='orange')
axes[1].axhline(y=0, color='red', linestyle='--')
axes[1].set_xlabel('Predicted')
axes[1].set_ylabel('Residuals')
axes[1].set_title('Residual Plot')

sns.despine()
plt.suptitle('Regression Diagnostics', fontsize=13, fontweight='bold')
plt.tight_layout()
plt.show()
```

---

## 17. Saving Figures

```python
# Basic save
plt.savefig('plot.png')

# High quality (for reports, papers)
plt.savefig('plot.png', dpi=300, bbox_inches='tight')

# Transparent background
plt.savefig('plot.png', dpi=300, bbox_inches='tight', transparent=True)

# PDF (vector format — scalable, great for papers)
plt.savefig('plot.pdf', bbox_inches='tight')

# SVG (vector — editable in Illustrator / Inkscape)
plt.savefig('plot.svg', bbox_inches='tight')

# JPEG
plt.savefig('plot.jpg', dpi=200, bbox_inches='tight', quality=95)

# Save before plt.show() — after show(), the figure is cleared
fig, ax = plt.subplots(figsize=(10, 6))
sns.histplot(data=df, x='col', ax=ax)
plt.tight_layout()
plt.savefig('histogram.png', dpi=300, bbox_inches='tight')
plt.show()

# Save figure-level plots (relplot, displot, catplot)
g = sns.pairplot(iris, hue='species')
g.savefig('pairplot.png', dpi=300, bbox_inches='tight')
```

> 💡 **Recall:** Always `savefig` BEFORE `plt.show()`. Use `dpi=300` for reports. Use `bbox_inches='tight'` to prevent label clipping.

---

## 18. Quick Recall Cheat Sheet

### Plot Selection Guide

| Goal | Plot | Code |
|---|---|---|
| Distribution of 1 numeric var | Histogram | `sns.histplot(data=df, x='col', kde=True)` |
| Distribution comparison across groups | KDE | `sns.kdeplot(data=df, x='col', hue='group', fill=True)` |
| Outlier detection | Boxplot | `sns.boxplot(data=df, x='cat', y='num')` |
| Distribution shape detail | Violin | `sns.violinplot(data=df, x='cat', y='num')` |
| Category frequency | Count | `sns.countplot(data=df, x='cat')` |
| Category mean comparison | Bar | `sns.barplot(data=df, x='cat', y='num')` |
| Relationship between 2 numerics | Scatter | `sns.scatterplot(data=df, x='col1', y='col2')` |
| Relationship with regression line | Reg | `sns.regplot(data=df, x='col1', y='col2')` |
| All pairwise relationships | Pair | `sns.pairplot(df, hue='target')` |
| One bivariate + marginals | Joint | `sns.jointplot(data=df, x='col1', y='col2')` |
| Correlation matrix | Heatmap | `sns.heatmap(df.corr(), annot=True, cmap='coolwarm')` |
| Time series | Line | `sns.lineplot(data=df, x='date', y='value')` |
| Raw data per category | Strip | `sns.stripplot(data=df, x='cat', y='num')` |

### Key Parameters Reference

| Parameter | Purpose | Example |
|---|---|---|
| `hue` | Color by category | `hue='gender'` |
| `size` | Size by variable | `size='population'` |
| `style` | Marker shape by category | `style='region'` |
| `col` | Facet into columns | `col='time'` |
| `row` | Facet into rows | `row='sex'` |
| `palette` | Color scheme | `palette='coolwarm'` |
| `ax` | Target Axes object | `ax=axes[0,1]` |
| `height` | Subplot height (fig-level) | `height=5` |
| `aspect` | Width = height × aspect | `aspect=1.2` |
| `order` | Category order | `order=['A','B','C']` |
| `errorbar` | CI display | `errorbar=None` or `'ci'` |

### The 3 Encoding Channels

```
hue   → color  (categorical or continuous)
size  → marker size (continuous preferred)
style → marker shape (categorical only)
```

### Figure-Level vs Axes-Level Summary

```
sns.relplot()   wraps → scatterplot(), lineplot()
sns.displot()   wraps → histplot(), kdeplot(), ecdfplot()
sns.catplot()   wraps → barplot(), boxplot(), violinplot(),
                        stripplot(), swarmplot(), pointplot(), countplot()
sns.lmplot()    wraps → regplot()
```

### Mental Models

```
Seaborn = Grammar of Graphics for Python
  data=df          → always pass the full DataFrame
  x=, y=           → column names as strings
  hue=, size=, style= → extra encoding dimensions

Theme setup = style + context + palette
  sns.set_theme(style='whitegrid', context='talk', palette='deep')

Always remember:
  axes-level → use ax= to place in subplot grid
  figure-level → use col=/row= to facet automatically

EDA order:
  univariate → bivariate → multivariate → correlation → by target
```

---

> 📌 **last updated on april29,2026 **  
> Practice datasets: `sns.load_dataset('tips')` · `sns.load_dataset('iris')` · `sns.load_dataset('penguins')` · `sns.load_dataset('titanic')`  
> Seaborn Docs: [seaborn.pydata.org](https://seaborn.pydata.org)
