# 🔢 NumPy Master Notes
> **Complete Reference for Data Analysis & Basic ML** — Concept + Code + Recall

---

## 📚 Table of Contents

1. [Setup & Import](#1-setup--import)
2. [Array Creation](#2-array-creation)
3. [Array Anatomy & Attributes](#3-array-anatomy--attributes)
4. [Data Types (dtype)](#4-data-types-dtype)
5. [Vectorized Operations](#5-vectorized-operations)
6. [Universal Functions (ufuncs)](#6-universal-functions-ufuncs)
7. [Boolean & Comparison Operations](#7-boolean--comparison-operations)
8. [Indexing & Slicing](#8-indexing--slicing)
9. [Fancy & Boolean Indexing](#9-fancy--boolean-indexing)
10. [Views vs Copies](#10-views-vs-copies)
11. [Math & Statistics](#11-math--statistics)
12. [Sorting & Searching](#12-sorting--searching)
13. [Set Operations](#13-set-operations)
14. [Reshape, Flatten & Transpose](#14-reshape-flatten--transpose)
15. [Stacking & Splitting](#15-stacking--splitting)
16. [Broadcasting](#16-broadcasting)
17. [Linear Algebra (np.linalg)](#17-linear-algebra-nplinalg)
18. [ML Pattern: Normalization & Standardization](#18-ml-pattern-normalization--standardization)
19. [ML Pattern: Train/Test Split](#19-ml-pattern-traintest-split)
20. [ML Pattern: Distance Metrics](#20-ml-pattern-distance-metrics)
21. [ML Pattern: Linear Regression from Scratch](#21-ml-pattern-linear-regression-from-scratch)
22. [ML Pattern: Activation Functions & Loss](#22-ml-pattern-activation-functions--loss)
23. [ML Pattern: One-Hot Encoding & Softmax](#23-ml-pattern-one-hot-encoding--softmax)
24. [ML Pattern: Weight Initialization](#24-ml-pattern-weight-initialization)
25. [Random Number Generation](#25-random-number-generation)
26. [Performance Tips](#26-performance-tips)
27. [Quick Recall Cheatsheet](#27-quick-recall-cheatsheet)

---

## 1. Setup & Import

```python
import numpy as np
```

> **💡 Concept:** `np` is the universal alias. Every NumPy function lives under `np.*`. This alias is used everywhere in the Python ecosystem — always use it.

---

## 2. Array Creation

### From Python sequences

```python
np.array([1, 2, 3])              # 1D array from list
np.array((1, 2, 3))              # from tuple — same result
np.array([[1, 2, 3],             # 2D array (matrix) from nested list
          [4, 5, 6]])
np.array([1, 2, 3], dtype=float) # specify type at creation
```

### Pre-filled arrays

```python
np.zeros((3, 4))        # 3×4 matrix of 0.0
np.ones((2, 3))         # 2×3 matrix of 1.0
np.full((2, 2), 7)      # 2×2 matrix filled with 7
np.empty((3, 3))        # uninitialized — fast but contains garbage values
np.eye(3)               # 3×3 identity matrix (1s on diagonal, 0s elsewhere)
np.identity(3)          # same as eye(3) — square only
np.diag([1, 2, 3])     # matrix with values on diagonal
```

### Range-based arrays

```python
np.arange(10)           # [0, 1, 2, ..., 9] — like Python range()
np.arange(2, 10)        # [2, 3, ..., 9]
np.arange(0, 10, 2)     # [0, 2, 4, 6, 8] — with step
np.arange(0, 1, 0.1)    # float steps (use linspace for precision)

np.linspace(0, 1, 5)    # [0, 0.25, 0.5, 0.75, 1.0] — 5 evenly spaced, INCLUDES endpoint
np.linspace(0, 1, 5, endpoint=False)  # excludes endpoint
np.logspace(0, 3, 4)    # [1, 10, 100, 1000] — logarithmically spaced
```

### Random arrays

```python
np.random.rand(3, 3)          # uniform random [0, 1)
np.random.randn(3, 3)         # standard normal distribution N(0, 1)
np.random.randint(0, 10, (5,))# random integers in [0, 10)
np.random.choice([1,2,3,4], 3)# random sample from array
```

> **💡 Concept:** `zeros`, `ones`, `full`, `empty` take a **tuple** for shape — e.g., `(3, 4)` not `3, 4`.  
> `arange` is like Python's `range` but returns an array. Use `linspace` when you need a specific number of points between two values (it's more numerically precise for floats).

---

## 3. Array Anatomy & Attributes

```python
a = np.array([[1, 2, 3],
              [4, 5, 6]])

a.shape     # (2, 3)   — tuple of dimension sizes (rows, cols)
a.ndim      # 2        — number of dimensions (axes)
a.size      # 6        — total number of elements (product of shape)
a.dtype     # int64    — type of each element
a.itemsize  # 8        — bytes per element (int64 = 8 bytes)
a.nbytes    # 48       — total memory = size × itemsize
a.T         # [[1,4],[2,5],[3,6]] — transpose (swaps axes)
```

> **💡 Concept:**  
> - `shape` tells you the structure. `(2, 3)` → 2 rows, 3 columns.  
> - `ndim = len(shape)` — 1D arrays have `ndim=1`, matrices have `ndim=2`, tensors `ndim=3+`.  
> - `size = np.prod(shape)` — always the total count of elements.  
> - **Memory formula:** `nbytes = size × itemsize`

---

## 4. Data Types (dtype)

```python
# Specifying dtype at creation
np.array([1, 2, 3], dtype=np.float32)
np.array([1, 2, 3], dtype=np.int8)
np.array([True, False, True], dtype=bool)

# Casting to a new dtype
a = np.array([1, 2, 3])
a.astype(np.float64)   # returns a new array
a.astype(np.float32)   # downcast for memory savings
a.astype(str)          # convert to string array

# Checking dtype
a.dtype          # dtype('int64')
a.dtype.name     # 'int64'
a.dtype.itemsize # 8
```

### Common dtypes reference

| dtype | Description | Bytes | Range |
|-------|-------------|-------|-------|
| `int8` | Signed integer | 1 | -128 to 127 |
| `int32` | Signed integer | 4 | ±2.1 billion |
| `int64` | Signed integer (default) | 8 | ±9.2 × 10¹⁸ |
| `float32` | Single precision float | 4 | ~7 decimal digits |
| `float64` | Double precision (default) | 8 | ~15 decimal digits |
| `bool` | Boolean | 1 | True / False |
| `complex128` | Complex number | 16 | — |

> **💡 ML tip:** Use `float32` instead of `float64` to halve memory usage. GPUs (CUDA) natively work in float32 — most deep learning frameworks default to it. Switching from float64 → float32 can speed up computation 2–4×.

---

## 5. Vectorized Operations

NumPy applies operations to **every element simultaneously** without Python for-loops. This is called vectorization and is the primary reason NumPy is fast.

```python
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])

# Arithmetic — all elementwise
a + b       # [5, 7, 9]
a - b       # [-3, -3, -3]
a * b       # [4, 10, 18]  — NOT matrix multiplication
a / b       # [0.25, 0.4, 0.5]
a // b      # [0, 0, 0]     — floor division
a % b       # [1, 2, 3]     — modulo
a ** 2      # [1, 4, 9]     — power
-a          # [-1, -2, -3]  — negation

# Scalar operations (broadcast scalar to every element)
a + 10      # [11, 12, 13]
a * 2       # [2, 4, 6]
a / 2.0     # [0.5, 1.0, 1.5]
a > 2       # [False, False, True]

# Math functions (elementwise)
np.sqrt(a)     # [1.0, 1.414, 1.732]
np.exp(a)      # [e¹, e², e³]
np.log(a)      # natural log
np.log2(a)     # log base 2
np.log10(a)    # log base 10
np.abs(a)      # absolute value
np.square(a)   # same as a**2
np.cbrt(a)     # cube root
```

> **💡 Concept:** Vectorization replaces:
> ```python
> # Slow Python loop
> result = [a[i] + b[i] for i in range(len(a))]
> 
> # Fast NumPy — operates in compiled C under the hood
> result = a + b
> ```
> The speedup is typically 10–100× for large arrays.

---

## 6. Universal Functions (ufuncs)

Ufuncs are NumPy functions that operate elementwise and support broadcasting. They are implemented in C and are very fast.

```python
a = np.array([1.0, 2.0, 3.0])
b = np.array([4.0, 5.0, 6.0])

# Rounding
np.floor(a)          # round down: [1.0, 2.0, 3.0]
np.ceil(a)           # round up
np.round(a, 2)       # round to 2 decimal places
np.trunc(a)          # truncate toward zero

# Comparison (elementwise min/max)
np.maximum(a, b)     # [4., 5., 6.] — elementwise max
np.minimum(a, b)     # [1., 2., 3.] — elementwise min
np.fmax(a, b)        # like maximum but ignores NaN

# Clipping
np.clip(a, 1.5, 2.5) # [1.5, 2.0, 2.5] — clamp to [min, max]

# Sign
np.sign(np.array([-3, 0, 5]))  # [-1, 0, 1]

# Conditional (vectorized if-else)
np.where(a > 2, 1, 0)  # [0, 0, 1] — condition ? if_true : if_false
np.where(a > 2, a, 0)  # [0., 0., 3.] — keep value if condition else 0

# Trig
np.sin(a); np.cos(a); np.tan(a)
np.arcsin(a); np.arccos(a); np.arctan(a)
np.arctan2(y, x)  # angle of vector — handles quadrant correctly

# Hyperbolic
np.sinh(a); np.cosh(a); np.tanh(a)
```

> **💡 `np.where` is your vectorized if-else.** It's essential for feature engineering, masking values, and implementing activations like ReLU:
> ```python
> relu = lambda z: np.where(z > 0, z, 0)
> # or equivalently:
> relu = lambda z: np.maximum(0, z)
> ```

---

## 7. Boolean & Comparison Operations

```python
a = np.array([1, 2, 3, 4, 5])

# Comparison operators return boolean arrays
a > 2         # [F, F, T, T, T]
a < 2         # [T, F, F, F, F]
a >= 2        # [F, T, T, T, T]
a <= 2        # [T, T, F, F, F]
a == 2        # [F, T, F, F, F]
a != 2        # [T, F, T, T, T]

# Combining conditions — MUST use &, |, ~ (NOT and/or/not)
(a > 2) & (a < 5)   # [F, F, T, T, F]  — AND
(a < 2) | (a > 4)   # [T, F, F, F, T]  — OR
~(a > 2)            # [T, T, F, F, F]  — NOT

# Reduction
np.any(a > 4)       # True  — at least one element satisfies condition
np.all(a > 0)       # True  — all elements satisfy condition
np.count_nonzero(a > 2)  # 3 — count True values

# Comparing two arrays
np.array_equal(a, b)       # True if same shape and all elements equal
np.allclose(a, b, atol=1e-8)  # True if all elements close (for floats)
```

> **⚠️ Critical gotcha:** `a > 1 and a < 5` raises a ValueError because Python's `and` tries to evaluate the truth of an array (ambiguous). Always use `(a > 1) & (a < 5)` — with parentheses, because `&` has higher precedence than `>`.

---

## 8. Indexing & Slicing

### 1D indexing

```python
a = np.array([10, 20, 30, 40, 50])

a[0]        # 10    — first element
a[-1]       # 50    — last element
a[-2]       # 40    — second to last
a[1:4]      # [20, 30, 40]   — start:stop (stop exclusive)
a[:3]       # [10, 20, 30]   — from start to index 3
a[2:]       # [30, 40, 50]   — from index 2 to end
a[::2]      # [10, 30, 50]   — every 2nd element
a[1::2]     # [20, 40]       — every 2nd starting at index 1
a[::-1]     # [50, 40, 30, 20, 10] — reversed
a[1:4:2]    # [20, 40]       — start:stop:step
```

### 2D indexing

```python
m = np.array([[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]])

m[0, 2]         # 3        — row 0, col 2
m[1, :]         # [4,5,6]  — entire row 1  (: means "all")
m[:, 0]         # [1,4,7]  — entire col 0
m[0:2, 1:3]     # [[2,3],[5,6]] — submatrix rows 0-1, cols 1-2
m[-1, :]        # [7,8,9]  — last row
m[:, -1]        # [3,6,9]  — last column
m[::2, ::2]     # [[1,3],[7,9]] — every other row and col

# Setting values
m[0, :] = 0     # set entire row 0 to zero
m[:, 1] = 99    # set entire col 1 to 99
```

> **💡 Concept:** Think of `m[row_selector, col_selector]`. The comma separates axes. `:` means "take everything along this axis". For N-dimensional arrays, you have N selectors separated by commas.

---

## 9. Fancy & Boolean Indexing

### Fancy indexing — select specific indices

```python
a = np.array([10, 20, 30, 40, 50])

# Integer array indexing
a[[0, 2, 4]]           # [10, 30, 50] — picks indices 0, 2, 4
a[[3, 1, 2]]           # [40, 20, 30] — any order, duplicates allowed
a[[0, 0, 2]]           # [10, 10, 30] — duplicates OK

# 2D fancy indexing
m = np.array([[1,2,3],[4,5,6],[7,8,9]])
m[[0, 2], :]           # rows 0 and 2: [[1,2,3],[7,8,9]]
m[:, [0, 2]]           # cols 0 and 2: [[1,3],[4,6],[7,9]]
m[[0, 1], [2, 0]]      # [(row0,col2), (row1,col0)] = [3, 4]
```

### Boolean indexing — filter by condition

```python
a = np.array([10, 20, 30, 40, 50])

mask = a > 25
mask               # [F, F, T, T, T]
a[mask]            # [30, 40, 50] — only True elements
a[a > 25]          # [30, 40, 50] — inline, same result

# Multiple conditions
a[(a > 15) & (a < 45)]  # [20, 30, 40]

# Modify values with boolean mask
a[a > 40] = 0       # replaces values > 40 with 0

# Find indices where condition is True
np.where(a > 25)         # (array([2, 3, 4]),) — indices
np.argwhere(a > 25)      # [[2],[3],[4]] — column vector of indices
np.nonzero(a > 25)       # same as where
```

> **💡 Think of boolean indexing as a WHERE clause in SQL:**
> ```python
> # SQL: SELECT value FROM table WHERE value > 25
> a[a > 25]
> ```

---

## 10. Views vs Copies

This is one of the most important and commonly misunderstood concepts in NumPy.

```python
a = np.array([1, 2, 3, 4, 5])

# ── VIEWS (share memory with original) ──────────────────────
b = a[1:4]      # slicing → view
b[0] = 99
print(a)        # [1, 99, 3, 4, 5] — original CHANGED!

b = a.view()    # explicit view
b = a.T         # transpose is a view
b = a.reshape(1, -1)  # reshape is usually a view

# Check if two arrays share memory
np.shares_memory(a, b)  # True for views

# ── COPIES (independent, don't affect original) ──────────────
c = a.copy()        # explicit copy — always independent
c = a[a > 2]        # boolean indexing → copy
c = a[[0, 2]]       # fancy indexing → copy
c = a.flatten()     # always returns copy (ravel() returns view when possible)
c = np.array(a)     # constructing new array → copy

# Modifying c won't change a
c[0] = 0
print(a)  # unchanged
```

### When does slicing return a view vs copy?

| Operation | Returns |
|-----------|---------|
| `a[1:4]` — basic slice | **View** |
| `a[::2]` — strided slice | **View** |
| `a.T`, `a.reshape(...)` | **View** (usually) |
| `a[[0,2]]` — fancy index | **Copy** |
| `a[a > 2]` — boolean index | **Copy** |
| `a.flatten()` | **Copy** |
| `a.copy()` | **Copy** (explicit) |

> **💡 Rule of thumb:** When in doubt, call `.copy()`. The cost is small compared to debugging mysterious data mutations.

---

## 11. Math & Statistics

### Aggregation functions — axis is everything

```python
a = np.array([[1, 2, 3],
              [4, 5, 6]])

# Global (no axis) — reduces to a scalar
a.sum()          # 21
a.mean()         # 3.5
a.min()          # 1
a.max()          # 6
a.std()          # standard deviation
a.var()          # variance
np.median(a)     # 3.5

# axis=0 — collapse rows, result has shape (ncols,)
a.sum(axis=0)    # [5, 7, 9]  — sum of each COLUMN
a.mean(axis=0)   # [2.5, 3.5, 4.5]
a.max(axis=0)    # [4, 5, 6]  — max per column

# axis=1 — collapse columns, result has shape (nrows,)
a.sum(axis=1)    # [6, 15]    — sum of each ROW
a.mean(axis=1)   # [2., 5.]
a.max(axis=1)    # [3, 6]     — max per row

# keepdims — preserve shape for broadcasting
a.sum(axis=1, keepdims=True)  # [[6],[15]] shape (2,1) not (2,)
```

### Finding positions

```python
a.argmin()          # index of minimum element (flattened)
a.argmax()          # index of maximum element (flattened)
a.argmin(axis=0)    # per-column index of minimum
a.argmax(axis=1)    # per-row index of maximum
```

### Statistics

```python
a = np.array([4, 2, 7, 1, 9, 3])

np.median(a)              # 3.5 — middle value
np.percentile(a, 25)      # 25th percentile (Q1)
np.percentile(a, 75)      # 75th percentile (Q3)
np.quantile(a, 0.75)      # same as percentile(a, 75)

np.cumsum(a)              # [4, 6, 13, 14, 23, 26] — running sum
np.cumprod(a)             # running product
np.diff(a)                # [−2, 5, −6, 8, −6] — consecutive differences

np.corrcoef(a, b)         # 2×2 correlation matrix
np.cov(a, b)              # 2×2 covariance matrix
np.histogram(a, bins=5)   # (counts, bin_edges)
```

> **💡 Axis memory trick:**  
> - `axis=0` → you're collapsing **down** through rows → result is one value per **column**  
> - `axis=1` → you're collapsing **across** columns → result is one value per **row**  
> Think "which axis disappears" after the operation.

---

## 12. Sorting & Searching

```python
a = np.array([3, 1, 4, 1, 5, 9, 2, 6])

np.sort(a)               # [1,1,2,3,4,5,6,9] — returns sorted copy
a.sort()                 # sorts in-place, returns None

np.argsort(a)            # [1,3,6,0,2,4,7,5] — INDICES that would sort
# Use argsort to sort another array by a's order:
b = np.array(['e','a','c','b','f','g','d','h'])
b[np.argsort(a)]         # sorts b by a's sorted order

# 2D sorting
m = np.array([[3,1],[4,2]])
np.sort(m, axis=0)       # sort each column
np.sort(m, axis=1)       # sort each row

# Finding values
np.unique(a)                         # [1,2,3,4,5,6,9] — unique sorted values
np.unique(a, return_counts=True)     # (values, counts)
np.unique(a, return_index=True)      # (values, first_occurrence_indices)

np.searchsorted([1,2,3,4,5], 3)     # 2 — binary search index to insert 3
np.searchsorted([1,2,3,4,5], 3, side='right')  # 3

# Partial sort (faster than full sort when you only need top-k)
np.partition(a, 3)       # element at index 3 is in its sorted position
np.argpartition(a, 3)    # indices version
```

> **💡 `argsort` is extremely powerful.** It gives you the rank ordering of elements. Use it to reorder one array by another array's sorted order — common in k-NN (finding nearest neighbors by distance).

---

## 13. Set Operations

```python
a = np.array([1, 2, 3, 4, 5])
b = np.array([3, 4, 5, 6, 7])

np.intersect1d(a, b)     # [3, 4, 5]   — elements in BOTH
np.union1d(a, b)         # [1,2,3,4,5,6,7] — all unique from both
np.setdiff1d(a, b)       # [1, 2]      — in a but NOT in b
np.setdiff1d(b, a)       # [6, 7]      — in b but NOT in a
np.in1d(a, b)            # [F,F,T,T,T] — is each element of a in b?
np.isin(a, b)            # same, but supports multi-dimensional arrays
```

---

## 14. Reshape, Flatten & Transpose

### Reshaping

```python
a = np.arange(12)  # [0, 1, 2, ..., 11]

a.reshape(3, 4)    # (3,4) — must keep size=12
a.reshape(4, 3)    # (4,3)
a.reshape(2, 2, 3) # (2,2,3) — 3D
a.reshape(3, -1)   # -1 = infer: (3,4) because 12/3=4
a.reshape(-1, 4)   # infer: (3,4)
a.reshape(-1, 1)   # column vector (12,1) — very common in ML
a.reshape(1, -1)   # row vector (1,12)
a.reshape(-1)      # flatten to 1D (12,)
```

### Flattening

```python
a = np.array([[1,2],[3,4]])

a.flatten()    # [1,2,3,4] — always returns a COPY
a.ravel()      # [1,2,3,4] — returns VIEW if possible (faster)
a.reshape(-1)  # [1,2,3,4] — same as ravel
```

### Adding/removing dimensions

```python
a = np.array([1, 2, 3])  # shape (3,)

a[np.newaxis, :]    # shape (1,3) — add axis at front
a[:, np.newaxis]    # shape (3,1) — add axis at back → column vector

np.expand_dims(a, axis=0)   # same as a[np.newaxis, :]
np.expand_dims(a, axis=1)   # same as a[:, np.newaxis]

b = np.array([[[1,2,3]]])   # shape (1,1,3)
np.squeeze(b)               # (3,) — remove all size-1 dimensions
np.squeeze(b, axis=0)       # (1,3) — remove only axis 0
```

### Transpose

```python
m = np.array([[1,2,3],[4,5,6]])  # shape (2,3)

m.T              # shape (3,2) — swap axes
np.transpose(m)  # same
np.transpose(m, axes=(1,0))  # same — specify axis order explicitly

# For 3D+ arrays
t = np.random.rand(2, 3, 4)  # shape (2,3,4)
t.transpose(1, 0, 2)         # shape (3,2,4) — permute axes
```

> **💡 ML critical patterns:**
> ```python
> X.reshape(-1, 1)   # single feature → sklearn needs (n, 1) shape
> X.reshape(1, -1)   # single sample → (1, n_features)
> X.T                # transpose design matrix for matrix operations
> ```

---

## 15. Stacking & Splitting

### Stacking (combining arrays)

```python
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])

# 1D arrays
np.concatenate([a, b])     # [1,2,3,4,5,6] — join end-to-end
np.vstack([a, b])          # [[1,2,3],[4,5,6]] — stack as rows (2,3)
np.hstack([a, b])          # [1,2,3,4,5,6] — horizontal join
np.stack([a, b], axis=0)   # [[1,2,3],[4,5,6]] shape (2,3) — new axis
np.stack([a, b], axis=1)   # [[1,4],[2,5],[3,6]] shape (3,2) — new axis

# 2D arrays
A = np.array([[1,2],[3,4]])
B = np.array([[5,6],[7,8]])
np.vstack([A, B])          # [[1,2],[3,4],[5,6],[7,8]] shape (4,2)
np.hstack([A, B])          # [[1,2,5,6],[3,4,7,8]] shape (2,4)
np.concatenate([A, B], axis=0)  # same as vstack
np.concatenate([A, B], axis=1)  # same as hstack
```

### Splitting

```python
a = np.arange(9)
np.split(a, 3)                # [array([0,1,2]), array([3,4,5]), array([6,7,8])]
np.split(a, [3, 6])           # split at indices 3 and 6
np.array_split(a, 4)          # allows unequal chunks (unlike split)
np.hsplit(m, 3)               # split 2D array horizontally
np.vsplit(m, 3)               # split 2D array vertically
```

> **💡 Quick memory aid:**
> - `vstack` → **rows** grow (vertical growth)
> - `hstack` → **cols** grow (horizontal growth)
> - `stack` → creates a **new dimension** (neither row nor col growth)

---

## 16. Broadcasting

Broadcasting lets NumPy perform arithmetic between arrays of **different shapes** by "stretching" the smaller array — without making copies of data.

### Broadcasting rules

1. Align shapes **from the right**
2. Dimensions must be **equal** or **one of them must be 1**
3. Size-1 dimensions are stretched (broadcast) to match the other

```python
# Example 1: array + scalar
a = np.array([[1, 2, 3],
              [4, 5, 6]])   # shape (2,3)
a + 10                       # 10 broadcast to (2,3) → [[11,12,13],[14,15,16]]

# Example 2: 2D + 1D
b = np.array([10, 20, 30])   # shape (3,)
a + b                         # b broadcast to (2,3) → adds row-wise
# [[11,22,33],[14,25,36]]

# Example 3: column vector + row vector
col = np.array([[1],[2]])    # shape (2,1)
row = np.array([10,20,30])   # shape (3,)
col + row                     # result shape (2,3)
# [[11,21,31],[12,22,32]]

# Example 4: 3D broadcasting
X = np.random.rand(4, 3, 2)  # shape (4,3,2)
b = np.random.rand(3, 1)      # shape (3,1)
X + b                          # b broadcast to (4,3,2) — valid!
```

### Shape compatibility cheatsheet

```
(2, 3)  +  (3,)    →  (2, 3)   ✅ right-align: (2,3) vs (1,3)
(2, 3)  +  (2, 1)  →  (2, 3)   ✅
(2, 3)  +  (2,)    →  ERROR    ❌ right-align: (2,3) vs (1,2) — 3≠2
(3, 1)  +  (1, 4)  →  (3, 4)   ✅ both dimensions broadcast
```

> **💡 Practical use:** Broadcasting is used constantly in ML for:
> ```python
> # Subtract mean from each feature (column) — no loops needed
> X - X.mean(axis=0)          # (n,p) - (p,) → broadcasts correctly
> 
> # Divide each sample by its norm — keepdims preserves shape for broadcast
> norms = np.linalg.norm(X, axis=1, keepdims=True)  # (n,1)
> X / norms                    # (n,p) / (n,1) → broadcasts correctly
> ```

---

## 17. Linear Algebra (np.linalg)

### Matrix operations

```python
A = np.array([[1, 2],
              [3, 4]], dtype=float)
B = np.array([[5, 6],
              [7, 8]], dtype=float)

# Matrix multiplication — use @ operator (Python 3.5+)
A @ B            # [[19,22],[43,50]] — matrix product
np.dot(A, B)     # same as @
np.matmul(A, B)  # same as @
A * B            # [[5,12],[21,32]] — elementwise, NOT matrix multiply!

# Vector operations
a = np.array([1., 2., 3.])
b = np.array([4., 5., 6.])
np.dot(a, b)       # 32.0 — dot product
np.outer(a, b)     # (3,3) — outer product: a[:, newaxis] * b[newaxis, :]
np.cross(a, b)     # cross product (3D only)
np.inner(a, b)     # same as dot for 1D
```

### Matrix analysis

```python
np.linalg.det(A)           # -2.0  — determinant
np.linalg.matrix_rank(A)   # 2     — rank
np.trace(A)                # 5.0   — sum of diagonal elements
np.linalg.norm(A)          # Frobenius norm (default)
np.linalg.norm(A, ord=2)   # spectral norm (largest singular value)
np.linalg.norm(a)          # L2/Euclidean norm of vector
np.linalg.norm(a, ord=1)   # L1/Manhattan norm
np.linalg.norm(a, ord=np.inf)  # L∞/max norm
```

### Solving systems

```python
# Solve Ax = b
A = np.array([[2., 1.], [1., 3.]])
b = np.array([5., 10.])

x = np.linalg.solve(A, b)     # faster and more stable than inv(A) @ b
x = np.linalg.inv(A) @ b      # works but avoid — numerically less stable

# Least squares (overdetermined system, more equations than unknowns)
x, residuals, rank, sv = np.linalg.lstsq(A, b, rcond=None)
```

### Matrix decompositions

```python
# Eigendecomposition: A = V @ diag(vals) @ V⁻¹
vals, vecs = np.linalg.eig(A)      # eigenvalues, eigenvectors (columns)
vals, vecs = np.linalg.eigh(A)     # for symmetric/Hermitian A — more stable

# Singular Value Decomposition: A = U @ diag(S) @ Vt
U, S, Vt = np.linalg.svd(A)        # full SVD
U, S, Vt = np.linalg.svd(A, full_matrices=False)  # economy SVD

# Reconstruct from SVD
A_reconstructed = U @ np.diag(S) @ Vt

# Low-rank approximation (PCA-like)
k = 1
A_lowrank = U[:, :k] @ np.diag(S[:k]) @ Vt[:k, :]

# QR decomposition: A = Q @ R
Q, R = np.linalg.qr(A)

# Cholesky decomposition: A = L @ L.T  (A must be positive definite)
L = np.linalg.cholesky(A)
```

> **💡 Key rule:** Use `np.linalg.solve(A, b)` instead of `np.linalg.inv(A) @ b`. Both compute the solution to Ax=b, but `solve` is O(n²) faster and numerically more stable — computing the full inverse amplifies floating-point errors.

---

## 18. ML Pattern: Normalization & Standardization

```python
X = np.array([[1., 2.],
              [3., 4.],
              [5., 6.]])  # shape (n_samples, n_features)

# ── Min-Max Normalization → scales to [0, 1] ────────────────
X_min = X.min(axis=0)       # per-feature min
X_max = X.max(axis=0)       # per-feature max
X_norm = (X - X_min) / (X_max - X_min)

# ── Z-Score Standardization → mean=0, std=1 ─────────────────
X_mean = X.mean(axis=0)     # per-feature mean
X_std  = X.std(axis=0)      # per-feature std
X_scaled = (X - X_mean) / X_std
# Use ddof=1 for sample std (Bessel's correction):
X_scaled_sample = (X - X_mean) / X.std(axis=0, ddof=1)

# ── L2 Normalization → unit vectors ─────────────────────────
norms = np.linalg.norm(X, axis=1, keepdims=True)  # per-sample norm, shape (n,1)
X_l2 = X / norms              # each row has unit L2 norm

# ── L1 Normalization ─────────────────────────────────────────
norms_l1 = np.sum(np.abs(X), axis=1, keepdims=True)
X_l1 = X / norms_l1

# ── Robust Scaling (IQR-based, handles outliers) ────────────
Q1 = np.percentile(X, 25, axis=0)
Q3 = np.percentile(X, 75, axis=0)
IQR = Q3 - Q1
median = np.median(X, axis=0)
X_robust = (X - median) / IQR
```

> **💡 When to use each:**
> - **Min-max:** When you need values in [0,1], e.g., pixel values, neural net inputs
> - **Z-score:** When features have different scales and you want zero mean — most common
> - **L2 norm:** Text features (TF-IDF), cosine similarity applications
> - **Robust:** When data has outliers that would corrupt min/max or std

---

## 19. ML Pattern: Train/Test Split

```python
X = np.random.rand(100, 5)   # 100 samples, 5 features
y = np.random.randint(0, 2, 100)  # binary labels

# ── Simple shuffle split ─────────────────────────────────────
np.random.seed(42)           # set seed for reproducibility

n = len(X)
indices = np.random.permutation(n)  # shuffled index array [0..n-1]
split = int(0.8 * n)         # 80% train, 20% test

train_idx = indices[:split]
test_idx  = indices[split:]

X_train, X_test = X[train_idx], X[test_idx]
y_train, y_test = y[train_idx], y[test_idx]

# ── K-Fold Cross Validation ──────────────────────────────────
k = 5
fold_size = n // k
folds = np.array_split(indices, k)  # split indices into k groups

for i in range(k):
    val_idx   = folds[i]
    train_idx = np.concatenate([folds[j] for j in range(k) if j != i])
    X_tr, X_val = X[train_idx], X[val_idx]
    y_tr, y_val = y[train_idx], y[val_idx]
    # ... train and evaluate model
```

> **💡 Always set `np.random.seed(seed)` before any randomness in experiments.** This makes results reproducible. If using the modern API (`np.random.default_rng`), pass the seed to the generator instead.

---

## 20. ML Pattern: Distance Metrics

```python
a = np.array([1., 2., 3.])
b = np.array([4., 5., 6.])

# ── Euclidean (L2) distance ──────────────────────────────────
np.linalg.norm(a - b)               # 5.196...
np.sqrt(np.sum((a - b)**2))         # same

# ── Manhattan (L1) distance ──────────────────────────────────
np.sum(np.abs(a - b))               # 9.0

# ── Cosine similarity ────────────────────────────────────────
cos_sim = np.dot(a, b) / (np.linalg.norm(a) * np.linalg.norm(b))  # 0.974...
cos_dist = 1 - cos_sim

# ── Chebyshev (L∞) distance ──────────────────────────────────
np.max(np.abs(a - b))               # 3.0

# ── Pairwise distance matrix (all n² pairs) ──────────────────
X = np.random.rand(5, 3)            # 5 samples, 3 features

# Method 1: Broadcasting — elegant
diff = X[:, np.newaxis] - X[np.newaxis, :]  # (5,5,3)
dist_matrix = np.linalg.norm(diff, axis=-1)  # (5,5)

# Method 2: Using dot products (faster for large n)
sq = np.sum(X**2, axis=1)                    # (5,) — squared norms
dist_sq = sq[:, np.newaxis] + sq[np.newaxis, :] - 2 * (X @ X.T)  # (5,5)
dist_sq = np.maximum(dist_sq, 0)             # clip numerical negatives
dist_matrix2 = np.sqrt(dist_sq)

# ── Find k nearest neighbors for each sample ─────────────────
k = 2
# argsort each row, skip index 0 (self), take k nearest
knn_indices = np.argsort(dist_matrix, axis=1)[:, 1:k+1]
```

---

## 21. ML Pattern: Linear Regression from Scratch

```python
# ── Data ─────────────────────────────────────────────────────
np.random.seed(0)
n, p = 100, 3
X_raw = np.random.rand(n, p)
true_w = np.array([2., -1., 0.5])
y = X_raw @ true_w + 0.1 * np.random.randn(n)

# ── Add bias column (intercept) ──────────────────────────────
X = np.column_stack([np.ones(n), X_raw])  # shape (n, p+1)

# ── Normal Equation: w = (XᵀX)⁻¹ Xᵀy ───────────────────────
# Method 1: solve (recommended)
w = np.linalg.solve(X.T @ X, X.T @ y)

# Method 2: lstsq (handles rank-deficient cases)
w, _, _, _ = np.linalg.lstsq(X, y, rcond=None)

# Method 3: explicit inverse (avoid in practice)
w = np.linalg.inv(X.T @ X) @ X.T @ y

# ── Predictions & Metrics ─────────────────────────────────────
y_pred = X @ w
residuals = y - y_pred

mse  = np.mean(residuals**2)
rmse = np.sqrt(mse)
mae  = np.mean(np.abs(residuals))

ss_res = np.sum(residuals**2)
ss_tot = np.sum((y - y.mean())**2)
r2 = 1 - ss_res / ss_tot

print(f"RMSE: {rmse:.4f}, R²: {r2:.4f}")

# ── Gradient Descent (optional) ──────────────────────────────
def gradient_descent(X, y, lr=0.01, epochs=1000):
    n, p = X.shape
    w = np.zeros(p)
    losses = []
    for _ in range(epochs):
        y_hat = X @ w
        grad  = (2/n) * X.T @ (y_hat - y)   # gradient of MSE
        w    -= lr * grad
        losses.append(np.mean((y_hat - y)**2))
    return w, losses
```

---

## 22. ML Pattern: Activation Functions & Loss

```python
# ── Activation Functions ──────────────────────────────────────

def sigmoid(z):
    return 1 / (1 + np.exp(-z))

def sigmoid_stable(z):  # numerically stable version
    return np.where(z >= 0,
                    1 / (1 + np.exp(-z)),
                    np.exp(z) / (1 + np.exp(z)))

def relu(z):
    return np.maximum(0, z)

def leaky_relu(z, alpha=0.01):
    return np.where(z > 0, z, alpha * z)

def elu(z, alpha=1.0):
    return np.where(z > 0, z, alpha * (np.exp(z) - 1))

def tanh(z):
    return np.tanh(z)  # built-in

def softmax(z):
    # Subtract max for numerical stability (prevents overflow)
    e = np.exp(z - z.max(axis=-1, keepdims=True))
    return e / e.sum(axis=-1, keepdims=True)

# ── Derivatives (for backprop) ────────────────────────────────
def sigmoid_prime(z): s = sigmoid(z); return s * (1 - s)
def relu_prime(z):    return (z > 0).astype(float)
def tanh_prime(z):    return 1 - np.tanh(z)**2

# ── Loss Functions ────────────────────────────────────────────
eps = 1e-9  # prevent log(0) = -inf

def mse(y, y_hat):
    return np.mean((y - y_hat)**2)

def mae(y, y_hat):
    return np.mean(np.abs(y - y_hat))

def binary_cross_entropy(y, p):
    p = np.clip(p, eps, 1 - eps)  # safer than adding eps
    return -np.mean(y * np.log(p) + (1 - y) * np.log(1 - p))

def categorical_cross_entropy(y_onehot, p):
    p = np.clip(p, eps, 1)
    return -np.mean(np.sum(y_onehot * np.log(p), axis=1))

def hinge_loss(y, scores):  # y in {-1, +1}
    return np.mean(np.maximum(0, 1 - y * scores))
```

> **💡 Always subtract max before softmax** — this prevents `exp(z)` from overflowing to infinity. The result is mathematically identical because softmax is shift-invariant.

---

## 23. ML Pattern: One-Hot Encoding & Softmax

```python
# ── One-Hot Encoding ──────────────────────────────────────────
labels = np.array([0, 2, 1, 0, 2])
n_classes = 3

# Method 1: index identity matrix (cleanest)
one_hot = np.eye(n_classes)[labels]
# [[1,0,0],[0,0,1],[0,1,0],[1,0,0],[0,0,1]]

# Method 2: manual
one_hot2 = np.zeros((len(labels), n_classes))
one_hot2[np.arange(len(labels)), labels] = 1

# Reverse: one-hot to labels
np.argmax(one_hot, axis=1)  # [0, 2, 1, 0, 2]

# ── Predicted class from probabilities ───────────────────────
logits = np.array([[2., 1., 0.1],
                   [0.5, 3., 0.2]])

probs = softmax(logits)
predicted_classes = np.argmax(probs, axis=1)  # [0, 1]
confidence = np.max(probs, axis=1)            # max probability

# ── Confusion Matrix ─────────────────────────────────────────
def confusion_matrix(y_true, y_pred, n_classes):
    cm = np.zeros((n_classes, n_classes), dtype=int)
    np.add.at(cm, (y_true, y_pred), 1)  # fast unbuffered add
    return cm

# Precision, Recall from confusion matrix
def precision_recall(cm):
    tp = np.diag(cm)
    precision = tp / cm.sum(axis=0)   # column-wise
    recall    = tp / cm.sum(axis=1)   # row-wise
    return precision, recall
```

---

## 24. ML Pattern: Weight Initialization

```python
# Bad: zero initialization — all neurons learn the same thing
W = np.zeros((fan_in, fan_out))

# Better: small random values
W = np.random.randn(fan_in, fan_out) * 0.01

# ── Xavier / Glorot (for tanh, sigmoid) ─────────────────────
# Maintains variance across layers
limit = np.sqrt(6 / (fan_in + fan_out))
W_xavier_uniform = np.random.uniform(-limit, limit, (fan_in, fan_out))
W_xavier_normal  = np.random.randn(fan_in, fan_out) * np.sqrt(2 / (fan_in + fan_out))

# ── He / Kaiming (for ReLU) ─────────────────────────────────
# Accounts for ReLU zeroing half the neurons
W_he = np.random.randn(fan_in, fan_out) * np.sqrt(2 / fan_in)

# ── LeCun (for SELU) ────────────────────────────────────────
W_lecun = np.random.randn(fan_in, fan_out) * np.sqrt(1 / fan_in)

# ── Orthogonal initialization ────────────────────────────────
W_rand = np.random.randn(fan_in, fan_out)
U, _, Vt = np.linalg.svd(W_rand, full_matrices=False)
W_ortho = U if fan_in >= fan_out else Vt
```

> **💡 Rule:** He init for ReLU/Leaky ReLU. Xavier for sigmoid/tanh. Both are better than plain `randn * 0.01` for deep networks.

---

## 25. Random Number Generation

### Legacy API (still common)

```python
np.random.seed(42)              # global seed for reproducibility

np.random.rand(3, 3)            # uniform [0, 1) — U(0,1)
np.random.randn(3, 3)           # standard normal N(0,1)
np.random.randint(0, 10, (5,))  # random integers [0, 10)
np.random.uniform(1, 5, (10,))  # uniform [1, 5)
np.random.normal(0, 1, (10,))   # normal with mean, std
np.random.binomial(n=10, p=0.5, size=100)
np.random.choice(arr, size=5, replace=False)  # random sample
np.random.shuffle(arr)          # shuffle in-place
np.random.permutation(n)        # shuffled indices [0..n-1]
```

### Modern API (recommended for new code)

```python
rng = np.random.default_rng(42)     # create isolated generator

rng.random((3, 3))                   # uniform [0, 1)
rng.standard_normal((3, 3))          # N(0, 1)
rng.integers(0, 10, (5,))            # random integers
rng.uniform(1, 5, (10,))             # uniform [a, b)
rng.normal(loc=0, scale=1, size=10)  # normal
rng.choice(arr, size=5, replace=False, shuffle=False)
rng.shuffle(arr)                      # in-place shuffle
rng.permutation(n)                    # shuffled [0..n-1]

# Spawn independent child generators (for parallel code)
child_rng1, child_rng2 = rng.spawn(2)
```

> **💡 Prefer `np.random.default_rng(seed)` over `np.random.seed(seed)`** in new code. The old API uses a global state that can be accidentally modified by other code. The new Generator-based API is fully isolated, more statistically sound, and supports spawning for parallel workflows.

---

## 26. Performance Tips

### Vectorize — never use Python loops on arrays

```python
# Slow: Python loop
result = np.zeros(len(X))
for i in range(len(X)):
    result[i] = X[i] ** 2 + 2 * X[i]

# Fast: vectorized
result = X**2 + 2*X
```

### Use in-place operations to save memory

```python
X += 1        # in-place — no new array allocated
X *= 2        # in-place
np.sqrt(X, out=X)     # in-place sqrt
np.exp(X, out=X)      # in-place exp
```

### Choose the right dtype

```python
X = X.astype(np.float32)     # halves memory vs float64
                              # 2–4× faster on GPU, marginally faster on CPU
```

### Use contiguous arrays

```python
# Non-contiguous slices can slow operations
X_col = X[:, 0]          # non-contiguous column
X_col = np.ascontiguousarray(X[:, 0])  # make contiguous copy

# Check
X.flags['C_CONTIGUOUS']  # True if row-major (C order)
X.flags['F_CONTIGUOUS']  # True if col-major (Fortran order)
```

### Avoid repeated allocations in loops

```python
# Pre-allocate output
out = np.empty((n, m))
for i in range(n):
    np.dot(A[i], B, out=out[i])  # write into pre-allocated row
```

### Einstein summation (einsum) for complex operations

```python
# Batch matrix multiplication
np.einsum('bij,bjk->bik', A, B)   # (batch, i, k)

# Trace of matrix
np.einsum('ii', A)                 # sum of diagonal

# Outer product
np.einsum('i,j->ij', a, b)

# Dot product
np.einsum('i,i->', a, b)
```

### Memory layout tips

```python
# For row-wise operations — C-order (default) is faster
# For column-wise operations — Fortran order is faster
X_f = np.asfortranarray(X)

# Striding — advanced: read array metadata without data copy
X.strides      # bytes to step in each dimension
X.itemsize     # bytes per element
```

---

## 27. Quick Recall Cheatsheet

### Array creation

| Pattern | Code |
|---------|------|
| Zeros | `np.zeros((m, n))` |
| Ones | `np.ones((m, n))` |
| Identity | `np.eye(n)` |
| Range | `np.arange(start, stop, step)` |
| Linspace | `np.linspace(start, stop, num)` |
| Random uniform | `np.random.rand(m, n)` |
| Random normal | `np.random.randn(m, n)` |

### Indexing

| Pattern | Code |
|---------|------|
| Row | `m[i, :]` |
| Column | `m[:, j]` |
| Submatrix | `m[r1:r2, c1:c2]` |
| Boolean filter | `a[a > threshold]` |
| Fancy index | `a[[0, 2, 4]]` |
| One-hot encode | `np.eye(n)[labels]` |

### Axis rules

| Goal | Code |
|------|------|
| Per-column stat | `a.mean(axis=0)` |
| Per-row stat | `a.mean(axis=1)` |
| All elements | `a.mean()` |
| Preserve shape | `a.mean(axis=0, keepdims=True)` |

### Shape manipulation

| Goal | Code |
|------|------|
| Column vector | `a.reshape(-1, 1)` |
| Row vector | `a.reshape(1, -1)` |
| Flatten | `a.flatten()` or `a.ravel()` |
| Add axis | `a[:, np.newaxis]` |
| Transpose | `a.T` |

### Key gotchas

| Mistake | Fix |
|---------|-----|
| `a * b` for matmul | Use `a @ b` |
| `and`, `or`, `not` on arrays | Use `&`, `\|`, `~` |
| Forgetting to parenthesize | `(a > 1) & (a < 5)` |
| `inv(A) @ b` for solving | Use `linalg.solve(A, b)` |
| Assuming slice is a copy | Slice = view; use `.copy()` to be safe |
| float64 everywhere | Use `float32` for ML/GPU code |

### Normalization patterns

```python
# Z-score
(X - X.mean(axis=0)) / X.std(axis=0)

# Min-max
(X - X.min(axis=0)) / (X.max(axis=0) - X.min(axis=0))

# L2 per sample
X / np.linalg.norm(X, axis=1, keepdims=True)
```

### Distance patterns

```python
# Euclidean between two vectors
np.linalg.norm(a - b)

# Cosine similarity
np.dot(a, b) / (np.linalg.norm(a) * np.linalg.norm(b))

# Pairwise distance matrix
diff = X[:, np.newaxis] - X[np.newaxis, :]
np.linalg.norm(diff, axis=-1)
```

---

## Resources

- [NumPy Official Docs](https://numpy.org/doc/stable/)
- [NumPy User Guide](https://numpy.org/doc/stable/user/index.html)
- [NumPy API Reference](https://numpy.org/doc/stable/reference/index.html)
- [From Python to NumPy (book)](https://www.labri.fr/perso/nrougier/from-python-to-numpy/)
- [100 NumPy Exercises](https://github.com/rougier/numpy-100)

---

*Last updated: April 29,2026 · Covers NumPy 1.20+*
**Made with ❤️ for data scientists and ML engineers**
