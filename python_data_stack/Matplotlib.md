# 📊 Matplotlib Master Notes — Data Analysis & Basic ML

> **Full conceptual explanations + production-ready code snippets**  
> Covers: Setup → Core API → Subplots → Styling → All Plot Types → Data Analysis Visuals → ML Visuals → Pro Tips

---

## 📚 Table of Contents

1. [What is Matplotlib?](#1-what-is-matplotlib)
2. [Installation & Setup](#2-installation--setup)
3. [The Two Interfaces: pyplot vs OOP](#3-the-two-interfaces-pyplot-vs-oop)
4. [Anatomy of a Figure](#4-anatomy-of-a-figure)
5. [Core Plotting Basics](#5-core-plotting-basics)
6. [Customization — Labels, Titles, Legends, Colors](#6-customization--labels-titles-legends-colors)
7. [Subplots & Layouts](#7-subplots--layouts)
8. [Plot Types for Data Analysis](#8-plot-types-for-data-analysis)
9. [Styles & Themes](#9-styles--themes)
10. [Working with Pandas DataFrames](#10-working-with-pandas-dataframes)
11. [ML Visualization Plots](#11-ml-visualization-plots)
12. [Saving & Exporting Figures](#12-saving--exporting-figures)
13. [Quick Reference Cheat Sheet](#13-quick-reference-cheat-sheet)

---

## 1. What is Matplotlib?

Matplotlib is the **foundational plotting library** in Python. Almost every other visualization library (Seaborn, Pandas plots, even parts of Scikit-learn) is built on top of it.

```
Your Code
    ↓
Matplotlib (Figure, Axes, Artists)
    ↓
Backend (renders to screen / PNG / PDF / SVG)
```

**Key mental model:**
- A **Figure** is the entire canvas (the window or image file)
- An **Axes** is a single plot inside that canvas (has x-axis, y-axis, data)
- You can have multiple Axes in one Figure (subplots)

---

## 2. Installation & Setup

```bash
pip install matplotlib numpy pandas scikit-learn
```

### Standard Imports

```python
import matplotlib.pyplot as plt
import matplotlib as mpl
import numpy as np
import pandas as pd

# For Jupyter Notebooks — renders plots inline
%matplotlib inline

# For higher resolution in Jupyter
%config InlineBackend.figure_format = 'retina'
```

### Check Your Version

```python
print(mpl.__version__)  # e.g., 3.8.0
```

---

## 3. The Two Interfaces: pyplot vs OOP

This is the **most important concept** to understand first. Matplotlib has two ways to write code.

### 3.1 pyplot Interface (Implicit / Stateful)

pyplot tracks the "current figure" and "current axes" behind the scenes. Good for quick scripts.

```python
import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 10, 100)
y = np.sin(x)

plt.plot(x, y)           # plots on the "current" axes
plt.title("Sine Wave")
plt.xlabel("x")
plt.ylabel("sin(x)")
plt.show()
```

**Problem:** In complex code with multiple figures, pyplot can confuse which figure/axes is "current."

---

### 3.2 OOP Interface (Explicit — RECOMMENDED)

You hold references to Figure and Axes objects directly. This is the professional approach.

```python
import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 10, 100)
y = np.sin(x)

fig, ax = plt.subplots()   # fig = Figure, ax = Axes object

ax.plot(x, y)              # call methods on ax directly
ax.set_title("Sine Wave")
ax.set_xlabel("x")
ax.set_ylabel("sin(x)")

plt.show()
```

> ✅ **Rule of thumb:** Always use `fig, ax = plt.subplots()` for any serious code. Reserve `plt.plot()` only for throwaway one-liners.

---

## 4. Anatomy of a Figure

```
┌─────────────────────────────────────┐  ← Figure
│  Title                              │
│  ┌───────────────────────────────┐  │
│  │  ^ y-axis label               │  │
│  │  │                            │  │  ← Axes
│  │  │    ● data points           │  │
│  │  │                            │  │
│  │  └──────────────────────────► │  │
│  │       x-axis label            │  │
│  │  [tick] [tick] [tick]         │  │  ← Tick marks
│  └───────────────────────────────┘  │
│  Legend: [■ series1] [■ series2]    │  ← Legend
└─────────────────────────────────────┘
```

### Named Parts

| Part | What it is | How to access |
|------|-----------|---------------|
| `Figure` | The whole image canvas | `fig` |
| `Axes` | A single plot panel | `ax` |
| `Axis` | The x or y number line | `ax.xaxis`, `ax.yaxis` |
| `Tick` | A mark on an axis | `ax.xaxis.get_major_ticks()` |
| `Spine` | The border lines of the plot | `ax.spines['top']` |
| `Legend` | The key for series | `ax.legend()` |
| `Title` | Plot title text | `ax.set_title()` |

---

## 5. Core Plotting Basics

### 5.1 Line Plot

```python
import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 2 * np.pi, 200)

fig, ax = plt.subplots(figsize=(10, 4))

ax.plot(x, np.sin(x), label='sin(x)', color='royalblue', linewidth=2)
ax.plot(x, np.cos(x), label='cos(x)', color='tomato', linewidth=2, linestyle='--')

ax.set_title("Sine and Cosine", fontsize=16)
ax.set_xlabel("Radians")
ax.set_ylabel("Value")
ax.legend()
ax.grid(True, alpha=0.3)

plt.tight_layout()
plt.show()
```

### 5.2 Scatter Plot

```python
np.random.seed(42)
x = np.random.randn(200)
y = 2 * x + np.random.randn(200) * 0.8

fig, ax = plt.subplots(figsize=(7, 5))

scatter = ax.scatter(x, y, c=y, cmap='viridis', alpha=0.7, edgecolors='white', linewidths=0.5)
fig.colorbar(scatter, ax=ax, label='y value')  # color bar

ax.set_title("Scatter Plot with Colormap")
ax.set_xlabel("x")
ax.set_ylabel("y")
plt.tight_layout()
plt.show()
```

### 5.3 Bar Chart

```python
categories = ['Python', 'JavaScript', 'Rust', 'Go', 'C++']
values     = [85, 72, 60, 55, 68]
colors     = ['#4C72B0', '#DD8452', '#55A868', '#C44E52', '#8172B3']

fig, ax = plt.subplots(figsize=(8, 5))

bars = ax.bar(categories, values, color=colors, edgecolor='white', linewidth=0.8)

# Add value labels on top of each bar
for bar, val in zip(bars, values):
    ax.text(bar.get_x() + bar.get_width() / 2,
            bar.get_height() + 0.5,
            str(val),
            ha='center', va='bottom', fontweight='bold')

ax.set_title("Popularity by Language")
ax.set_ylabel("Score")
ax.set_ylim(0, 100)
ax.grid(axis='y', alpha=0.3)
plt.tight_layout()
plt.show()
```

### 5.4 Horizontal Bar Chart

```python
fig, ax = plt.subplots(figsize=(8, 5))
ax.barh(categories, values, color=colors)
ax.set_xlabel("Score")
ax.set_title("Horizontal Bar Chart")
plt.tight_layout()
plt.show()
```

---

## 6. Customization — Labels, Titles, Legends, Colors

### 6.1 Text and Labels

```python
fig, ax = plt.subplots()

ax.plot([1, 2, 3], [4, 5, 3])

# Title
ax.set_title("Main Title", fontsize=18, fontweight='bold', pad=15)

# Axis labels
ax.set_xlabel("X Label", fontsize=13, labelpad=10)
ax.set_ylabel("Y Label", fontsize=13, labelpad=10)

# Tick labels
ax.tick_params(axis='both', labelsize=11)

# Custom tick positions and labels
ax.set_xticks([1, 2, 3])
ax.set_xticklabels(['Low', 'Med', 'High'])

# Add an annotation with an arrow
ax.annotate('Peak here',
            xy=(2, 5),          # point to annotate
            xytext=(2.5, 4.5),  # text position
            arrowprops=dict(arrowstyle='->', color='red'),
            fontsize=11, color='red')

plt.tight_layout()
plt.show()
```

### 6.2 Colors

```python
# Named colors
ax.plot(x, y, color='steelblue')

# Hex colors
ax.plot(x, y, color='#2ecc71')

# RGB tuple (values 0–1)
ax.plot(x, y, color=(0.8, 0.2, 0.4))

# Transparency
ax.plot(x, y, color='blue', alpha=0.5)
```

**Useful named colors:**
`royalblue`, `tomato`, `forestgreen`, `gold`, `orchid`, `slategray`, `coral`, `teal`

### 6.3 Line Styles and Markers

```python
# linestyle options: '-', '--', '-.', ':', 'None'
# marker options:   'o', 's', '^', 'D', 'x', '+', '*', 'v'

ax.plot(x, y, linestyle='--', marker='o', markersize=5,
        markerfacecolor='white', markeredgecolor='blue')
```

### 6.4 Legend

```python
ax.plot(x, y1, label='Training Loss')
ax.plot(x, y2, label='Validation Loss')

ax.legend(loc='upper right',       # location
          fontsize=11,
          framealpha=0.8,           # legend box transparency
          edgecolor='gray',
          ncol=2)                   # columns in legend
```

**Legend loc options:**
`'best'`, `'upper right'`, `'upper left'`, `'lower left'`, `'lower right'`, `'center'`

### 6.5 Grid

```python
ax.grid(True)                          # simple grid
ax.grid(True, axis='y')                # only horizontal lines
ax.grid(True, color='gray', alpha=0.3, linestyle='--', linewidth=0.7)
```

---

## 7. Subplots & Layouts

### 7.1 Basic Subplots — `plt.subplots(rows, cols)`

```python
fig, axes = plt.subplots(2, 3, figsize=(15, 8))
# axes is a 2D numpy array: axes[row][col]

x = np.linspace(0, 10, 100)

axes[0][0].plot(x, np.sin(x), color='royalblue')
axes[0][0].set_title("sin(x)")

axes[0][1].plot(x, np.cos(x), color='tomato')
axes[0][1].set_title("cos(x)")

axes[0][2].plot(x, np.tan(x), color='forestgreen')
axes[0][2].set_title("tan(x)")
axes[0][2].set_ylim(-5, 5)

# Flatten for easy iteration
for ax in axes.flat:
    ax.grid(True, alpha=0.3)

plt.suptitle("Trig Functions", fontsize=18, y=1.02)
plt.tight_layout()
plt.show()
```

### 7.2 Shared Axes

```python
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(10, 6), sharex=True)

ax1.plot(x, np.sin(x), color='royalblue')
ax1.set_ylabel("sin(x)")

ax2.plot(x, np.cos(x), color='tomato')
ax2.set_ylabel("cos(x)")
ax2.set_xlabel("x")

# No gap between shared-x subplots
plt.subplots_adjust(hspace=0)
plt.show()
```

### 7.3 GridSpec — Custom Layouts

```python
import matplotlib.gridspec as gridspec

fig = plt.figure(figsize=(12, 8))
gs = gridspec.GridSpec(2, 3)  # 2 rows, 3 cols

ax1 = fig.add_subplot(gs[0, :])      # row 0, all columns (wide)
ax2 = fig.add_subplot(gs[1, 0])      # row 1, col 0
ax3 = fig.add_subplot(gs[1, 1])      # row 1, col 1
ax4 = fig.add_subplot(gs[1, 2])      # row 1, col 2

ax1.set_title("Wide Top Plot")
ax2.set_title("Bottom Left")
ax3.set_title("Bottom Middle")
ax4.set_title("Bottom Right")

plt.tight_layout()
plt.show()
```

### 7.4 Inset Axes (Plot within a Plot)

```python
fig, ax = plt.subplots(figsize=(8, 5))
ax.plot(x, np.sin(x))
ax.set_title("Main Plot")

# Create an inset axes
ax_inset = ax.inset_axes([0.6, 0.6, 0.35, 0.35])  # [x, y, width, height] in axes coords
ax_inset.plot(x[:30], np.sin(x[:30]), color='tomato')
ax_inset.set_title("Zoom", fontsize=9)

plt.show()
```

---

## 8. Plot Types for Data Analysis

### 8.1 Histogram

```python
np.random.seed(0)
data = np.random.normal(loc=70, scale=10, size=1000)

fig, ax = plt.subplots(figsize=(8, 5))

ax.hist(data, bins=30, color='steelblue', edgecolor='white', alpha=0.85)

# Overlay a density line (using twin axis)
from scipy.stats import norm
x_range = np.linspace(data.min(), data.max(), 200)
ax2 = ax.twinx()
ax2.plot(x_range, norm.pdf(x_range, data.mean(), data.std()),
         color='tomato', linewidth=2, label='Normal PDF')
ax2.set_ylabel("Density")

ax.set_title("Histogram with Normal Overlay")
ax.set_xlabel("Value")
ax.set_ylabel("Frequency")
plt.tight_layout()
plt.show()
```

### 8.2 Box Plot

```python
np.random.seed(1)
data_groups = {
    'Group A': np.random.normal(70, 10, 100),
    'Group B': np.random.normal(85, 8,  100),
    'Group C': np.random.normal(60, 15, 100),
    'Group D': np.random.normal(78, 12, 100),
}

fig, ax = plt.subplots(figsize=(9, 5))

bp = ax.boxplot(data_groups.values(),
                labels=data_groups.keys(),
                patch_artist=True,       # filled boxes
                notch=True,              # notched box (shows CI of median)
                medianprops=dict(color='black', linewidth=2))

colors = ['#4C72B0', '#DD8452', '#55A868', '#C44E52']
for patch, color in zip(bp['boxes'], colors):
    patch.set_facecolor(color)
    patch.set_alpha(0.7)

ax.set_title("Box Plot Comparison")
ax.set_ylabel("Value")
ax.grid(axis='y', alpha=0.3)
plt.tight_layout()
plt.show()
```

### 8.3 Violin Plot

```python
fig, ax = plt.subplots(figsize=(9, 5))

parts = ax.violinplot(list(data_groups.values()),
                      positions=range(1, 5),
                      showmeans=True,
                      showmedians=True)

for pc, color in zip(parts['bodies'], colors):
    pc.set_facecolor(color)
    pc.set_alpha(0.7)

ax.set_xticks(range(1, 5))
ax.set_xticklabels(data_groups.keys())
ax.set_title("Violin Plot")
ax.set_ylabel("Value")
ax.grid(axis='y', alpha=0.3)
plt.tight_layout()
plt.show()
```

### 8.4 Heatmap (Correlation Matrix)

```python
import pandas as pd
import numpy as np

np.random.seed(42)
df = pd.DataFrame(np.random.randn(100, 5),
                  columns=['Feature_A', 'Feature_B', 'Feature_C', 'Feature_D', 'Target'])

corr = df.corr()

fig, ax = plt.subplots(figsize=(7, 6))

im = ax.imshow(corr, cmap='coolwarm', vmin=-1, vmax=1, aspect='auto')
fig.colorbar(im, ax=ax, label='Correlation')

# Tick labels
labels = corr.columns.tolist()
ax.set_xticks(range(len(labels)))
ax.set_yticks(range(len(labels)))
ax.set_xticklabels(labels, rotation=45, ha='right')
ax.set_yticklabels(labels)

# Annotate each cell
for i in range(len(labels)):
    for j in range(len(labels)):
        ax.text(j, i, f"{corr.iloc[i, j]:.2f}",
                ha='center', va='center',
                fontsize=9,
                color='white' if abs(corr.iloc[i, j]) > 0.5 else 'black')

ax.set_title("Correlation Matrix Heatmap", fontsize=14)
plt.tight_layout()
plt.show()
```

### 8.5 Pie Chart

```python
labels   = ['Python', 'R', 'Julia', 'Scala', 'Other']
sizes    = [55, 20, 10, 8, 7]
explode  = (0.05, 0, 0, 0, 0)   # slightly explode first slice

fig, ax = plt.subplots(figsize=(7, 7))

wedges, texts, autotexts = ax.pie(
    sizes,
    explode=explode,
    labels=labels,
    autopct='%1.1f%%',
    startangle=140,
    colors=['#4C72B0','#DD8452','#55A868','#C44E52','#8172B3'],
    wedgeprops=dict(edgecolor='white', linewidth=1.5)
)

for autotext in autotexts:
    autotext.set_fontsize(11)
    autotext.set_fontweight('bold')

ax.set_title("Language Market Share", fontsize=15)
plt.tight_layout()
plt.show()
```

### 8.6 Area / Stacked Area Chart

```python
x = np.arange(2018, 2025)
a = np.array([20, 25, 28, 33, 40, 45, 50])
b = np.array([15, 18, 22, 20, 25, 30, 28])
c = np.array([10, 12, 10, 15, 12, 14, 18])

fig, ax = plt.subplots(figsize=(10, 5))

ax.stackplot(x, a, b, c,
             labels=['Product A', 'Product B', 'Product C'],
             colors=['#4C72B0', '#DD8452', '#55A868'],
             alpha=0.85)

ax.set_title("Stacked Area Chart — Revenue by Product")
ax.set_xlabel("Year")
ax.set_ylabel("Revenue ($M)")
ax.legend(loc='upper left')
ax.grid(True, alpha=0.3)
plt.tight_layout()
plt.show()
```

### 8.7 Error Bars

```python
x = np.array([1, 2, 3, 4, 5])
y = np.array([2.1, 3.5, 2.8, 4.2, 3.9])
yerr = np.array([0.3, 0.4, 0.25, 0.5, 0.35])

fig, ax = plt.subplots(figsize=(7, 4))

ax.errorbar(x, y, yerr=yerr,
            fmt='o-',           # 'o' marker + '-' line
            capsize=5,          # caps on error bars
            capthick=2,
            color='royalblue',
            ecolor='tomato',
            linewidth=2,
            markersize=7,
            label='Mean ± Std')

ax.set_title("Error Bar Plot")
ax.set_xlabel("Group")
ax.set_ylabel("Value")
ax.legend()
ax.grid(True, alpha=0.3)
plt.tight_layout()
plt.show()
```

### 8.8 Time Series Plot

```python
dates = pd.date_range(start='2023-01-01', periods=365, freq='D')
prices = 100 + np.cumsum(np.random.randn(365) * 1.5)

fig, ax = plt.subplots(figsize=(13, 5))

ax.plot(dates, prices, color='royalblue', linewidth=1.5, label='Price')

# Fill area under the line
ax.fill_between(dates, prices, alpha=0.15, color='royalblue')

# Highlight a period
ax.axvspan(pd.Timestamp('2023-06-01'), pd.Timestamp('2023-08-31'),
           alpha=0.2, color='gold', label='Summer Period')

# Horizontal reference line
ax.axhline(y=100, color='gray', linestyle='--', linewidth=1, label='Baseline')

ax.set_title("Time Series — Stock Price")
ax.set_xlabel("Date")
ax.set_ylabel("Price ($)")
ax.legend()
ax.grid(True, alpha=0.3)

# Rotate date labels
fig.autofmt_xdate()
plt.tight_layout()
plt.show()
```

### 8.9 Bubble Chart

```python
np.random.seed(7)
n = 50
x = np.random.rand(n) * 100
y = np.random.rand(n) * 100
sizes = np.random.rand(n) * 1000   # bubble area
colors_val = np.random.rand(n)

fig, ax = plt.subplots(figsize=(8, 6))

scatter = ax.scatter(x, y, s=sizes, c=colors_val,
                     cmap='plasma', alpha=0.6,
                     edgecolors='white', linewidths=0.7)

fig.colorbar(scatter, ax=ax, label='Category')
ax.set_title("Bubble Chart")
ax.set_xlabel("X Metric")
ax.set_ylabel("Y Metric")
plt.tight_layout()
plt.show()
```

---

## 9. Styles & Themes

### 9.1 Available Styles

```python
print(plt.style.available)
# ['Solarize_Light2', '_classic_test_patch', 'bmh', 'classic',
#  'dark_background', 'fast', 'fivethirtyeight', 'ggplot',
#  'grayscale', 'seaborn', 'seaborn-v0_8', ...]
```

### 9.2 Applying a Style

```python
plt.style.use('ggplot')         # apply globally
plt.style.use('dark_background')
plt.style.use('fivethirtyeight')
plt.style.use('seaborn-v0_8-whitegrid')

# Temporarily apply (doesn't change global style)
with plt.style.context('ggplot'):
    fig, ax = plt.subplots()
    ax.plot([1, 2, 3], [4, 5, 3])
    plt.show()
```

### 9.3 Custom rcParams

`rcParams` is a global settings dictionary that controls all default style values.

```python
import matplotlib as mpl

mpl.rcParams['figure.figsize']    = (10, 5)
mpl.rcParams['font.size']         = 13
mpl.rcParams['font.family']       = 'DejaVu Sans'
mpl.rcParams['axes.spines.top']   = False    # remove top border
mpl.rcParams['axes.spines.right'] = False    # remove right border
mpl.rcParams['axes.grid']         = True
mpl.rcParams['grid.alpha']        = 0.3
mpl.rcParams['lines.linewidth']   = 2.0
mpl.rcParams['axes.prop_cycle']   = mpl.cycler(
    color=['#4C72B0','#DD8452','#55A868','#C44E52','#8172B3']
)

# Reset to defaults
mpl.rcdefaults()
```

### 9.4 Clean Minimal Style (Manual)

```python
def clean_axes(ax):
    """Apply a clean minimal look to any axes."""
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    ax.spines['left'].set_color('#AAAAAA')
    ax.spines['bottom'].set_color('#AAAAAA')
    ax.tick_params(colors='#555555')
    ax.xaxis.label.set_color('#555555')
    ax.yaxis.label.set_color('#555555')
    ax.title.set_color('#222222')
    ax.grid(True, color='#EEEEEE', linewidth=0.8)
    return ax

fig, ax = plt.subplots(figsize=(9, 5))
ax.plot(x, np.sin(x), linewidth=2, color='#4C72B0')
clean_axes(ax)
ax.set_title("Clean Style Example")
plt.tight_layout()
plt.show()
```

---

## 10. Working with Pandas DataFrames

Matplotlib integrates seamlessly with pandas. You can pass `DataFrame` columns directly.

### 10.1 Plotting Directly from DataFrame

```python
import pandas as pd
import numpy as np

np.random.seed(0)
df = pd.DataFrame({
    'year':    range(2015, 2025),
    'revenue': [12, 15, 14, 18, 22, 26, 24, 30, 35, 40],
    'profit':  [2,  3,  2.5, 4,  5,  6,  5.5, 8, 10, 12],
})

fig, ax = plt.subplots(figsize=(10, 5))

ax.plot(df['year'], df['revenue'], marker='o', label='Revenue', color='royalblue')
ax.plot(df['year'], df['profit'],  marker='s', label='Profit',  color='tomato')

ax.set_title("Revenue vs Profit Over Time")
ax.set_xlabel("Year")
ax.set_ylabel("$ Millions")
ax.legend()
ax.grid(True, alpha=0.3)
plt.tight_layout()
plt.show()
```

### 10.2 GroupBy + Bar Chart

```python
np.random.seed(5)
df = pd.DataFrame({
    'region':  np.random.choice(['North', 'South', 'East', 'West'], 200),
    'product': np.random.choice(['A', 'B', 'C'], 200),
    'sales':   np.random.randint(100, 1000, 200)
})

grouped = df.groupby(['region', 'product'])['sales'].mean().unstack()

fig, ax = plt.subplots(figsize=(10, 5))
grouped.plot(kind='bar', ax=ax, edgecolor='white')

ax.set_title("Average Sales by Region and Product")
ax.set_xlabel("Region")
ax.set_ylabel("Avg Sales")
ax.legend(title='Product')
ax.tick_params(axis='x', rotation=0)
ax.grid(axis='y', alpha=0.3)
plt.tight_layout()
plt.show()
```

### 10.3 Scatter Matrix (Pairs Plot)

```python
from pandas.plotting import scatter_matrix

np.random.seed(0)
df = pd.DataFrame(np.random.randn(150, 4),
                  columns=['Feature 1', 'Feature 2', 'Feature 3', 'Feature 4'])

scatter_matrix(df, figsize=(10, 8), diagonal='hist',
               color='steelblue', alpha=0.6,
               hist_kwds={'bins': 20, 'edgecolor': 'white'})

plt.suptitle("Scatter Matrix (Pair Plot)", y=1.01, fontsize=14)
plt.tight_layout()
plt.show()
```

---

## 11. ML Visualization Plots

These are the plots you'll use constantly in machine learning workflows.

### 11.1 Training & Validation Loss Curves

```python
epochs = range(1, 51)

# Simulated data
train_loss = [2.5 * np.exp(-0.08 * e) + 0.05 * np.random.randn() for e in epochs]
val_loss   = [2.5 * np.exp(-0.06 * e) + 0.08 * np.random.randn() + 0.1 for e in epochs]

train_acc  = [1 - 0.9 * np.exp(-0.08 * e) + 0.01 * np.random.randn() for e in epochs]
val_acc    = [1 - 0.9 * np.exp(-0.06 * e) + 0.01 * np.random.randn() - 0.02 for e in epochs]

fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(14, 5))

# Loss
ax1.plot(epochs, train_loss, label='Train Loss', color='royalblue',  linewidth=2)
ax1.plot(epochs, val_loss,   label='Val Loss',   color='tomato',     linewidth=2, linestyle='--')
ax1.set_title("Loss Curves", fontsize=14)
ax1.set_xlabel("Epoch")
ax1.set_ylabel("Loss")
ax1.legend()
ax1.grid(True, alpha=0.3)

# Accuracy
ax2.plot(epochs, train_acc, label='Train Acc', color='forestgreen', linewidth=2)
ax2.plot(epochs, val_acc,   label='Val Acc',   color='darkorange',  linewidth=2, linestyle='--')
ax2.set_title("Accuracy Curves", fontsize=14)
ax2.set_xlabel("Epoch")
ax2.set_ylabel("Accuracy")
ax2.set_ylim(0, 1.05)
ax2.legend()
ax2.grid(True, alpha=0.3)

plt.suptitle("Model Training History", fontsize=16, fontweight='bold')
plt.tight_layout()
plt.show()
```

### 11.2 Confusion Matrix

```python
import numpy as np

# Example confusion matrix (4 classes)
cm = np.array([
    [50, 2,  1,  0],
    [3,  45, 2,  1],
    [1,  2,  48, 3],
    [0,  1,  2,  49]
])

class_names = ['Cat', 'Dog', 'Bird', 'Fish']

fig, ax = plt.subplots(figsize=(7, 6))

im = ax.imshow(cm, interpolation='nearest', cmap='Blues')
fig.colorbar(im, ax=ax)

# Labels
ax.set_xticks(range(len(class_names)))
ax.set_yticks(range(len(class_names)))
ax.set_xticklabels(class_names, rotation=45, ha='right')
ax.set_yticklabels(class_names)

# Annotate cells
thresh = cm.max() / 2.0
for i in range(cm.shape[0]):
    for j in range(cm.shape[1]):
        ax.text(j, i, format(cm[i, j], 'd'),
                ha='center', va='center',
                color='white' if cm[i, j] > thresh else 'black',
                fontsize=12, fontweight='bold')

ax.set_title("Confusion Matrix", fontsize=14)
ax.set_ylabel("True Label")
ax.set_xlabel("Predicted Label")
plt.tight_layout()
plt.show()
```

### 11.3 ROC Curve

```python
from sklearn.datasets import make_classification
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import roc_curve, auc

X, y = make_classification(n_samples=1000, random_state=42)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

model = LogisticRegression()
model.fit(X_train, y_train)
y_scores = model.predict_proba(X_test)[:, 1]

fpr, tpr, thresholds = roc_curve(y_test, y_scores)
roc_auc = auc(fpr, tpr)

fig, ax = plt.subplots(figsize=(7, 6))

ax.plot(fpr, tpr, color='royalblue', linewidth=2.5,
        label=f'ROC Curve (AUC = {roc_auc:.3f})')
ax.plot([0, 1], [0, 1], color='gray', linestyle='--', linewidth=1.5, label='Random Classifier')

ax.fill_between(fpr, tpr, alpha=0.1, color='royalblue')

ax.set_title("ROC Curve", fontsize=14)
ax.set_xlabel("False Positive Rate")
ax.set_ylabel("True Positive Rate")
ax.set_xlim([0, 1])
ax.set_ylim([0, 1.02])
ax.legend(loc='lower right', fontsize=11)
ax.grid(True, alpha=0.3)
plt.tight_layout()
plt.show()
```

### 11.4 Precision-Recall Curve

```python
from sklearn.metrics import precision_recall_curve, average_precision_score

precision, recall, _ = precision_recall_curve(y_test, y_scores)
ap = average_precision_score(y_test, y_scores)

fig, ax = plt.subplots(figsize=(7, 6))

ax.plot(recall, precision, color='tomato', linewidth=2.5,
        label=f'PR Curve (AP = {ap:.3f})')
ax.fill_between(recall, precision, alpha=0.1, color='tomato')
ax.axhline(y=sum(y_test) / len(y_test), color='gray', linestyle='--',
           linewidth=1.5, label='Baseline (Random)')

ax.set_title("Precision-Recall Curve", fontsize=14)
ax.set_xlabel("Recall")
ax.set_ylabel("Precision")
ax.set_xlim([0, 1])
ax.set_ylim([0, 1.02])
ax.legend(fontsize=11)
ax.grid(True, alpha=0.3)
plt.tight_layout()
plt.show()
```

### 11.5 Feature Importance (Random Forest)

```python
from sklearn.ensemble import RandomForestClassifier
from sklearn.datasets import load_iris

iris = load_iris()
X, y = iris.data, iris.target
feature_names = iris.feature_names

rf = RandomForestClassifier(n_estimators=100, random_state=42)
rf.fit(X, y)

importances = rf.feature_importances_
indices = np.argsort(importances)[::-1]  # descending order

fig, ax = plt.subplots(figsize=(8, 4))

colors = ['#4C72B0' if i == indices[0] else '#AEC7E8' for i in range(len(feature_names))]
bars = ax.bar(range(len(feature_names)),
              importances[indices],
              color=colors,
              edgecolor='white')

ax.set_xticks(range(len(feature_names)))
ax.set_xticklabels([feature_names[i] for i in indices], rotation=15, ha='right')

for bar, imp in zip(bars, importances[indices]):
    ax.text(bar.get_x() + bar.get_width() / 2,
            bar.get_height() + 0.002,
            f'{imp:.3f}',
            ha='center', va='bottom', fontsize=10)

ax.set_title("Random Forest Feature Importances", fontsize=14)
ax.set_ylabel("Importance")
ax.grid(axis='y', alpha=0.3)
plt.tight_layout()
plt.show()
```

### 11.6 Decision Boundary (2D Classifier)

```python
from sklearn.svm import SVC
from sklearn.datasets import make_moons

X, y = make_moons(n_samples=300, noise=0.25, random_state=42)

clf = SVC(kernel='rbf', C=1.0)
clf.fit(X, y)

# Create mesh grid
h = 0.02
x_min, x_max = X[:, 0].min() - 0.5, X[:, 0].max() + 0.5
y_min, y_max = X[:, 1].min() - 0.5, X[:, 1].max() + 0.5
xx, yy = np.meshgrid(np.arange(x_min, x_max, h),
                     np.arange(y_min, y_max, h))

Z = clf.predict(np.c_[xx.ravel(), yy.ravel()])
Z = Z.reshape(xx.shape)

fig, ax = plt.subplots(figsize=(9, 6))

ax.contourf(xx, yy, Z, cmap='RdBu', alpha=0.3)
ax.contour(xx, yy, Z, colors='gray', linewidths=0.5)

scatter = ax.scatter(X[:, 0], X[:, 1], c=y, cmap='RdBu',
                     edgecolors='white', linewidths=0.6, s=50)

ax.set_title("SVM Decision Boundary (RBF Kernel)", fontsize=14)
ax.set_xlabel("Feature 1")
ax.set_ylabel("Feature 2")
plt.colorbar(scatter, ax=ax, label='Class')
plt.tight_layout()
plt.show()
```

### 11.7 Learning Curve (Bias-Variance Tradeoff)

```python
from sklearn.model_selection import learning_curve
from sklearn.svm import SVC

train_sizes, train_scores, val_scores = learning_curve(
    SVC(kernel='rbf', C=1), X, y,
    cv=5,
    train_sizes=np.linspace(0.1, 1.0, 10),
    scoring='accuracy'
)

train_mean = train_scores.mean(axis=1)
train_std  = train_scores.std(axis=1)
val_mean   = val_scores.mean(axis=1)
val_std    = val_scores.std(axis=1)

fig, ax = plt.subplots(figsize=(9, 5))

ax.plot(train_sizes, train_mean, 'o-', color='royalblue', label='Training Score',  linewidth=2)
ax.plot(train_sizes, val_mean,   's-', color='tomato',    label='Validation Score', linewidth=2)

ax.fill_between(train_sizes,
                train_mean - train_std,
                train_mean + train_std,
                alpha=0.15, color='royalblue')

ax.fill_between(train_sizes,
                val_mean - val_std,
                val_mean + val_std,
                alpha=0.15, color='tomato')

ax.set_title("Learning Curve", fontsize=14)
ax.set_xlabel("Training Set Size")
ax.set_ylabel("Accuracy")
ax.legend(fontsize=11)
ax.grid(True, alpha=0.3)
plt.tight_layout()
plt.show()
```

### 11.8 Residual Plot (Regression)

```python
from sklearn.linear_model import LinearRegression

np.random.seed(42)
X_reg = np.random.rand(100, 1) * 10
y_reg = 3 * X_reg.ravel() + 5 + np.random.randn(100) * 3

lr = LinearRegression()
lr.fit(X_reg, y_reg)
y_pred = lr.predict(X_reg)
residuals = y_reg - y_pred

fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(13, 5))

# Actual vs Predicted
ax1.scatter(y_pred, y_reg, color='royalblue', alpha=0.7, edgecolors='white')
min_val = min(y_pred.min(), y_reg.min())
max_val = max(y_pred.max(), y_reg.max())
ax1.plot([min_val, max_val], [min_val, max_val], 'r--', linewidth=2, label='Perfect Fit')
ax1.set_title("Actual vs Predicted")
ax1.set_xlabel("Predicted")
ax1.set_ylabel("Actual")
ax1.legend()
ax1.grid(True, alpha=0.3)

# Residuals
ax2.scatter(y_pred, residuals, color='tomato', alpha=0.7, edgecolors='white')
ax2.axhline(y=0, color='black', linestyle='--', linewidth=1.5)
ax2.set_title("Residual Plot")
ax2.set_xlabel("Predicted")
ax2.set_ylabel("Residuals")
ax2.grid(True, alpha=0.3)

plt.suptitle("Linear Regression Diagnostics", fontsize=15, fontweight='bold')
plt.tight_layout()
plt.show()
```

### 11.9 PCA Visualization (Dimensionality Reduction)

```python
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
from sklearn.datasets import load_iris

iris = load_iris()
X_scaled = StandardScaler().fit_transform(iris.data)

pca = PCA(n_components=2)
X_pca = pca.fit_transform(X_scaled)

fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(14, 5))

colors = ['#4C72B0', '#DD8452', '#55A868']
class_names = iris.target_names

# 2D scatter
for i, (cls, color) in enumerate(zip(class_names, colors)):
    mask = iris.target == i
    ax1.scatter(X_pca[mask, 0], X_pca[mask, 1],
                c=color, label=cls, s=60,
                edgecolors='white', linewidths=0.5, alpha=0.85)

ax1.set_title(f"PCA — Iris Dataset\n(Explained Variance: {pca.explained_variance_ratio_.sum():.1%})")
ax1.set_xlabel(f"PC1 ({pca.explained_variance_ratio_[0]:.1%})")
ax1.set_ylabel(f"PC2 ({pca.explained_variance_ratio_[1]:.1%})")
ax1.legend()
ax1.grid(True, alpha=0.3)

# Explained variance scree plot
pca_full = PCA().fit(X_scaled)
cumulative_var = np.cumsum(pca_full.explained_variance_ratio_)

ax2.bar(range(1, len(cumulative_var) + 1),
        pca_full.explained_variance_ratio_,
        color='royalblue', alpha=0.7, label='Individual')
ax2.plot(range(1, len(cumulative_var) + 1),
         cumulative_var, 'o-', color='tomato', linewidth=2, label='Cumulative')
ax2.axhline(y=0.95, color='gray', linestyle='--', alpha=0.7, label='95% Threshold')

ax2.set_title("Scree Plot")
ax2.set_xlabel("Principal Component")
ax2.set_ylabel("Explained Variance Ratio")
ax2.legend()
ax2.grid(True, alpha=0.3)

plt.tight_layout()
plt.show()
```

### 11.10 K-Means Clustering Visualization

```python
from sklearn.cluster import KMeans
from sklearn.datasets import make_blobs

X_blobs, _ = make_blobs(n_samples=300, centers=4, random_state=42, cluster_std=0.8)

kmeans = KMeans(n_clusters=4, random_state=42, n_init=10)
labels = kmeans.fit_predict(X_blobs)
centers = kmeans.cluster_centers_

colors_cluster = ['#4C72B0', '#DD8452', '#55A868', '#C44E52']

fig, ax = plt.subplots(figsize=(8, 6))

for i in range(4):
    mask = labels == i
    ax.scatter(X_blobs[mask, 0], X_blobs[mask, 1],
               c=colors_cluster[i], label=f'Cluster {i+1}',
               s=50, alpha=0.75, edgecolors='white', linewidths=0.5)

# Plot centroids
ax.scatter(centers[:, 0], centers[:, 1],
           marker='*', s=400, c='black', zorder=10, label='Centroids')

ax.set_title("K-Means Clustering (k=4)", fontsize=14)
ax.set_xlabel("Feature 1")
ax.set_ylabel("Feature 2")
ax.legend()
ax.grid(True, alpha=0.3)
plt.tight_layout()
plt.show()
```

---

## 12. Saving & Exporting Figures

### 12.1 savefig()

```python
fig, ax = plt.subplots()
ax.plot([1, 2, 3], [4, 5, 3])

# PNG — for web/presentations
fig.savefig('plot.png', dpi=150, bbox_inches='tight')

# High-resolution PNG (for print)
fig.savefig('plot_hires.png', dpi=300, bbox_inches='tight')

# SVG — vector, scalable
fig.savefig('plot.svg', bbox_inches='tight')

# PDF — publication quality
fig.savefig('plot.pdf', bbox_inches='tight')

# Transparent background
fig.savefig('plot_transparent.png', dpi=150, bbox_inches='tight', transparent=True)
```

| Format | Best for |
|--------|----------|
| `.png` | Web, notebooks, presentations |
| `.svg` | Logos, icons, scalable graphics |
| `.pdf` | Academic papers, print |
| `.eps` | LaTeX documents |

### 12.2 Save to Buffer (In-Memory)

```python
import io

buf = io.BytesIO()
fig.savefig(buf, format='png', dpi=150, bbox_inches='tight')
buf.seek(0)
image_bytes = buf.read()   # ready to send over a network or embed
```

---

## 13. Quick Reference Cheat Sheet

### Figure & Axes Setup

```python
fig, ax = plt.subplots(figsize=(10, 6))       # single plot
fig, axes = plt.subplots(2, 3, figsize=(15, 8)) # grid of plots
```

### Most-Used Methods on `ax`

```python
ax.plot(x, y)                       # line plot
ax.scatter(x, y)                    # scatter plot
ax.bar(x, height)                   # vertical bar
ax.barh(y, width)                   # horizontal bar
ax.hist(data, bins=30)              # histogram
ax.boxplot(data)                    # box plot
ax.violinplot(data)                 # violin plot
ax.imshow(matrix, cmap='Blues')     # heatmap / image
ax.contourf(X, Y, Z)                # filled contour
ax.errorbar(x, y, yerr=e)           # error bars
ax.fill_between(x, y1, y2)         # shaded region
ax.stackplot(x, y1, y2, y3)        # stacked area

ax.set_title("Title")
ax.set_xlabel("X Label")
ax.set_ylabel("Y Label")
ax.set_xlim(0, 10)
ax.set_ylim(-1, 1)
ax.set_xticks([0, 5, 10])
ax.set_xticklabels(['Low', 'Mid', 'High'])
ax.legend()
ax.grid(True, alpha=0.3)
ax.axhline(y=0, color='gray', linestyle='--')
ax.axvline(x=5, color='red')
ax.axvspan(x1, x2, alpha=0.2, color='gold')
ax.annotate('text', xy=(x, y), xytext=(xt, yt), arrowprops={...})
ax.text(x, y, 'text', ha='center')
ax.invert_xaxis()
ax.invert_yaxis()
ax.set_aspect('equal')
```

### Common `plot()` Parameters

```python
ax.plot(x, y,
    color='royalblue',       # or '#hex' or (r,g,b)
    linewidth=2,             # line thickness
    linestyle='--',          # '-' '--' '-.' ':'
    marker='o',              # 'o' 's' '^' 'D' 'x' '*'
    markersize=6,
    markerfacecolor='white',
    markeredgecolor='blue',
    alpha=0.8,               # transparency
    label='Series 1',        # for legend
    zorder=3,                # drawing order
)
```

### Color Maps (cmap)

| Use Case | Recommended cmaps |
|----------|------------------|
| Sequential | `viridis`, `plasma`, `Blues`, `Greens` |
| Diverging | `coolwarm`, `RdBu`, `seismic` |
| Categorical | `tab10`, `Set1`, `Paired` |
| Perceptual (accessible) | `viridis`, `cividis`, `turbo` |

### Layout Helpers

```python
plt.tight_layout()             # auto-fix spacing
plt.subplots_adjust(hspace=0.4, wspace=0.3)
plt.suptitle("Super Title", fontsize=16, y=1.02)
fig.autofmt_xdate()            # rotate date tick labels
```

### Debugging Tips

```python
# See what's in the axes
print(ax.get_lines())
print(ax.get_children())

# Check figure size
print(fig.get_size_inches())

# Save before show (show clears the figure)
fig.savefig('output.png', bbox_inches='tight')
plt.show()
```

---

## 📝 Key Recall Concepts

| Concept | One-liner |
|---------|-----------|
| `Figure` vs `Axes` | Figure = canvas, Axes = single plot inside |
| `plt` vs `ax` | plt is global shortcut; ax is the OOP approach (preferred) |
| `tight_layout()` | Prevents labels from overlapping each other |
| `bbox_inches='tight'` | Prevents labels from being cropped on save |
| `dpi` | Dots per inch — higher = sharper image (use 150–300) |
| `alpha` | Transparency 0.0 (invisible) → 1.0 (fully opaque) |
| `zorder` | Controls draw order; higher = drawn on top |
| `cmap` | Color map for continuous data; use `viridis` by default |
| `sharex/sharey` | Sync axis scales across subplots |
| `rcParams` | Global style defaults — set once, applies to all plots |

---
*last updated on april 29,2026*
*Made with ❤️ for data scientists and ML engineers*  
*Matplotlib Docs: https://matplotlib.org/stable/api/*
