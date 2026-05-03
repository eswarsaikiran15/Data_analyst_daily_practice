# 🐍 Python Master Notes
### Complete Reference for Technical Interviews, DSA & Python Development

> **How to use:** Each section → **Concept** (what & why) → **Code** (how) → **⚡ Recall** (quick anchors) → **🎯 Interview Q&A** (real answers)

---

## 📋 Table of Contents

### Core Python
1. [Python Fundamentals & Data Types](#1-python-fundamentals--data-types)
2. [Variables, Operators & Type System](#2-variables-operators--type-system)
3. [Strings](#3-strings)
4. [Lists](#4-lists)
5. [Tuples](#5-tuples)
6. [Dictionaries](#6-dictionaries)
7. [Sets](#7-sets)
8. [Control Flow — if, for, while](#8-control-flow--if-for-while)
9. [Functions](#9-functions)
10. [*args & **kwargs](#10-args--kwargs)
11. [Lambda & Higher-Order Functions](#11-lambda--higher-order-functions)
12. [Comprehensions — List, Dict, Set, Generator](#12-comprehensions--list-dict-set-generator)
13. [Exception Handling](#13-exception-handling)
14. [File I/O](#14-file-io)
15. [OOP — Classes & Objects](#15-oop--classes--objects)
16. [Inheritance & Polymorphism](#16-inheritance--polymorphism)
17. [Magic / Dunder Methods](#17-magic--dunder-methods)
18. [Decorators](#18-decorators)
19. [Generators & Iterators](#19-generators--iterators)
20. [Context Managers](#20-context-managers)
21. [Modules, Packages & Imports](#21-modules-packages--imports)
22. [Built-in Functions](#22-built-in-functions)
23. [Collections Module](#23-collections-module)
24. [itertools & functools](#24-itertools--functools)
25. [Type Hints & Annotations](#25-type-hints--annotations)
26. [Dataclasses](#26-dataclasses)
27. [Regular Expressions](#27-regular-expressions)
28. [Concurrency — Threading, Multiprocessing, AsyncIO](#28-concurrency--threading-multiprocessing-asyncio)
29. [Memory Management & Garbage Collection](#29-memory-management--garbage-collection)
30. [Testing — unittest & pytest](#30-testing--unittest--pytest)

### Data Structures & Algorithms
31. [Big O Notation & Complexity](#31-big-o-notation--complexity)
32. [Arrays & Dynamic Arrays](#32-arrays--dynamic-arrays)
33. [Linked Lists](#33-linked-lists)
34. [Stacks](#34-stacks)
35. [Queues & Deques](#35-queues--deques)
36. [Hash Tables](#36-hash-tables)
37. [Trees — Binary Tree & BST](#37-trees--binary-tree--bst)
38. [Heaps & Priority Queues](#38-heaps--priority-queues)
39. [Graphs](#39-graphs)
40. [Recursion](#40-recursion)
41. [Dynamic Programming](#41-dynamic-programming)
42. [Sorting Algorithms](#42-sorting-algorithms)
43. [Binary Search](#43-binary-search)
44. [Two Pointers Technique](#44-two-pointers-technique)
45. [Sliding Window Technique](#45-sliding-window-technique)
46. [BFS & DFS Traversals](#46-bfs--dfs-traversals)
47. [Backtracking](#47-backtracking)
48. [Common Interview Patterns & Cheatsheet](#48-common-interview-patterns--cheatsheet)

---

## 1. Python Fundamentals & Data Types

### Concept
Python is a **dynamically typed**, **interpreted**, **high-level** language. Every value in Python is an **object** — even integers and functions. Python uses **duck typing**: if it walks like a duck and quacks like a duck, it's a duck — the type matters less than whether the object has the right behavior.

**Built-in Data Types:**
| Category | Types |
|----------|-------|
| Numeric | `int`, `float`, `complex` |
| Sequence | `str`, `list`, `tuple`, `range` |
| Mapping | `dict` |
| Set | `set`, `frozenset` |
| Boolean | `bool` |
| None | `NoneType` |

### Code
```python
# Type checking
x = 42
print(type(x))                   # <class 'int'>
print(isinstance(x, int))        # True
print(isinstance(x, (int, float))) # True — checks multiple types

# Mutability
# MUTABLE   → list, dict, set         (can change in place)
# IMMUTABLE → int, float, str, tuple  (create new objects on change)

# Identity vs equality
a = [1, 2, 3]
b = [1, 2, 3]
c = a
print(a == b)    # True  — same value
print(a is b)    # False — different objects in memory
print(a is c)    # True  — c is an alias for a

# None checks — always use 'is', never '=='
x = None
print(x is None)     # ✅ correct
print(x == None)     # ⚠️  works but not idiomatic

# Truthiness — what evaluates to False:
# False, None, 0, 0.0, "", [], {}, set(), ()
if []:    print("never")    # [] is falsy
if [0]:   print("runs!")    # [0] is truthy — non-empty list
if " ":   print("runs!")    # " " is truthy — non-empty string

# CPython small int caching (-5 to 256)
x = 5
y = 5
print(x is y)    # True — small ints cached/interned

x = 1000
y = 1000
print(x is y)    # False — may differ (no guarantee beyond 256)
```

### ⚡ Recall
- **Everything is an object** — even functions, classes, None
- **Mutable** = can change in place: `list`, `dict`, `set`
- **Immutable** = cannot change: `int`, `str`, `tuple`, `frozenset`
- **`is`** = identity (same object) | **`==`** = equality (same value)
- **Falsy values**: `False`, `None`, `0`, `""`, `[]`, `{}`, `set()`, `()`
- Small integers `-5` to `256` are **cached** by CPython

### 🎯 Interview Q&A

> **Q: What is the difference between `is` and `==` in Python?**  
> **A:** `==` compares **values** — whether two objects are equal in content. `is` compares **identity** — whether two variables point to the exact same object in memory (same `id()`). `[1,2,3] == [1,2,3]` is `True`, but `[1,2,3] is [1,2,3]` is `False` — two separate list objects. Use `is` only to check for `None` (`x is None`), `True`, or `False`. Never use `is` to compare strings, integers in general, or collections — the results are implementation-dependent due to Python's interning behavior.

> **Q: What does "everything is an object" mean in Python?**  
> **A:** In Python, every value — integers, strings, functions, classes, modules, even `None` — is an instance of some class and carries attributes and methods. `int` is a class; `42` is an instance of `int`. Functions are instances of the `function` class, which is why you can pass them as arguments, store them in lists, and even add attributes to them. This uniform object model is what enables Python's powerful features like decorators, first-class functions, and metaclasses.

> **Q: What is the difference between mutable and immutable types? Why does it matter?**  
> **A:** **Mutable** objects (list, dict, set) can be modified in place after creation. **Immutable** objects (int, str, tuple) cannot — operations that "modify" them return a new object. This matters for: (1) **Function arguments** — passing a mutable object to a function allows the function to modify it; the caller sees the change. Immutable objects can't be modified this way. (2) **Dictionary keys and set elements** — must be immutable (hashable); lists cannot be dict keys but tuples can. (3) **Thread safety** — immutable objects are naturally thread-safe.

> **Q: What is duck typing?**  
> **A:** Duck typing is Python's approach where the type of an object matters less than whether it has the required methods/attributes. "If it walks like a duck and quacks like a duck, it is a duck." A function calling `len(x)` works with any object that has `__len__` — strings, lists, tuples, custom classes — without type checking. This enables polymorphism without inheritance hierarchies and is the basis of Python's "protocol" system (iterables, context managers, comparables).

---

## 2. Variables, Operators & Type System

### Concept
Python uses **dynamic typing** — variables are labels pointing to objects, not typed containers. A variable can be rebound to any type at any time.

### Code
```python
# Multiple assignment
a, b, c = 1, 2, 3
x = y = z = 0

# Swap — Pythonic (uses tuple packing/unpacking)
a, b = b, a

# Augmented assignment
x = 5
x += 3    # 8
x //= 2   # 4  (floor division)
x **= 2   # 16 (power)
x %= 3    # 1  (modulo)

# Arithmetic
print(7 / 2)    # 3.5  — true division (always float)
print(7 // 2)   # 3    — floor division (toward -infinity!)
print(-7 // 2)  # -4   — NOT -3 (floors toward -infinity)
print(7 % 2)    # 1    — modulo
print(2 ** 10)  # 1024 — power

# Comparison — chaining works
print(1 < 2 < 3)   # True
print(1 < 2 > 0)   # True

# Logical — short-circuit, return operand value
x = None
result = x or "default"    # "default" — x is falsy
result = x and x.value     # None — short-circuits

# Bitwise
print(5 & 3)   # 1   (AND)
print(5 | 3)   # 7   (OR)
print(5 ^ 3)   # 6   (XOR)
print(5 << 1)  # 10  (left shift = *2)
print(5 >> 1)  # 2   (right shift = //2)

# Type conversion
int("42")        # 42
int(3.9)         # 3   (truncates, does NOT round)
float("3.14")    # 3.14
bool(0)          # False
bool("hello")    # True
list((1, 2, 3))  # [1, 2, 3]
set([1, 1, 2])   # {1, 2}

# Walrus operator := (Python 3.8+)
import re
if m := re.search(r"\d+", "Order 42"):
    print(m.group())   # 42  — assign and test in one line
```

### ⚡ Recall
- `//` floors toward **negative infinity** (`-7//2 = -4`, not `-3`)
- `and`/`or` return an **operand value**, not True/False
- `int()` **truncates**, not rounds
- `:=` walrus = assign-and-test in one expression (Python 3.8+)

### 🎯 Interview Q&A

> **Q: What is the difference between `/` and `//`?**  
> **A:** `/` is **true division** — always returns a float (`7/2 = 3.5`). `//` is **floor division** — rounds toward negative infinity and returns int if both operands are int (`7//2 = 3`, `-7//2 = -4`). The floor toward -infinity distinction is critical: many candidates assume `-7//2 = -3` (truncation toward zero), but the correct answer is `-4`.

> **Q: How does `and`/`or` short-circuit evaluation work?**  
> **A:** `and` returns the **first falsy value**, or the last value if all are truthy. `or` returns the **first truthy value**, or the last value if all are falsy. They return actual operand values, not just True/False. Idioms: `value = config.get("key") or "default"` — returns config value if truthy, else "default". `obj and obj.method()` — safely chains access, skipping if `obj` is None/falsy.

---

## 3. Strings

### Concept
Strings are **immutable sequences of Unicode characters**. They support slicing, indexing, and a comprehensive set of methods. String operations always return **new strings** — the original is never modified.

### Code
```python
s = "Python"
# Indexing & Slicing
s[0]      # 'P'
s[-1]     # 'n'
s[1:4]    # 'yth'
s[::2]    # 'Pto'
s[::-1]   # 'nohtyP'  ← reverse

# Methods
s = "  Hello, World!  "
s.strip()               # "Hello, World!"
s.lower()               # "  hello, world!  "
s.upper()               # "  HELLO, WORLD!  "
"Hello, World!".split(", ")    # ['Hello', 'World!']
"Hello, World!".replace("World", "Python")
"Hello".startswith("He")       # True
"Hello".endswith("lo")         # True
"Hello World".find("World")    # 6   (returns -1 if not found)
"Hello World".index("World")   # 6   (raises ValueError if not found)
"hello".count("l")             # 2
"hello".center(11, "-")        # "---hello---"

# Join — always use join, not + in loops
words = ["Hello", "World"]
" ".join(words)    # "Hello World"  — O(n) efficient
"".join(words)     # "HelloWorld"

# f-strings (Python 3.6+) — fastest
name, score = "Alice", 95.5
f"Name: {name}, Score: {score:.1f}"   # "Name: Alice, Score: 95.5"
f"{1000000:,}"     # "1,000,000"
f"{'left':<10}|"  # "left      |"
f"{42:05d}"        # "00042"

# String checks
"abc123".isdigit()   # False
"123".isdigit()      # True
"abc".isalpha()      # True
"abc123".isalnum()   # True

# Encoding
"Hello".encode("utf-8")       # b'Hello'
b"Hello".decode("utf-8")      # 'Hello'

# Raw strings — backslash not treated as escape
r"\n is not a newline"   # use for regex and Windows paths
```

### ⚡ Recall
- Strings are **immutable** — `s[0] = 'X'` raises `TypeError`
- `s[::-1]` = reverse | `s[start:stop:step]` stop is **exclusive**
- `"sep".join(list)` = O(n) | `s1 + s2` in loop = O(n²)
- `find()` → `-1` on miss | `index()` → `ValueError` on miss
- f-strings: `f"{val:.2f}"`, `f"{val:>10}"`, `f"{val:,}"`

### 🎯 Interview Q&A

> **Q: Why should you use `"".join(list)` instead of `+` for string concatenation?**  
> **A:** Strings are immutable — each `+` creates a **new string object** and copies all previous content. Concatenating N strings with `+` in a loop is O(N²). `"".join(list)` allocates memory once and writes all parts in a single O(N) pass. For large string building, `join` can be orders of magnitude faster.

> **Q: What is the difference between `find()` and `index()`?**  
> **A:** Both return the starting index of a substring. `find()` returns `-1` when not found — use when absence is expected. `index()` raises `ValueError` when not found — use when absence is a bug. Always prefer `find()` for conditional checks.

> **Q: How does Python handle string interning?**  
> **A:** CPython automatically interns string literals that look like identifiers (letters, digits, underscores). These interned strings share the same object in memory, making `is` comparison O(1). Strings with spaces aren't interned by default. You can force interning with `sys.intern(s)`. Don't rely on interning for equality checks — always use `==`.

---

## 4. Lists

### Concept
A **list** is a **mutable, ordered, dynamically-sized array** of object references. It's Python's most versatile data structure — O(1) index access, O(1) amortized appends, O(n) insertions/deletions at arbitrary positions.

| Operation | Time |
|-----------|------|
| `list[i]` | O(1) |
| `append(x)` | O(1) amortized |
| `insert(i, x)` | O(n) |
| `pop()` | O(1) |
| `pop(i)` | O(n) |
| `x in list` | O(n) |
| `sort()` | O(n log n) |

### Code
```python
# Creation
lst = [1, 2, 3]
lst = list(range(5))         # [0,1,2,3,4]
lst = [0] * 5                # [0,0,0,0,0]
lst = [[0]*3 for _ in range(3)]  # ✅ proper 2D list
# ❌ [[0]*3]*3 — all rows share the same list object!

# Slicing
lst = [10, 20, 30, 40, 50]
lst[1:3]    # [20, 30]
lst[::-1]   # [50, 40, 30, 20, 10]  — reversed copy

# Mutating methods
lst = [1, 2, 3]
lst.append(4)           # [1, 2, 3, 4]          O(1)
lst.extend([5, 6])      # [1, 2, 3, 4, 5, 6]    O(k)
lst.insert(0, 0)        # [0, 1, 2, 3, 4, 5, 6] O(n)
lst.remove(3)           # removes first occurrence O(n)
lst.pop()               # removes+returns last    O(1)
lst.pop(0)              # removes+returns index 0 O(n)
lst.sort()              # in-place (returns None!)
lst.sort(key=lambda x: -x)
lst.reverse()
lst.clear()

# Non-mutating
lst = [3, 1, 4, 1, 5]
sorted(lst)             # returns NEW sorted list
lst.count(1)            # 2
lst.index(4)            # 2

# Copying
import copy
original = [1, 2, [3, 4]]
shallow = original[:]            # inner lists still shared
deep    = copy.deepcopy(original) # fully independent

original[2].append(99)
print(shallow)    # [1, 2, [3, 4, 99]] — inner list shared!
print(deep)       # [1, 2, [3, 4]]     — truly independent

# Unpacking
a, b, *rest = [1, 2, 3, 4, 5]   # a=1, b=2, rest=[3,4,5]
first, *mid, last = [1,2,3,4,5]  # first=1, last=5

# Useful builtins on lists
sum([1,2,3])           # 6
min([3,1,2])           # 1
max([3,1,2])           # 3
any(x>4 for x in lst)  # True
all(x>0 for x in lst)  # True

# Zip
list(zip([1,2,3], [4,5,6]))  # [(1,4),(2,5),(3,6)]

# Flatten
nested = [[1,2],[3,4],[5]]
flat = [x for row in nested for x in row]
```

### ⚡ Recall
- `append` O(1), `insert(0,x)` O(n), `pop()` O(1), `pop(0)` O(n)
- `sort()` in-place returns `None` | `sorted()` returns new list
- `x in list` = O(n) — use set for O(1) membership tests
- `list[:]` = **shallow** copy — nested objects still shared
- `[[0]*n]*m` = wrong! — use `[[0]*n for _ in range(m)]`

### 🎯 Interview Q&A

> **Q: What is the difference between `append()` and `extend()`?**  
> **A:** `append(x)` adds `x` as a **single element** — `[1,2].append([3,4])` → `[1, 2, [3, 4]]`. `extend(iterable)` unpacks and adds each element individually — `[1,2].extend([3,4])` → `[1, 2, 3, 4]`. Confusing these produces nested lists when you expect flat ones.

> **Q: Why is `pop(0)` O(n) but `pop()` O(1)?**  
> **A:** Lists are backed by dynamic arrays. `pop()` removes the last element — just decrement the length pointer: O(1). `pop(0)` removes the first element — all subsequent elements must shift left to fill the gap: O(n). For queue operations (O(1) removal from both ends), use `collections.deque`.

> **Q: What is the difference between shallow and deep copy?**  
> **A:** A **shallow copy** creates a new container but keeps references to the same inner objects. For `[[1,2],[3,4]]`, a shallow copy gives a new outer list but both point to the same inner lists — modifying `copy[0].append(99)` also modifies `original[0]`. A **deep copy** (`copy.deepcopy()`) recursively copies everything — fully independent. Use shallow for lists of immutables (safe, no mutation); deep for nested mutable structures.

---

## 5. Tuples

### Concept
A **tuple** is an **immutable, ordered sequence**. Once created, it cannot be changed. Tuples are faster than lists for iteration, **hashable** (usable as dict keys/set elements), and signal to readers that the data is fixed.

### Code
```python
# Creation
t = (1, 2, 3)
t = 1, 2, 3             # parentheses optional — comma creates tuple
t = (42,)               # ✅ single-element: comma required!
t = (42)                # ❌ just int 42 — NOT a tuple!
t = tuple([1, 2, 3])

# Access & slicing — same as list
t[0], t[-1], t[1:3]

# Unpacking
x, y, z = (1, 2, 3)
a, *rest = (1, 2, 3, 4)    # a=1, rest=[2,3,4]

# Swap
a, b = b, a     # tuple packing → unpacking

# Named Tuples
from collections import namedtuple
Point = namedtuple("Point", ["x", "y"])
p = Point(3, 4)
p.x, p.y         # 3, 4
p[0]             # 3  — still indexable
p._replace(x=10) # new tuple with x changed
p._asdict()      # OrderedDict

# As dict key (lists can't be dict keys)
cache = {}
cache[(1, 2, 3)] = "result"   # ✅
# cache[[1, 2, 3]] = "result" # ❌ TypeError: unhashable type

# Methods
t = (1, 2, 2, 3)
t.count(2)   # 2
t.index(3)   # 3
```

### ⚡ Recall
- `(42,)` = tuple | `(42)` = int — **comma creates the tuple**
- Tuples are **hashable** → valid dict keys, set members
- Use tuples for **fixed heterogeneous** records (coordinates, DB row)
- Use lists for **variable homogeneous** sequences
- `namedtuple` = readable tuple with named fields

### 🎯 Interview Q&A

> **Q: When would you choose a tuple over a list?**  
> **A:** Use tuples when: (1) data is **fixed and shouldn't change** (coordinates, RGB colors, function return values); (2) you need it as a **dict key or set member** (must be hashable); (3) to signal intent — "this is a record, not a variable collection." Use lists for mutable, growing/shrinking sequences. Performance note: tuples are slightly faster to create and iterate, and consume slightly less memory.

> **Q: Why can a tuple be a dict key but a list cannot?**  
> **A:** Dict keys must be **hashable** — they need a stable `__hash__`. Lists are mutable, so Python makes them unhashable: if you modified a list used as a dict key, its hash would change and the key would become unfindable. Tuples are immutable and hashable. Exception: a tuple containing a list (`([1,2], 3)`) is also **not hashable** because it contains an unhashable element.

---

## 6. Dictionaries

### Concept
A **dict** is a **mutable, ordered** (Python 3.7+) **hash map** of key-value pairs. Keys must be hashable. Average O(1) for get/set/delete/lookup.

| Operation | Average | Worst |
|-----------|---------|-------|
| `d[key]` | O(1) | O(n) |
| `d[key] = v` | O(1) | O(n) |
| `del d[key]` | O(1) | O(n) |
| `key in d` | O(1) | O(n) |
| Iteration | O(n) | O(n) |

### Code
```python
# Creation
d = {"name": "Alice", "age": 30}
d = dict(name="Alice", age=30)
d = {k: v for k, v in zip("abc", [1,2,3])}  # dict comprehension

# Access
d["name"]               # KeyError if missing
d.get("name")           # None if missing — SAFE
d.get("phone", "N/A")   # default value

# Mutation
d["city"] = "NYC"
d.update({"age": 31, "city": "LA"})
del d["city"]
d.pop("age")            # returns value
d.pop("missing", None)  # safe — returns None
d.setdefault("score", 0)  # add only if key absent

# Iteration
for key in d:
    pass
for key in d.keys():
    pass
for val in d.values():
    pass
for key, val in d.items():   # ← most common
    pass

# Merging
a = {"x": 1}
b = {"y": 2}
merged = {**a, **b}    # Python 3.5+
merged = a | b         # Python 3.9+
a |= b                 # Python 3.9+ in-place

# Count occurrences pattern
freq = {}
for ch in "hello":
    freq[ch] = freq.get(ch, 0) + 1

# Grouping pattern
from collections import defaultdict
groups = defaultdict(list)
for key, val in [("a",1),("b",2),("a",3)]:
    groups[key].append(val)   # {"a":[1,3], "b":[2]}

# Sort by value
d = {"b":3, "a":1, "c":2}
dict(sorted(d.items(), key=lambda x: x[1]))  # {"a":1,"c":2,"b":3}

# Invert
{v: k for k, v in d.items()}

# Counter
from collections import Counter
c = Counter("mississippi")
c.most_common(2)   # [('s',4), ('i',4)]
```

### ⚡ Recall
- `d[key]` raises `KeyError` | `d.get(key, default)` is safe
- `in` checks **keys** only — O(1)
- Python 3.7+ dicts maintain **insertion order**
- `defaultdict(list/int/set)` auto-creates default on first access
- `Counter` is a dict subclass for counting — supports `+`, `-`, `most_common()`

### 🎯 Interview Q&A

> **Q: How is a Python dictionary implemented internally?**  
> **A:** CPython implements dicts as **hash tables** (open addressing). Each key is hashed to find a slot. Collisions are resolved by probing nearby slots. Average O(1) get/set; worst case O(n) with many collisions (rare). Python 3.6+ uses a compact representation that also preserves insertion order as a guaranteed feature in 3.7+.

> **Q: What is the difference between `dict`, `defaultdict`, `OrderedDict`, and `Counter`?**  
> **A:** `dict` is the standard mapping — `KeyError` on missing keys, insertion-ordered since 3.7. `defaultdict(factory)` auto-creates a default value for missing keys using the factory — ideal for grouping/accumulating without `setdefault` boilerplate. `OrderedDict` (pre-3.7) explicitly tracked order and has `move_to_end()` — still useful for move_to_end semantics and order-sensitive equality. `Counter` is a dict subclass for counting — supports arithmetic, `most_common()`, and subtraction.

> **Q: What is the `get()` method and when should you use it?**  
> **A:** `d.get(key, default)` returns the value for `key` if it exists, otherwise returns `default` (None if not specified) — no exception. Use it whenever key absence is a valid case. Use `d[key]` only when you're certain the key exists and its absence should be an error. `get()` makes code more robust and eliminates boilerplate `if key in d` checks.

---

## 7. Sets

### Concept
A **set** is an **unordered collection of unique, hashable elements** backed by a hash table. O(1) membership testing, deduplication, and mathematical set operations.

### Code
```python
# Creation
s = {1, 2, 3}
s = set([1, 2, 2, 3])    # {1, 2, 3} — deduplicates
s = set("hello")          # {'h','e','l','o'}
empty = set()             # ✅ NOT {} (that's empty dict)

# Operations
s.add(4)
s.remove(1)    # KeyError if not found
s.discard(99)  # safe — no error
s.pop()        # removes arbitrary element

# Set mathematics
a = {1, 2, 3, 4}
b = {3, 4, 5, 6}
a | b    # {1,2,3,4,5,6}  union
a & b    # {3, 4}          intersection
a - b    # {1, 2}          difference (in a not b)
a ^ b    # {1,2,5,6}       symmetric difference

# Subset checks
{1,2} <= {1,2,3}   # True  (subset)
{1,2} <  {1,2,3}   # True  (proper subset)

# Common patterns
# 1. Deduplicate a list
unique = list(set([1,2,2,3,3]))

# 2. Fast membership check
valid_ids = {101, 202, 303}
if user_id in valid_ids:   # O(1) vs O(n) for list
    pass

# 3. Common elements
set([1,2,3]) & set([2,3,4])   # {2, 3}

# frozenset — immutable, hashable set
fs = frozenset([1, 2, 3])
cache = {fs: "value"}    # usable as dict key
```

### ⚡ Recall
- `set()` not `{}` for empty set
- `x in set` = O(1) vs O(n) for list — **key performance win**
- `remove()` raises error | `discard()` is silent
- `|` union, `&` intersect, `-` difference, `^` symmetric diff
- Elements must be **hashable** — no lists inside sets

### 🎯 Interview Q&A

> **Q: When would you use a set instead of a list?**  
> **A:** Use a set when: (1) **O(1) membership testing** — `x in my_set` vs O(n) `x in my_list`; (2) **deduplication** — `set(lst)` removes duplicates; (3) **set math** — union, intersection, difference. The key interview optimization: replace list membership checks with set lookups — build set O(n), each lookup O(1) vs O(n) per lookup.

> **Q: Why can't you put a list in a set?**  
> **A:** Set elements must be **hashable**. Lists are mutable, so Python intentionally makes them unhashable — if you could put a list in a set and then modify it, the hash would change, corrupting the set. Use a **tuple** or **frozenset** as the hashable equivalent.

---

## 8. Control Flow — if, for, while

### Concept
Python uses **indentation** (4 spaces) to define blocks. `for` loops iterate over **any iterable**. `while` runs until a condition is False. No `do-while` — use `while True: ... if cond: break`.

### Code
```python
# if/elif/else
x = 42
if x > 100:
    print("big")
elif x > 10:
    print("medium")
else:
    print("small")

# Ternary
result = "even" if x % 2 == 0 else "odd"

# for — over any iterable
for i in range(0, 10, 2):   # 0, 2, 4, 6, 8
    pass

for i, val in enumerate(["a","b","c"], start=1):
    print(i, val)   # 1 a, 2 b, 3 c

for a, b in zip([1,2,3], [4,5,6]):
    print(a, b)

# break, continue, else
# for/else: else runs ONLY if loop completed without break
for n in range(2, 10):
    for f in range(2, n):
        if n % f == 0:
            break
    else:
        print(f"{n} is prime")  # only when inner loop didn't break

# while
i = 0
while i < 5:
    i += 1

# while True pattern
while True:
    data = get_data()
    if not data:
        break
    process(data)

# pass — syntactic no-op placeholder
class Empty:
    pass
```

### ⚡ Recall
- `for/else` and `while/else` — `else` runs only if **no break occurred**
- `range(start, stop, step)` — stop is **exclusive**
- `enumerate(iterable, start=0)` — `(index, value)` pairs
- `zip(a, b)` stops at the **shorter** iterable
- No `do-while` — use `while True: ... if cond: break`

### 🎯 Interview Q&A

> **Q: What does the `else` clause on a `for` loop do?**  
> **A:** It executes when the loop **completes without hitting a `break`**. It's the "not found" handler in search patterns: `for item in collection: if item.matches(): found=True; break; else: handle_not_found()`. Cleaner than a boolean flag.

> **Q: What is the difference between `break`, `continue`, and `pass`?**  
> **A:** `break` **exits** the innermost loop. `continue` **skips** the rest of the current iteration and moves to the next. `pass` is a **no-op syntactic placeholder** — it does nothing and is used where Python syntax requires a statement but you have no code to write.

---

## 9. Functions

### Concept
Functions are **first-class objects** — assignable, passable, returnable. Python uses **LEGB** scope (Local → Enclosing → Global → Built-in). Closures capture enclosing scope variables. The mutable default argument is a classic gotcha.

### Code
```python
# Default arguments — evaluated ONCE at definition
def greet(name, greeting="Hello"):
    return f"{greeting}, {name}!"

greet("Alice")              # "Hello, Alice!"
greet("Bob", greeting="Hi") # "Hi, Bob!"

# Multiple return values (returns tuple)
def min_max(lst):
    return min(lst), max(lst)
low, high = min_max([3,1,4,1,5])

# LEGB scope
x = "global"
def outer():
    x = "enclosing"
    def inner():
        x = "local"
        print(x)    # "local"
    inner()

# global — modify global from function
count = 0
def increment():
    global count
    count += 1

# nonlocal — modify enclosing scope
def make_counter():
    n = 0
    def counter():
        nonlocal n
        n += 1
        return n
    return counter

c = make_counter()
c()  # 1
c()  # 2

# Closure — inner fn captures outer scope
def multiplier(factor):
    def multiply(x):
        return x * factor   # 'factor' captured
    return multiply

double = multiplier(2)
double(5)   # 10

# ❌ MUTABLE DEFAULT ARGUMENT TRAP
def bad(lst=[]):       # lst shared across ALL calls!
    lst.append(1)
    return lst
bad()  # [1]
bad()  # [1, 1]  ← unexpected!

# ✅ FIX: use None
def good(lst=None):
    if lst is None:
        lst = []
    lst.append(1)
    return lst

# Positional-only (/) and keyword-only (*) params
def func(pos_only, /, normal, *, kw_only):
    pass
# pos_only  — must be positional
# kw_only   — must be keyword
```

### ⚡ Recall
- **LEGB** = Local → Enclosing → Global → Built-in
- `global` modifies module-level var | `nonlocal` modifies enclosing var
- **Mutable default argument** = evaluated once → use `None` sentinel
- Closures = inner function + captured enclosing variables
- Functions are first-class: pass as args, store in lists, return from functions

### 🎯 Interview Q&A

> **Q: What is the mutable default argument trap?**  
> **A:** Default argument values are evaluated **once** at function definition, not per call. If the default is a list or dict, all calls that use that default share the same object. `def f(lst=[])` — call 1 adds to `[]`, call 2 finds `[item_from_call_1]` instead of a fresh `[]`. Fix: `def f(lst=None): if lst is None: lst = []`.

> **Q: What is a closure?**  
> **A:** A closure is a function that **captures variables from its enclosing scope** even after the outer function has returned. The inner function "closes over" the free variables. Example: `multiplier(2)` returns `multiply` which remembers `factor=2`. Closures power decorators, function factories, and stateful callbacks without classes.

> **Q: What does `global` vs `nonlocal` do?**  
> **A:** `global x` inside a function means "x refers to the module-level global." Without it, assigning to `x` inside a function creates a new local variable (and reading before assignment causes `UnboundLocalError`). `nonlocal x` in a nested function means "x refers to the nearest enclosing function's variable" — for building stateful closures like counters.

---

## 10. *args & **kwargs

### Concept
`*args` captures extra positional arguments as a **tuple**. `**kwargs` captures extra keyword arguments as a **dict**. Essential for flexible APIs, decorators, and forwarding.

### Code
```python
# *args — variable positionals
def add(*args):
    return sum(args)
add(1, 2, 3, 4)   # 10

# **kwargs — variable keywords
def info(**kwargs):
    for k, v in kwargs.items():
        print(f"{k}: {v}")
info(name="Alice", age=30)

# Combined — order: regular, *args, keyword_defaults, **kwargs
def full(required, *args, kwonly="default", **kwargs):
    print(required, args, kwonly, kwargs)

full(1, 2, 3, kwonly="x", extra="y")
# 1, (2, 3), x, {'extra': 'y'}

# Unpacking at call site
def add(a, b, c): return a + b + c
nums = [1, 2, 3]
add(*nums)           # unpack list → positional args
config = {"a":1,"b":2,"c":3}
add(**config)        # unpack dict → keyword args

# Forward all args (classic decorator pattern)
def wrapper(*args, **kwargs):
    return original(*args, **kwargs)
```

### ⚡ Recall
- `*args` → **tuple** | `**kwargs` → **dict**
- Definition order: `(regular, *args, kw_only, **kwargs)`
- `func(*list)` = unpack list as positional args at call site
- `func(**dict)` = unpack dict as keyword args at call site

### 🎯 Interview Q&A

> **Q: What is the difference between `*args` and `**kwargs`?**  
> **A:** `*args` collects extra **positional** arguments into a tuple. `**kwargs` collects extra **keyword** arguments into a dict. Together they let a function accept any combination of arguments — critical for writing decorators that must forward all arguments to the wrapped function without knowing them in advance.

---

## 11. Lambda & Higher-Order Functions

### Concept
A **lambda** is an anonymous single-expression function. **Higher-order functions** accept or return functions. `map`, `filter`, `sorted`, `min`, `max` are common consumers.

### Code
```python
# Lambda syntax: lambda params: expression
square = lambda x: x**2
add    = lambda x, y: x + y

# Most common use — as key in sorted/min/max
data = [{"name":"Bob","score":70},{"name":"Alice","score":90}]
sorted(data, key=lambda d: d["score"])           # by score asc
sorted(data, key=lambda d: -d["score"])          # by score desc
sorted(data, key=lambda d: (d["score"], d["name"]))  # multi-key

# map — apply function to each element
list(map(lambda x: x**2, [1,2,3,4]))   # [1,4,9,16]
# More Pythonic:
[x**2 for x in [1,2,3,4]]

# filter — keep elements where function is True
list(filter(lambda x: x%2==0, range(10)))  # [0,2,4,6,8]
# More Pythonic:
[x for x in range(10) if x%2==0]

# reduce
from functools import reduce
reduce(lambda acc, x: acc*x, [1,2,3,4,5])  # 120

# Function factory
def power_of(n):
    return lambda x: x**n

square = power_of(2)
cube   = power_of(3)
square(4)  # 16

# operator module (faster than lambda for simple ops)
from operator import itemgetter, attrgetter
sorted(data, key=itemgetter("score"))
```

### ⚡ Recall
- Lambda = `lambda params: expression` — **one expression**, no statements
- Use for short, throwaway key functions in `sorted`/`min`/`max`
- **Don't assign** lambdas to variables (PEP 8) — use `def` instead
- `map`/`filter` return **iterators** — wrap in `list()` to materialize
- Prefer list comprehensions over `map`/`filter` for readability

### 🎯 Interview Q&A

> **Q: When would you use a lambda vs a named function?**  
> **A:** Use lambdas for short, inline, one-time-use functions passed as arguments to `sorted()`, `min()`, `map()`, etc. Use `def` for anything longer than one expression, anything reused, or anything needing a docstring or meaningful name in tracebacks. PEP 8 explicitly discourages assigning lambdas to variables — `f = lambda x: x*2` should be `def f(x): return x*2`.

---

## 12. Comprehensions — List, Dict, Set, Generator

### Concept
Comprehensions provide concise, readable, and **C-optimized** alternatives to equivalent for loops. Generator expressions add memory efficiency for large datasets.

### Code
```python
# List comprehension
squares = [x**2 for x in range(10)]
evens   = [x for x in range(20) if x % 2 == 0]

# Nested list comprehension
matrix = [[1,2,3],[4,5,6]]
flat   = [x for row in matrix for x in row]   # [1,2,3,4,5,6]
pairs  = [(x,y) for x in range(3) for y in range(3) if x != y]

# Dict comprehension
sq_dict = {x: x**2 for x in range(5)}         # {0:0, 1:1, ...}
inverted = {v: k for k, v in d.items()}         # swap keys/values
filtered = {k: v for k, v in d.items() if v>1}

# Set comprehension
unique_sq = {x**2 for x in [-2,-1,0,1,2]}      # {0, 1, 4}

# Generator expression — lazy, O(1) memory
gen   = (x**2 for x in range(1_000_000))        # nothing computed yet
total = sum(x**2 for x in range(1000))           # no list created
found = any(x > 5 for x in lst)

# Conditional expression in comprehension
result = [x if x > 0 else 0 for x in [-1,2,-3,4]]  # [0,2,0,4]

# Walrus for expensive ops
results = [y for x in data if (y := expensive(x)) > 0]
```

### ⚡ Recall
- `[expr for x in ... if cond]` — list
- `{k: v for x in ...}` — dict
- `{expr for x in ...}` — set
- `(expr for x in ...)` — generator (**lazy**, not a tuple!)
- `if` after `for` = **filter** | `val if cond else other` before `for` = **transform**

### 🎯 Interview Q&A

> **Q: What is the difference between a list comprehension and a generator expression?**  
> **A:** A list comprehension `[...]` eagerly creates all items in memory — O(n) space, random access, reusable. A generator expression `(...)` is **lazy** — yields items one at a time, O(1) memory, single-use. Use generators when processing large datasets, feeding into `sum()`/`max()`/`any()`, or when you only iterate once. Rule of thumb: if you don't need the full list in memory simultaneously, use a generator.

> **Q: Are comprehensions faster than for loops?**  
> **A:** Generally yes — CPython optimizes comprehensions at the C level, avoiding per-iteration attribute lookup overhead of `list.append()`. But the performance difference is often small. Readability should be the primary concern. For very large datasets, generator expressions are more important for **memory efficiency** than raw speed.

---

## 13. Exception Handling

### Concept
Python uses `try/except/else/finally`. Exceptions form a class hierarchy rooted at `BaseException`. Always catch **specific** exceptions. Create custom exceptions by subclassing `Exception`.

### Code
```python
# Basic
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Can't divide by zero")

# Multiple except clauses
try:
    x = int(input())
    print(10 / x)
except ValueError:
    print("Not a number")
except ZeroDivisionError:
    print("Can't divide by zero")
except (TypeError, AttributeError) as e:
    print(f"Type error: {e}")
except Exception as e:
    print(f"Unexpected: {type(e).__name__}: {e}")

# else — runs only if NO exception raised
try:
    result = 10 / 2
except ZeroDivisionError:
    print("Error")
else:
    print(f"Result: {result}")  # runs here

# finally — ALWAYS runs (cleanup)
f = None
try:
    f = open("file.txt")
    data = f.read()
except FileNotFoundError:
    print("Not found")
finally:
    if f:
        f.close()   # always runs

# raise
def validate(age):
    if age < 0:
        raise ValueError(f"Age cannot be negative: {age}")
    return age

# Re-raise preserving traceback
try:
    risky()
except Exception:
    log_error()
    raise   # bare raise — preserves original traceback

# Exception chaining
try:
    connect_db()
except ConnectionError as e:
    raise RuntimeError("Startup failed") from e

# Custom exceptions
class ValidationError(ValueError):
    def __init__(self, field, message):
        self.field = field
        super().__init__(f"{field}: {message}")

# Key exception hierarchy
# BaseException → SystemExit, KeyboardInterrupt, GeneratorExit
# Exception → ArithmeticError, LookupError, TypeError,
#             ValueError, AttributeError, OSError, RuntimeError

# Suppress specific exceptions cleanly
from contextlib import suppress
with suppress(FileNotFoundError):
    os.remove("temp.txt")
```

### ⚡ Recall
- `else` = runs if **no exception** | `finally` = **always** runs
- Catch **specific** first, general last
- Bare `raise` = re-raise with original traceback
- `raise X from Y` = chain exceptions (show original cause)
- Custom exceptions: inherit `Exception`, not `BaseException`
- `except Exception` skips `SystemExit`/`KeyboardInterrupt` — good

### 🎯 Interview Q&A

> **Q: What is the purpose of `else` in a try/except block?**  
> **A:** `else` runs when `try` completes **without any exception**. It's cleaner than putting success code at the end of `try` — code in `try` is protected by `except`, but code in `else` is not. If your success-case code threw an exception, it would be incorrectly caught by the `except`. `else` separates "risky operation" from "what to do on success."

> **Q: What is the difference between `except Exception` and bare `except:`?**  
> **A:** `except Exception` catches all exceptions inheriting from `Exception` but **not** `SystemExit`, `KeyboardInterrupt`, or `GeneratorExit` — these are system-level signals that should generally propagate. A bare `except:` catches **everything** including those system signals, preventing Ctrl+C from working and masking `sys.exit()`. Never use bare `except:` in production.

> **Q: How do you create and use custom exceptions?**  
> **A:** Subclass `Exception` (or a specific subclass like `ValueError`). Add `__init__` accepting meaningful parameters and call `super().__init__(message)`. Custom exceptions allow callers to catch specific error types, carry structured context (field name, value), and make your API self-documenting. Use existing built-in exceptions when they semantically fit (`ValueError` for bad values, `TypeError` for wrong types); create custom ones for domain-specific errors.

---

## 14. File I/O

### Concept
Python file handling through `open()`. Always use the `with` statement — it guarantees files are closed even if exceptions occur.

### Code
```python
# Always use context manager
with open("file.txt", "r", encoding="utf-8") as f:
    content = f.read()       # entire file as string (beware large files)

with open("file.txt") as f:
    lines = f.readlines()    # list of lines with \n

with open("file.txt") as f:
    for line in f:           # ✅ most memory-efficient — reads one line at a time
        print(line.strip())

# Writing
with open("out.txt", "w") as f:   # 'w' creates/overwrites
    f.write("Hello\n")

with open("out.txt", "a") as f:   # 'a' appends
    f.writelines(["line1\n", "line2\n"])

# Modes: r(read), w(write/overwrite), a(append), x(exclusive create),
#        b(binary), r+(read+write)

# CSV
import csv
with open("data.csv", "w", newline="") as f:
    writer = csv.DictWriter(f, fieldnames=["name","age"])
    writer.writeheader()
    writer.writerow({"name":"Alice","age":30})

with open("data.csv") as f:
    for row in csv.DictReader(f):
        print(row["name"])

# JSON
import json
with open("data.json", "w") as f:
    json.dump({"key": "value"}, f, indent=2)

with open("data.json") as f:
    data = json.load(f)

json_str = json.dumps({"a":1})   # dict → string
parsed   = json.loads('{"a":1}') # string → dict

# pathlib — modern path operations
from pathlib import Path
p = Path("data") / "file.txt"    # cross-platform path joining
p.exists()
p.read_text(encoding="utf-8")
p.write_text("content")
for f in Path(".").glob("*.py"):
    print(f)
for f in Path(".").rglob("**/*.py"):  # recursive
    print(f)
Path("newdir").mkdir(parents=True, exist_ok=True)
```

### ⚡ Recall
- `with open(...)` = ensures file closed (even on exception)
- `read()` = all at once | iterate file = line-by-line (memory efficient)
- `"w"` overwrites | `"a"` appends | `"x"` fails if file exists
- `pathlib.Path` = modern, cross-platform path handling
- Always specify `encoding="utf-8"` for text files

### 🎯 Interview Q&A

> **Q: Why use `with open(...)` instead of `open()` directly?**  
> **A:** `with` ensures `f.close()` is called **even if an exception occurs**. Without it, if your code throws before reaching `f.close()`, the file handle leaks. On systems with file descriptor limits, accumulated leaks cause `OSError: too many open files`. The context manager is idiomatic, concise, and exception-safe.

> **Q: What is the most memory-efficient way to read a large file?**  
> **A:** Iterate the file object directly: `for line in f:` — this reads one line at a time without loading the entire file into memory. `f.read()` loads everything at once (dangerous for GB files). `f.readlines()` also loads all lines into a list. For large files, line-by-line iteration or reading in chunks with `f.read(chunk_size)` are the correct approaches.
---

## 15. OOP — Classes & Objects

### Concept
**Object-Oriented Programming** organises code into **classes** (blueprints) and **objects** (instances). Python supports all four OOP pillars: Encapsulation, Abstraction, Inheritance, Polymorphism. Everything in Python is already an object — OOP lets you create your own types.

**Key terms:**
- **Class** — the blueprint/template
- **Object/Instance** — a concrete realisation of a class
- **Attribute** — data stored on an object (`self.name`)
- **Method** — function defined inside a class
- **`__init__`** — constructor, called when creating an instance
- **`self`** — reference to the current instance

### Code
```python
class BankAccount:
    # Class attribute — shared across ALL instances
    bank_name = "PyBank"
    _instance_count = 0

    def __init__(self, owner: str, balance: float = 0.0):
        # Instance attributes — unique per object
        self.owner   = owner
        self._balance = balance          # _ = convention: "internal use"
        self.__id = BankAccount._instance_count  # __ = name-mangled
        BankAccount._instance_count += 1

    # Instance method — acts on self
    def deposit(self, amount: float) -> None:
        if amount <= 0:
            raise ValueError("Deposit must be positive")
        self._balance += amount

    def withdraw(self, amount: float) -> None:
        if amount > self._balance:
            raise ValueError("Insufficient funds")
        self._balance -= amount

    # Property — attribute-like access with getter/setter logic
    @property
    def balance(self) -> float:
        return self._balance

    @balance.setter
    def balance(self, value: float) -> None:
        if value < 0:
            raise ValueError("Balance cannot be negative")
        self._balance = value

    # Class method — acts on the class, not instance
    @classmethod
    def get_instance_count(cls) -> int:
        return cls._instance_count

    # Alternative constructor pattern (common use of classmethod)
    @classmethod
    def from_dict(cls, data: dict) -> "BankAccount":
        return cls(data["owner"], data.get("balance", 0))

    # Static method — utility, no access to class or instance
    @staticmethod
    def validate_amount(amount: float) -> bool:
        return isinstance(amount, (int, float)) and amount > 0

    # String representations
    def __repr__(self) -> str:
        # For developers — unambiguous, ideally eval()-able
        return f"BankAccount(owner={self.owner!r}, balance={self._balance})"

    def __str__(self) -> str:
        # For end users — readable
        return f"{self.owner}'s account: ${self._balance:.2f}"

# Usage
acc = BankAccount("Alice", 1000)
acc.deposit(500)
print(acc.balance)        # 1500 — via property getter
acc.balance = 2000        # via property setter
print(acc)                # Alice's account: $2000.00
print(repr(acc))          # BankAccount(owner='Alice', balance=2000)

acc2 = BankAccount.from_dict({"owner": "Bob", "balance": 500})
print(BankAccount.get_instance_count())   # 2
print(BankAccount.validate_amount(100))   # True

# Name mangling — __attr becomes _ClassName__attr
print(acc._BankAccount__id)   # 0 — accessible but discouraged
```

### ⚡ Recall
- `__init__` = constructor | `self` = current instance
- `_name` = protected (convention) | `__name` = name-mangled (private)
- `@property` = getter/setter with attribute-like syntax
- `@classmethod` = receives `cls`, factory methods & class-level ops
- `@staticmethod` = no `self`/`cls`, pure utility function
- Class attribute shared by all | Instance attribute unique per object

### 🎯 Interview Q&A

> **Q: What is the difference between `@classmethod` and `@staticmethod`?**  
> **A:** A `@classmethod` receives the class (`cls`) as its first argument automatically — it can access and modify class-level state and create instances. It's used for **alternative constructors** (`from_dict`, `from_json`) and factory methods. A `@staticmethod` receives neither `self` nor `cls` — it's essentially a regular function namespaced inside the class for organisational purposes. Use it for utility functions that are logically related to the class but don't need to access class or instance data.

> **Q: What is the difference between `_name`, `__name`, and `name`?**  
> **A:** `name` is a public attribute — accessible from anywhere. `_name` is a **convention** for "internal/protected" — it signals "don't touch from outside," but Python doesn't enforce it. `__name` triggers **name mangling** — Python renames it to `_ClassName__name`, making accidental overrides in subclasses less likely. It's not truly private (you can still access it via the mangled name), but it prevents accidental collisions in inheritance hierarchies. Use `_name` for most "private" attributes; `__name` only when you specifically need to prevent subclass attribute name collisions.

> **Q: What is a `@property` and why use it instead of direct attribute access?**  
> **A:** A `@property` lets you define **getter, setter, and deleter** logic for an attribute while keeping the clean attribute-access syntax (`obj.balance` instead of `obj.get_balance()`). Benefits: (1) add validation logic when setting values; (2) compute values on the fly instead of storing them; (3) maintain backward compatibility — if you start with a plain attribute and later need validation, converting to a property doesn't change the calling code. It's a core application of encapsulation.

> **Q: What is the difference between class attributes and instance attributes?**  
> **A:** A **class attribute** is defined on the class body and shared among all instances. Changing it via the class changes it for everyone: `BankAccount.bank_name = "NewBank"`. An **instance attribute** is defined in `__init__` via `self.attr = value` and is unique per object. If you set a class attribute through an instance (`acc.bank_name = "Other"`), Python creates a new **instance attribute** that shadows the class attribute for that specific object — the class attribute is unchanged for other instances. This shadowing behavior is a common gotcha.

---

## 16. Inheritance & Polymorphism

### Concept
**Inheritance** lets a class (subclass) inherit attributes and methods from another (superclass), promoting code reuse. **Polymorphism** lets different classes be used interchangeably if they share an interface — "same interface, different behaviour."

Python supports **multiple inheritance** and uses the **MRO (Method Resolution Order)** — specifically the **C3 linearisation** algorithm — to determine which method gets called.

### Code
```python
# ── Single Inheritance ───────────────────────────────────────────
class Animal:
    def __init__(self, name: str):
        self.name = name

    def speak(self) -> str:
        raise NotImplementedError("Subclasses must implement speak()")

    def __str__(self):
        return f"{self.__class__.__name__}({self.name})"

class Dog(Animal):
    def speak(self) -> str:
        return f"{self.name} says Woof!"

    def fetch(self) -> str:
        return f"{self.name} fetches the ball"

class Cat(Animal):
    def speak(self) -> str:
        return f"{self.name} says Meow!"

# Polymorphism — same interface, different behaviour
animals = [Dog("Rex"), Cat("Whiskers"), Dog("Buddy")]
for animal in animals:
    print(animal.speak())   # each calls its own speak()

# isinstance vs type
print(isinstance(Dog("Rex"), Animal))  # True — checks full hierarchy
print(type(Dog("Rex")) == Animal)      # False — exact type only

# ── super() ─────────────────────────────────────────────────────
class ElectricDog(Dog):
    def __init__(self, name: str, battery: int):
        super().__init__(name)    # call parent __init__
        self.battery = battery

    def speak(self) -> str:
        base = super().speak()    # call parent method
        return f"{base} (battery: {self.battery}%)"

ed = ElectricDog("Robo", 80)
print(ed.speak())   # Robo says Woof! (battery: 80%)

# ── Abstract Base Classes ────────────────────────────────────────
from abc import ABC, abstractmethod

class Shape(ABC):
    @abstractmethod
    def area(self) -> float:
        """Must be implemented by all subclasses."""
        pass

    @abstractmethod
    def perimeter(self) -> float:
        pass

    def describe(self) -> str:
        return f"{self.__class__.__name__}: area={self.area():.2f}"

class Circle(Shape):
    def __init__(self, radius: float):
        self.radius = radius

    def area(self) -> float:
        import math
        return math.pi * self.radius ** 2

    def perimeter(self) -> float:
        import math
        return 2 * math.pi * self.radius

class Rectangle(Shape):
    def __init__(self, w: float, h: float):
        self.w, self.h = w, h

    def area(self) -> float:
        return self.w * self.h

    def perimeter(self) -> float:
        return 2 * (self.w + self.h)

# Shape()  # ← TypeError: Can't instantiate abstract class

# ── Multiple Inheritance & MRO ────────────────────────────────────
class A:
    def hello(self): return "A"

class B(A):
    def hello(self): return "B"

class C(A):
    def hello(self): return "C"

class D(B, C):   # MRO: D → B → C → A
    pass

print(D().hello())          # "B"  — first in MRO after D
print(D.__mro__)            # (<class 'D'>, <class 'B'>, <class 'C'>, <class 'A'>, ...)

# ── Mixin Pattern ────────────────────────────────────────────────
class JSONMixin:
    """Adds JSON serialisation to any class."""
    def to_json(self) -> str:
        import json
        return json.dumps(self.__dict__)

class TimestampMixin:
    """Adds creation timestamp to any class."""
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        from datetime import datetime
        self.created_at = datetime.now().isoformat()

class User(TimestampMixin, JSONMixin):
    def __init__(self, name: str):
        super().__init__()
        self.name = name

u = User("Alice")
print(u.to_json())      # {"name": "Alice", "created_at": "..."}
```

### ⚡ Recall
- `super().__init__()` = call parent constructor
- `isinstance(obj, Class)` = checks full hierarchy (incl. parents)
- `type(obj) == Class` = exact type only, no inheritance
- **ABC** enforces interface — subclasses MUST implement `@abstractmethod`
- **MRO** = C3 linearisation, left-to-right, depth-first with merge
- **Mixin** = small, focused class designed for multiple inheritance

### 🎯 Interview Q&A

> **Q: What is the Method Resolution Order (MRO) and how does Python calculate it?**  
> **A:** MRO defines the order in which Python searches for methods and attributes in an inheritance hierarchy. Python uses the **C3 linearisation** algorithm: start with the class itself, then linearise parent classes left-to-right, ensuring a class always appears before its parents and the left-to-right order of parents is preserved. `ClassName.__mro__` shows the full order. The MRO is critical in multiple inheritance — Python calls the first matching method found in the MRO. `super()` follows the MRO, not just the direct parent.

> **Q: What is the difference between `isinstance()` and `type()`?**  
> **A:** `type(obj) == SomeClass` checks for **exact type** — returns False if obj is an instance of a subclass. `isinstance(obj, SomeClass)` checks if obj is an instance of `SomeClass` **or any subclass** — it respects the full inheritance hierarchy. In practice, almost always use `isinstance()` — it supports polymorphism correctly. `type()` is mainly used when you specifically need the exact type (e.g., to distinguish a `bool` from an `int`, since `bool` is a subclass of `int`).

> **Q: What is an Abstract Base Class and when would you use one?**  
> **A:** An **ABC** (from `abc.ABC`) is a class that cannot be instantiated directly and defines **abstract methods** that all concrete subclasses must implement. Use ABCs when: (1) defining an interface/protocol that multiple classes must follow; (2) you want Python to enforce implementation at class-creation time rather than runtime; (3) building a plugin or framework where users provide implementations. Without ABCs, missing method implementations only fail at runtime when the method is called.

---

## 17. Magic / Dunder Methods

### Concept
**Dunder (double-underscore) methods** let your objects integrate seamlessly with Python's built-in operations and syntax. They define how objects respond to `+`, `len()`, `==`, iteration, context managers, and more.

### Code
```python
class Vector:
    def __init__(self, x: float, y: float):
        self.x = x
        self.y = y

    # ── String representations ────────────────────────────────
    def __repr__(self) -> str:
        return f"Vector({self.x}, {self.y})"   # for developers

    def __str__(self) -> str:
        return f"({self.x}, {self.y})"          # for users

    # ── Arithmetic operators ──────────────────────────────────
    def __add__(self, other: "Vector") -> "Vector":
        return Vector(self.x + other.x, self.y + other.y)

    def __sub__(self, other: "Vector") -> "Vector":
        return Vector(self.x - other.x, self.y - other.y)

    def __mul__(self, scalar: float) -> "Vector":
        return Vector(self.x * scalar, self.y * scalar)

    def __rmul__(self, scalar: float) -> "Vector":
        return self.__mul__(scalar)  # supports: 3 * vector

    def __neg__(self) -> "Vector":
        return Vector(-self.x, -self.y)

    # ── Comparison ────────────────────────────────────────────
    def __eq__(self, other: object) -> bool:
        if not isinstance(other, Vector):
            return NotImplemented
        return self.x == other.x and self.y == other.y

    def __lt__(self, other: "Vector") -> bool:
        return abs(self) < abs(other)

    # ── Numeric protocols ─────────────────────────────────────
    def __abs__(self) -> float:
        return (self.x**2 + self.y**2) ** 0.5

    def __bool__(self) -> bool:
        return self.x != 0 or self.y != 0  # zero vector is falsy

    def __round__(self, n=0) -> "Vector":
        return Vector(round(self.x, n), round(self.y, n))

    # ── Container protocol ────────────────────────────────────
    def __len__(self) -> int:
        return 2   # a 2D vector has 2 components

    def __getitem__(self, index: int) -> float:
        return (self.x, self.y)[index]

    def __iter__(self):
        yield self.x
        yield self.y

    # ── Hashing (needed if you define __eq__) ─────────────────
    def __hash__(self) -> int:
        return hash((self.x, self.y))

# Usage
v1 = Vector(1, 2)
v2 = Vector(3, 4)
print(v1 + v2)     # (4, 6)
print(v1 == v1)    # True
print(abs(v2))     # 5.0
print(len(v1))     # 2
print(list(v1))    # [1, 2]
x, y = v1          # unpacking via __iter__
v_set = {v1, v2}   # hashable via __hash__

# ── Context Manager protocol ──────────────────────────────────
class Timer:
    def __enter__(self):
        import time
        self.start = time.time()
        return self          # value bound to 'as' variable

    def __exit__(self, exc_type, exc_val, exc_tb):
        import time
        elapsed = time.time() - self.start
        print(f"Elapsed: {elapsed:.4f}s")
        return False  # False = don't suppress exceptions

with Timer() as t:
    result = sum(range(1_000_000))

# ── Callable objects ──────────────────────────────────────────
class Multiplier:
    def __init__(self, factor):
        self.factor = factor

    def __call__(self, x):
        return x * self.factor

triple = Multiplier(3)
triple(5)    # 15 — called like a function!
callable(triple)  # True

# ── Common dunders reference ──────────────────────────────────
# __init__      constructor
# __del__       destructor (called before GC)
# __repr__      repr(obj)
# __str__       str(obj), print(obj)
# __len__       len(obj)
# __getitem__   obj[key]
# __setitem__   obj[key] = val
# __delitem__   del obj[key]
# __contains__  x in obj
# __iter__      iter(obj)
# __next__      next(obj)
# __enter__/__exit__  with statement
# __call__      obj()
# __eq__        ==
# __lt__/le/gt/ge    comparison
# __add__/sub/mul/truediv/floordiv/mod/pow
# __hash__      hash(obj)
# __bool__      bool(obj)
```

### ⚡ Recall
- `__repr__` = for **developers** (unambiguous) | `__str__` = for **users** (readable)
- If you define `__eq__`, Python sets `__hash__ = None` → must define `__hash__` too if you need hashing
- `__enter__`/`__exit__` = context manager protocol
- `__call__` = makes objects callable like functions
- `__getitem__` + `__len__` = sequence protocol (enables indexing + iteration)
- Return `NotImplemented` (not `NotImplementedError`) from comparison methods when types don't match

### 🎯 Interview Q&A

> **Q: What is the difference between `__repr__` and `__str__`?**  
> **A:** `__repr__` is for **developers** — it should return an unambiguous, ideally eval()-able string showing the object's type and state: `Vector(1, 2)`. If `eval(repr(obj)) == obj`, that's ideal. `__str__` is for **end users** — a readable, human-friendly representation: `(1, 2)`. When you `print(obj)`, Python calls `__str__`. When you inspect an object in the REPL or a list, Python calls `__repr__`. If only `__repr__` is defined, `str(obj)` falls back to it. If only `__str__` is defined, the REPL uses `__repr__` which falls back to a default like `<Vector object at 0x...>`. Best practice: always define at least `__repr__`.

> **Q: Why does defining `__eq__` require you to also define `__hash__`?**  
> **A:** When you define `__eq__`, Python automatically sets `__hash__ = None`, making the object **unhashable** by default. This is because the hash contract requires: if `a == b`, then `hash(a) == hash(b)`. If you define custom equality without defining a corresponding hash, two "equal" objects could have different hashes, violating this contract and breaking dicts and sets. If you want your objects to be both equality-comparable and hashable (usable in sets/dicts), you must explicitly define both `__eq__` and `__hash__`, ensuring equal objects produce equal hashes.

---

## 18. Decorators

### Concept
A **decorator** is a function that **wraps another function** to extend or modify its behaviour without changing its source code. They rely on functions being first-class objects and closures.

Syntax `@decorator` is syntactic sugar for `func = decorator(func)`.

### Code
```python
import functools, time

# ── Basic decorator ───────────────────────────────────────────────
def timer(func):
    @functools.wraps(func)   # preserves __name__, __doc__, __module__
    def wrapper(*args, **kwargs):
        start  = time.perf_counter()
        result = func(*args, **kwargs)
        end    = time.perf_counter()
        print(f"{func.__name__} took {end-start:.4f}s")
        return result
    return wrapper

@timer
def slow_sum(n):
    return sum(range(n))

slow_sum(1_000_000)   # "slow_sum took 0.0341s"

# ── Decorator with arguments ──────────────────────────────────────
def repeat(times):
    """Decorator factory — returns a decorator."""
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            for _ in range(times):
                result = func(*args, **kwargs)
            return result
        return wrapper
    return decorator

@repeat(3)
def greet(name):
    print(f"Hello, {name}!")

greet("Alice")   # prints 3 times

# ── Logging decorator ─────────────────────────────────────────────
def log_calls(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        args_str = ", ".join(map(repr, args))
        kwargs_str = ", ".join(f"{k}={v!r}" for k, v in kwargs.items())
        all_args = ", ".join(filter(None, [args_str, kwargs_str]))
        print(f"Calling {func.__name__}({all_args})")
        result = func(*args, **kwargs)
        print(f"{func.__name__} returned {result!r}")
        return result
    return wrapper

# ── Retry decorator ───────────────────────────────────────────────
def retry(max_attempts=3, exceptions=(Exception,)):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            for attempt in range(1, max_attempts + 1):
                try:
                    return func(*args, **kwargs)
                except exceptions as e:
                    if attempt == max_attempts:
                        raise
                    print(f"Attempt {attempt} failed: {e}. Retrying...")
        return wrapper
    return decorator

@retry(max_attempts=3, exceptions=(ConnectionError,))
def fetch_data(url):
    # might raise ConnectionError
    pass

# ── Cache / Memoization ───────────────────────────────────────────
# Built-in: functools.lru_cache
from functools import lru_cache, cache

@lru_cache(maxsize=128)
def fib(n):
    if n < 2: return n
    return fib(n-1) + fib(n-2)

@cache   # Python 3.9+ — unlimited cache (same as lru_cache(None))
def expensive(n):
    return n * n

fib(100)            # O(n) instead of O(2^n)
fib.cache_info()    # CacheInfo(hits=98, misses=101, maxsize=128, currsize=101)
fib.cache_clear()   # clear the cache

# ── Class-based decorator ─────────────────────────────────────────
class CountCalls:
    def __init__(self, func):
        functools.update_wrapper(self, func)
        self.func  = func
        self.count = 0

    def __call__(self, *args, **kwargs):
        self.count += 1
        return self.func(*args, **kwargs)

@CountCalls
def add(a, b): return a + b

add(1, 2)
add(3, 4)
print(add.count)   # 2

# ── Stacking decorators ───────────────────────────────────────────
@timer
@log_calls
def multiply(a, b):
    return a * b

# Equivalent to: multiply = timer(log_calls(multiply))
# Outermost decorator (timer) is applied last, runs first
```

### ⚡ Recall
- `@decorator` = `func = decorator(func)` — syntactic sugar
- Always use `@functools.wraps(func)` to preserve metadata
- Decorator factory (with args): 3 layers — factory → decorator → wrapper
- `@lru_cache` = built-in memoisation for pure functions
- Stacking: decorators apply **bottom-up**, execute **top-down**

### 🎯 Interview Q&A

> **Q: What is a decorator and how does it work?**  
> **A:** A decorator is a callable that takes a function and returns a replacement function, adding behaviour before/after/around the original. `@timer` above a function is syntactic sugar for `func = timer(func)`. Internally, the decorator uses a **closure** — the `wrapper` function captures the original `func`. Common uses: logging, timing, retrying, caching, authentication checks, rate limiting. The key to writing correct decorators is using `@functools.wraps(func)` to copy `__name__`, `__doc__`, and other metadata from the original to the wrapper.

> **Q: What does `@functools.wraps` do and why is it important?**  
> **A:** Without `@functools.wraps(func)`, the wrapped function loses its identity — `func.__name__` becomes `"wrapper"` and `func.__doc__` becomes the wrapper's docstring. This breaks introspection tools, documentation generators, test frameworks, and stack traces. `@functools.wraps(func)` copies `__name__`, `__qualname__`, `__doc__`, `__dict__`, and `__module__` from the original function to the wrapper, making the decorator transparent to introspection.

> **Q: What is `@lru_cache` and when do you use it?**  
> **A:** `@functools.lru_cache(maxsize=N)` automatically **memoises** a function — it caches the result of each unique set of arguments and returns the cached result on repeated calls. It uses an LRU (Least Recently Used) eviction policy when the cache is full. Use it on **pure functions** (same inputs always produce same outputs, no side effects) that are called repeatedly with the same arguments — like recursive algorithms (Fibonacci, dynamic programming), expensive computations, or database lookups with stable data. The function's arguments must be hashable.

---

## 19. Generators & Iterators

### Concept
An **iterator** is any object with `__iter__()` and `__next__()` methods. A **generator** is a special function that uses `yield` to produce values lazily — pausing execution between yields. Generators are memory-efficient for large sequences since they produce one item at a time.

### Code
```python
# ── Generator Function ────────────────────────────────────────────
def count_up(start, end):
    """Yields integers from start to end inclusive."""
    current = start
    while current <= end:
        yield current        # pause here, resume on next()
        current += 1

gen = count_up(1, 5)
next(gen)   # 1
next(gen)   # 2
list(gen)   # [3, 4, 5]  — exhausted after this

# Generator is lazy — nothing runs until consumed
def infinite_sequence():
    n = 0
    while True:
        yield n
        n += 1

import itertools
first_10 = list(itertools.islice(infinite_sequence(), 10))

# ── yield from — delegate to sub-generator ───────────────────────
def chain(*iterables):
    for it in iterables:
        yield from it   # delegates, more efficient than a loop

list(chain([1,2], [3,4], [5]))   # [1,2,3,4,5]

# ── Generator pipeline — memory-efficient data processing ─────────
def read_lines(filename):
    with open(filename) as f:
        yield from f

def filter_comments(lines):
    for line in lines:
        if not line.startswith("#"):
            yield line

def parse_ints(lines):
    for line in lines:
        yield int(line.strip())

# Pipeline — each step is lazy
# pipeline = parse_ints(filter_comments(read_lines("data.txt")))

# ── Custom Iterator class ─────────────────────────────────────────
class Range:
    """Custom range-like iterator."""
    def __init__(self, start, stop, step=1):
        self.current = start
        self.stop    = stop
        self.step    = step

    def __iter__(self):
        return self   # iterator returns itself

    def __next__(self):
        if self.current >= self.stop:
            raise StopIteration
        val = self.current
        self.current += self.step
        return val

for x in Range(0, 10, 2):
    print(x)   # 0 2 4 6 8

# ── Generator expressions ─────────────────────────────────────────
gen = (x**2 for x in range(1000000))   # O(1) memory
total = sum(x**2 for x in range(1000)) # no list materialised

# ── send() — two-way communication ──────────────────────────────
def accumulator():
    total = 0
    while True:
        value = yield total   # yield sends total OUT, receives value IN
        if value is None:
            break
        total += value

acc = accumulator()
next(acc)         # prime the generator (advance to first yield)
acc.send(10)      # sends 10, returns 10
acc.send(20)      # sends 20, returns 30
acc.send(5)       # sends 5, returns 35

# ── Practical: memory-efficient file processing ───────────────────
def process_large_file(filepath):
    with open(filepath) as f:
        for line in f:                    # reads one line at a time
            stripped = line.strip()
            if stripped:
                yield stripped.split(",")  # yield parsed record
```

### ⚡ Recall
- `yield` = pause function, return value, resume on `next()`
- Generator is **lazy** — nothing executes until consumed
- `yield from iterable` = delegate to sub-generator efficiently
- Generators can only be iterated **once** — exhausted after first pass
- `StopIteration` signals the end of an iterator
- Generator expressions `(x for x in ...)` = lazy list comprehensions

### 🎯 Interview Q&A

> **Q: What is the difference between a generator and a regular function?**  
> **A:** A regular function runs to completion and returns a value. A **generator function** (containing `yield`) returns a **generator object** immediately without executing any code. Each call to `next()` runs the function until the next `yield`, pauses there, and returns the yielded value. State (local variables, loop positions) is preserved between calls. This enables lazy evaluation — producing values on demand without storing the entire sequence in memory. A generator is ideal for large datasets, infinite sequences, and data pipelines.

> **Q: What is `yield from` and when would you use it?**  
> **A:** `yield from iterable` delegates iteration to a sub-iterable — it yields every item from the inner iterable without writing a loop. It's cleaner and more efficient than `for item in iterable: yield item` because it optimises the inner loop at the C level. It also properly propagates `send()`, `throw()`, and `close()` calls to the sub-generator, making it essential for building coroutine-based pipelines. Use `yield from` when building generator chains, tree traversals, or flattening nested iterables.

> **Q: How is a generator different from a list comprehension? When do you choose each?**  
> **A:** A list comprehension `[x for x in ...]` **eagerly** creates all items in memory at once. A generator expression `(x for x in ...)` is **lazy** — creates items on demand. Memory: list uses O(n) space; generator uses O(1). Speed: if you need all elements, a list is slightly faster due to lower per-item overhead. Choose a **generator** when: dataset is very large, you only iterate once, you're feeding into `sum()`/`any()`/`max()`, or you're building a pipeline. Choose a **list** when: you need random access, multiple iterations, or `len()`.

---

## 20. Context Managers

### Concept
A **context manager** manages resources cleanly — guaranteeing setup and teardown (even on exceptions) via the `with` statement. Implements `__enter__` / `__exit__` protocol or uses `contextlib.contextmanager`.

### Code
```python
# ── Class-based context manager ───────────────────────────────────
class DatabaseConnection:
    def __init__(self, url: str):
        self.url = url
        self.conn = None

    def __enter__(self):
        print(f"Connecting to {self.url}")
        self.conn = {"connected": True}   # simulate connection
        return self.conn   # bound to 'as' variable

    def __exit__(self, exc_type, exc_val, exc_tb):
        print("Closing connection")
        self.conn = None
        if exc_type:
            print(f"Exception occurred: {exc_val}")
        return False  # False = re-raise any exception
                      # True  = suppress the exception

with DatabaseConnection("db://localhost") as conn:
    print(conn)   # {"connected": True}
# connection auto-closed here

# ── contextlib.contextmanager — generator-based ───────────────────
from contextlib import contextmanager

@contextmanager
def timer(label=""):
    import time
    start = time.perf_counter()
    try:
        yield    # code inside 'with' block runs here
    finally:
        elapsed = time.perf_counter() - start
        print(f"{label}: {elapsed:.4f}s")

with timer("sort"):
    data = sorted(range(1_000_000, 0, -1))

# ── Multiple context managers ──────────────────────────────────────
with open("input.txt") as fin, open("output.txt", "w") as fout:
    fout.write(fin.read())

# ── contextlib utilities ──────────────────────────────────────────
from contextlib import suppress, redirect_stdout, ExitStack
import io

# Suppress specific exceptions
with suppress(FileNotFoundError):
    import os
    os.remove("nonexistent.txt")

# Redirect stdout
buffer = io.StringIO()
with redirect_stdout(buffer):
    print("captured output")
output = buffer.getvalue()   # "captured output\n"

# ExitStack — dynamically manage variable number of context managers
with ExitStack() as stack:
    files = [stack.enter_context(open(f)) for f in ["a.txt","b.txt"]]

# ── Practical: transaction context manager ───────────────────────
@contextmanager
def transaction(conn):
    try:
        yield conn
        conn.commit()
    except Exception:
        conn.rollback()
        raise

# with transaction(db_conn) as conn:
#     conn.execute("INSERT ...")
#     conn.execute("UPDATE ...")
```

### ⚡ Recall
- `__enter__` = setup, returns resource | `__exit__` = teardown
- `__exit__(exc_type, exc_val, exc_tb)` — return `True` to suppress exceptions
- `@contextmanager` = generator-based CM — `yield` is where `with` body runs
- `try/finally` inside `@contextmanager` ensures cleanup even on exception
- `ExitStack` = manage a dynamic number of context managers

### 🎯 Interview Q&A

> **Q: How does a context manager work internally?**  
> **A:** The `with obj as x:` statement calls `obj.__enter__()` — its return value is bound to `x`. After the block finishes (whether normally or due to an exception), Python calls `obj.__exit__(exc_type, exc_val, exc_tb)`. If no exception occurred, all three arguments are `None`. If `__exit__` returns a truthy value, the exception is suppressed; otherwise it propagates. This guarantees cleanup code always runs — like a `try/finally` but reusable and composable.

> **Q: What is the difference between the class-based and `@contextmanager` approaches?**  
> **A:** Both achieve the same result. The **class-based** approach with `__enter__`/`__exit__` is more explicit and suitable for complex state management or when the context manager needs to be subclassed. The **`@contextmanager` approach** (generator) is more concise — code before `yield` is setup (`__enter__`), code after `yield` is teardown (`__exit__`), and wrapping in `try/finally` handles exceptions. Use `@contextmanager` for simple, one-off context managers; use classes when you need the full protocol.

---

## 21. Modules, Packages & Imports

### Concept
A **module** is any `.py` file. A **package** is a directory with an `__init__.py` file (optional in Python 3.3+ for namespace packages). Imports make names from one module available in another.

### Code
```python
# ── Import styles ─────────────────────────────────────────────────
import math                          # import module
import math as m                     # alias
from math import pi, sqrt            # import specific names
from math import *                   # import all (discouraged)
from os.path import join, exists     # from submodule

# ── Conditional import ────────────────────────────────────────────
try:
    import ujson as json    # fast JSON library
except ImportError:
    import json             # fallback to stdlib

# ── Relative imports (inside a package) ──────────────────────────
# from . import sibling_module
# from .. import parent_package_module
# from .utils import helper_func

# ── __name__ guard ────────────────────────────────────────────────
def main():
    print("Running as script")

if __name__ == "__main__":
    main()   # only runs when file is executed directly, not when imported

# ── Module attributes ─────────────────────────────────────────────
import math
print(math.__name__)    # "math"
print(math.__file__)    # path to the .py or .so file
print(dir(math))        # list all attributes/functions

# ── sys.path — where Python looks for modules ─────────────────────
import sys
print(sys.path)           # list of directories
sys.path.insert(0, "/my/custom/path")  # add custom path

# ── __init__.py — package initialiser ───────────────────────────
# mypackage/
#   __init__.py      ← makes directory a package
#   module_a.py
#   module_b.py
#   subpackage/
#       __init__.py
#       module_c.py

# ── importlib — dynamic imports ──────────────────────────────────
import importlib
mod = importlib.import_module("json")
importlib.reload(mod)    # reload module (useful in development)

# ── __all__ — control what 'from module import *' exports ─────────
# In your module:
__all__ = ["public_func", "PublicClass"]  # only these are exported
```

### ⚡ Recall
- `if __name__ == "__main__":` = runs only when executed directly
- `__init__.py` = makes a directory a package
- `sys.path` = Python's module search path
- `from x import *` is discouraged — pollutes namespace, hides origins
- Circular imports = module A imports B, B imports A = avoid by restructuring

### 🎯 Interview Q&A

> **Q: What does `if __name__ == "__main__":` do?**  
> **A:** When Python runs a file, it sets `__name__` to `"__main__"` if it's the entry point (run directly), or to the module's name if it's being imported. This guard prevents the block from executing when the module is imported — it's how you make a module both importable as a library and executable as a script. Code in the guard (like `main()` calls) only runs when you execute the file directly.

> **Q: What is the difference between `import module` and `from module import name`?**  
> **A:** `import module` imports the module object — you access its contents via `module.name`. `from module import name` binds the name directly in the current namespace. The module is fully loaded in both cases. `from ... import *` imports all public names (or all names in `__all__` if defined) — discouraged because it pollutes the namespace and makes it hard to trace where names come from. For readability and traceability, explicit `from module import specific_name` or `import module` are preferred.

---

## 22. Built-in Functions

### Concept
Python's built-in functions are always available without importing. Mastering them is essential for writing idiomatic, concise Python.

### Code
```python
# ── Type & Identity ───────────────────────────────────────────────
type(42)                    # <class 'int'>
isinstance(42, (int,float)) # True
id([1,2,3])                 # memory address

# ── Numeric ───────────────────────────────────────────────────────
abs(-5)           # 5
round(3.14159, 2) # 3.14
round(2.5)        # 2  ← banker's rounding (rounds to even!)
pow(2, 10)        # 1024
pow(2, 10, 1000)  # 24  (modular exponentiation — efficient!)
divmod(17, 5)     # (3, 2)  — (quotient, remainder)

# ── Sequences ─────────────────────────────────────────────────────
len([1,2,3])                     # 3
sorted([3,1,2])                  # [1, 2, 3]
sorted([3,1,2], reverse=True)    # [3, 2, 1]
sorted(["b","a","c"], key=str.upper)
reversed([1,2,3])                # iterator (not list!)
list(reversed([1,2,3]))          # [3, 2, 1]
enumerate(["a","b"], start=1)    # (1,'a'), (2,'b')
zip([1,2,3],[4,5,6])             # (1,4),(2,5),(3,6)
zip(*[[1,2],[3,4],[5,6]])        # transpose a matrix!

# ── Functional ────────────────────────────────────────────────────
map(str, [1,2,3])               # '1','2','3'
filter(bool, [0,1,"",2])        # 1, 2
any([0, False, 1])              # True
all([1, True, "x"])             # True

# ── String/Repr ───────────────────────────────────────────────────
repr([1,2,3])    # '[1, 2, 3]'
str(42)          # '42'
ord('A')         # 65  — char to ASCII
chr(65)          # 'A' — ASCII to char
hex(255)         # '0xff'
bin(10)          # '0b1010'
oct(8)           # '0o10'
format(3.14159, ".2f")  # "3.14"

# ── Iteration utilities ───────────────────────────────────────────
max([3,1,4])               # 4
max([3,1,4], key=abs)
min([3,1,4])               # 1
sum([1,2,3])               # 6
sum([1,2,3], start=10)     # 16

# ── Object introspection ──────────────────────────────────────────
dir(list)             # list all attributes/methods
hasattr(obj, "name")  # check attribute exists
getattr(obj, "name", default)   # get attribute safely
setattr(obj, "name", value)     # set attribute
delattr(obj, "name")            # delete attribute

# ── Misc ──────────────────────────────────────────────────────────
callable(print)       # True — has __call__
vars(obj)             # obj.__dict__
hash("hello")         # integer hash
open("f.txt")         # file object
input("Enter: ")      # read from stdin
print(*[1,2,3], sep=", ", end="\n")
eval("1 + 2")         # 3  — evaluate expression (security risk!)
exec("x = 1")         # execute statement
```

### ⚡ Recall
- `round(2.5)` = **2**, not 3 — banker's rounding (rounds to even)
- `pow(base, exp, mod)` = modular exponentiation — O(log exp) — crucial for cryptography
- `divmod(a, b)` = `(a//b, a%b)` in one call
- `zip(*matrix)` = transpose a matrix
- `getattr(obj, name, default)` = safe attribute access
- `any([])` = `False` | `all([])` = `True` (vacuously true)

### 🎯 Interview Q&A

> **Q: What does `round(2.5)` return and why?**  
> **A:** It returns `2`, not `3`. Python uses **banker's rounding** (round half to even) — it rounds to the nearest even number when the value is exactly halfway. `round(0.5)=0`, `round(1.5)=2`, `round(2.5)=2`, `round(3.5)=4`. This minimises cumulative rounding error in statistical computations. For traditional rounding (always round half up), use `math.ceil(x - 0.5)` or `decimal.ROUND_HALF_UP`.

> **Q: What is the three-argument form of `pow()`?**  
> **A:** `pow(base, exp, mod)` computes `(base ** exp) % mod` efficiently using **modular exponentiation** — much faster than `(base ** exp) % mod` because it avoids computing the full (potentially enormous) `base ** exp` intermediate value. It uses the fast exponentiation algorithm O(log exp). Critical in cryptography (RSA), hashing algorithms, and competitive programming for modular arithmetic.

---

## 23. Collections Module

### Concept
The `collections` module provides specialised container types that extend the built-in dict, list, set, and tuple — often providing better performance or ergonomics for specific use cases.

### Code
```python
from collections import (
    defaultdict, Counter, OrderedDict,
    deque, namedtuple, ChainMap
)

# ── defaultdict — auto-creates missing keys ───────────────────────
# defaultdict(int)  → missing keys default to 0
word_count = defaultdict(int)
for word in "the cat sat on the mat".split():
    word_count[word] += 1
# defaultdict(int, {'the':2, 'cat':1, 'sat':1, 'on':1, 'mat':1})

# defaultdict(list) → missing keys default to []
groups = defaultdict(list)
for key, val in [("a",1),("b",2),("a",3)]:
    groups[key].append(val)   # {"a":[1,3], "b":[2]}

# defaultdict(set) → missing keys default to set()
adjacency = defaultdict(set)
adjacency["A"].add("B")
adjacency["A"].add("C")

# ── Counter — count hashable objects ──────────────────────────────
c = Counter("mississippi")
# Counter({'s':4,'i':4,'p':2,'m':1})
c.most_common(2)      # [('s',4), ('i',4)]
c.total()             # 11  (Python 3.10+)

# Counter arithmetic
c1 = Counter(a=3, b=1)
c2 = Counter(a=1, b=2)
c1 + c2   # Counter({'a':4, 'b':3})
c1 - c2   # Counter({'a':2})   — negative counts removed
c1 & c2   # Counter({'a':1, 'b':1}) — min of each
c1 | c2   # Counter({'a':3, 'b':2}) — max of each

# ── deque — O(1) append/pop from both ends ────────────────────────
dq = deque([1, 2, 3], maxlen=5)   # optional max length
dq.append(4)        # right: [1,2,3,4]
dq.appendleft(0)    # left:  [0,1,2,3,4]
dq.pop()            # 4  — O(1)
dq.popleft()        # 0  — O(1) ← this is why deque beats list for queues
dq.rotate(1)        # rotate right: [4,1,2,3] (negative = rotate left)

# BFS queue
from collections import deque
queue = deque([start_node])
while queue:
    node = queue.popleft()
    for neighbour in graph[node]:
        queue.append(neighbour)

# ── namedtuple — tuple with named fields ──────────────────────────
Point = namedtuple("Point", ["x", "y"])
p = Point(3, 4)
p.x, p.y        # 3, 4  — named access
p[0], p[1]      # 3, 4  — still indexable
x, y = p        # unpackable
p._replace(x=10)  # new tuple with x=10
p._asdict()      # OrderedDict

# ── OrderedDict — extra ordering operations ────────────────────────
od = OrderedDict()
od["first"] = 1
od["second"] = 2
od.move_to_end("first")          # move to end
od.move_to_end("second", last=False)  # move to front

# ── ChainMap — combine multiple dicts (first found wins) ──────────
defaults  = {"color": "red", "size": "M"}
overrides = {"color": "blue"}
merged = ChainMap(overrides, defaults)
merged["color"]   # "blue"  — found in overrides first
merged["size"]    # "M"     — falls through to defaults
```

### ⚡ Recall
- `defaultdict(list/int/set)` = no more `setdefault` boilerplate
- `Counter` = dict subclass, supports `most_common()`, arithmetic
- `deque` = O(1) from both ends — use for **BFS queues** and **sliding windows**
- `namedtuple` = readable tuple with named fields, memory-efficient
- `deque(maxlen=N)` = auto-discards oldest items — useful for rolling windows

### 🎯 Interview Q&A

> **Q: Why use `deque` instead of a list for a queue?**  
> **A:** `list.pop(0)` is O(n) because it shifts all elements left. `deque.popleft()` is O(1) because deque is implemented as a **doubly-linked list of fixed-size blocks** — removal from either end doesn't require shifting. For queue operations (FIFO — append right, remove left), `deque` is the correct data structure. `list` is only efficient as a stack (LIFO — append and pop from the right end only).

> **Q: What is `Counter` and how is it different from a regular dict?**  
> **A:** `Counter` is a `dict` subclass optimised for counting. Differences: (1) missing keys return **0** instead of raising `KeyError`; (2) supports `most_common(n)` for top-N elements; (3) supports **arithmetic** — you can add, subtract, intersect, and union counters; (4) can be initialised from an iterable directly (`Counter("hello")` counts characters). Use it whenever you need to count occurrences — it eliminates the `freq[key] = freq.get(key, 0) + 1` boilerplate.

---

## 24. itertools & functools

### Concept
`itertools` provides **lazy, memory-efficient iterators** for common iteration patterns. `functools` provides **higher-order function utilities** like caching, partial application, and reduction.

### Code
```python
import itertools as it
import functools as ft

# ── itertools — combinatorics ─────────────────────────────────────
list(it.permutations("ABC", 2))    # all ordered pairs: AB,AC,BA,BC,CA,CB
list(it.combinations("ABC", 2))    # unordered pairs: AB,AC,BC
list(it.combinations_with_replacement("ABC",2))  # AA,AB,AC,BB,BC,CC
list(it.product("AB", repeat=2))   # cartesian: AA,AB,BA,BB

# ── itertools — iteration ─────────────────────────────────────────
list(it.chain([1,2],[3,4],[5]))      # [1,2,3,4,5]
list(it.chain.from_iterable([[1,2],[3,4]]))  # same
list(it.islice(range(100), 5, 15, 2))  # [5,7,9,11,13]
list(it.zip_longest([1,2,3],[4,5], fillvalue=0))  # [(1,4),(2,5),(3,0)]

list(it.repeat(42, 3))             # [42, 42, 42]
list(it.cycle("AB"))               # A,B,A,B,... (infinite!)
list(it.islice(it.cycle("AB"),5))  # ['A','B','A','B','A']

# ── itertools — filtering & grouping ─────────────────────────────
data = [1,-2,3,-4,5]
list(it.takewhile(lambda x: x > 0, data))  # [1]   — stop at first False
list(it.dropwhile(lambda x: x > 0, data))  # [-2,3,-4,5] — skip until False
list(it.compress("ABCDEF",[1,0,1,0,1,0]))  # ['A','C','E']
list(it.filterfalse(lambda x: x%2, range(10))) # evens [0,2,4,6,8]

# groupby — group consecutive equal keys (sort first!)
data = sorted([("a",1),("b",2),("a",3)], key=lambda x: x[0])
for key, group in it.groupby(data, key=lambda x: x[0]):
    print(key, list(group))

# accumulate
list(it.accumulate([1,2,3,4,5]))           # [1,3,6,10,15] — running sum
list(it.accumulate([1,2,3,4,5], max))      # [1,2,3,4,5]   — running max
list(it.accumulate([1,2,3,4,5], lambda a,x: a*x))  # factorial-style

# ── functools.partial — partial application ───────────────────────
from functools import partial

def power(base, exponent):
    return base ** exponent

square = partial(power, exponent=2)
cube   = partial(power, exponent=3)
square(5)   # 25
cube(3)     # 27

# Practical: pre-fill url or config
import urllib.request
get_json = partial(urllib.request.urlopen, timeout=5)

# ── functools.reduce ──────────────────────────────────────────────
from functools import reduce
product = reduce(lambda a,b: a*b, [1,2,3,4,5])  # 120
maximum = reduce(lambda a,b: a if a>b else b, [3,1,4,1,5])  # 5

# ── functools.lru_cache / cache ───────────────────────────────────
from functools import lru_cache, cache

@lru_cache(maxsize=128)
def fib(n):
    if n < 2: return n
    return fib(n-1) + fib(n-2)

@cache   # Python 3.9+ unlimited cache
def expensive(n):
    return n ** 2

# ── functools.wraps ───────────────────────────────────────────────
from functools import wraps

def decorator(func):
    @wraps(func)    # copies __name__, __doc__, etc.
    def wrapper(*args, **kwargs):
        return func(*args, **kwargs)
    return wrapper

# ── functools.total_ordering ──────────────────────────────────────
from functools import total_ordering

@total_ordering
class Student:
    def __init__(self, name, gpa):
        self.name = name
        self.gpa  = gpa

    def __eq__(self, other):
        return self.gpa == other.gpa

    def __lt__(self, other):
        return self.gpa < other.gpa
    # total_ordering automatically generates __le__, __gt__, __ge__
```

### ⚡ Recall
- `itertools` iterators are **lazy** — wrap in `list()` to see results
- `chain.from_iterable` = flatten one level of nesting
- `groupby` requires data **sorted** by the group key first
- `partial(func, arg)` = freeze some arguments, create specialised function
- `total_ordering` = define only `__eq__` + one comparison → gets all 6

### 🎯 Interview Q&A

> **Q: What is `functools.partial` and when is it useful?**  
> **A:** `partial(func, *args, **kwargs)` creates a new function with some arguments **pre-filled**. It's partial application — a form of function specialisation. Use cases: (1) creating specialised versions of general functions (`square = partial(pow, exp=2)`); (2) adapting function signatures for callbacks/interfaces that expect fewer arguments; (3) pre-filling configuration arguments. It's cleaner and more descriptive than writing a one-line wrapper lambda.

---

## 25. Type Hints & Annotations

### Concept
**Type hints** (PEP 484, Python 3.5+) annotate variables, parameters, and return values with expected types. They are **not enforced at runtime** but enable static analysis (mypy), better IDE support, and self-documenting code.

### Code
```python
# ── Basic annotations ─────────────────────────────────────────────
def greet(name: str, times: int = 1) -> str:
    return (name + " ") * times

# Variable annotations
x: int = 42
names: list[str] = ["Alice", "Bob"]   # Python 3.9+

# ── typing module ─────────────────────────────────────────────────
from typing import (
    Optional, Union, List, Dict, Tuple, Set,
    Callable, Iterator, Generator,
    TypeVar, Generic, Any, Final, ClassVar
)

# Optional — either the type or None
def find_user(id: int) -> Optional[str]:   # str | None
    return "Alice" if id == 1 else None

# Union — one of several types
def process(val: Union[int, str]) -> str:  # int | str  (Python 3.10+)
    return str(val)

# Python 3.10+ shorthand for Union
def process(val: int | str) -> str:
    return str(val)

# Collections
def mean(values: list[float]) -> float:
    return sum(values) / len(values)

def lookup(d: dict[str, int], key: str) -> Optional[int]:
    return d.get(key)

# Callable
def apply(func: Callable[[int], int], value: int) -> int:
    return func(value)

# TypeVar — generic types
T = TypeVar("T")

def first(lst: list[T]) -> T:
    return lst[0]

# ── Generics ──────────────────────────────────────────────────────
from typing import Generic

class Stack(Generic[T]):
    def __init__(self) -> None:
        self._items: list[T] = []

    def push(self, item: T) -> None:
        self._items.append(item)

    def pop(self) -> T:
        return self._items.pop()

int_stack: Stack[int] = Stack()
int_stack.push(42)

# ── Final and ClassVar ────────────────────────────────────────────
class Config:
    MAX_SIZE: Final[int] = 100       # cannot be reassigned
    instance_count: ClassVar[int] = 0  # class variable, not instance

# ── Protocol — structural subtyping (duck typing with types) ─────
from typing import Protocol

class Drawable(Protocol):
    def draw(self) -> None: ...

class Circle:    # doesn't inherit Drawable
    def draw(self) -> None:
        print("Drawing circle")

def render(obj: Drawable) -> None:  # Circle works — it has draw()
    obj.draw()

# ── TYPE_CHECKING guard ───────────────────────────────────────────
from __future__ import annotations   # postponed evaluation (PEP 563)
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from mymodule import HeavyClass   # only imported for type checkers
```

### ⚡ Recall
- Type hints are **not enforced** at runtime — they're hints for tools
- `Optional[X]` = `X | None` (Python 3.10+: use `X | None` directly)
- `Union[X, Y]` = `X | Y` (Python 3.10+)
- Use `list[str]`, `dict[str, int]` directly in Python 3.9+ (no `List`/`Dict` needed)
- `Protocol` = duck typing with types (structural subtyping)
- Use `from __future__ import annotations` for forward references

### 🎯 Interview Q&A

> **Q: Are type hints enforced at runtime in Python?**  
> **A:** No. Type hints are **purely informational** — Python ignores them at runtime. Writing `def f(x: int)` and calling `f("hello")` works without error. Type hints are consumed by static analysis tools like **mypy**, **pyright**, and IDE type checkers to catch type errors before runtime. They also serve as documentation and enable better autocomplete. To enforce types at runtime, you'd need a library like `pydantic` or manual `isinstance` checks.

> **Q: What is the difference between `Optional[X]` and `Union[X, None]`?**  
> **A:** They are exactly equivalent — `Optional[X]` is just shorthand for `Union[X, None]`. In Python 3.10+, you can write `X | None` directly. `Optional` doesn't mean "this argument can be omitted" (that's a default value) — it means the value can be either `X` or `None`. A common mistake is omitting `Optional` on parameters that have `None` as a default — the correct annotation for `def f(x: str = None)` is `def f(x: Optional[str] = None)`.

---

## 26. Dataclasses

### Concept
**Dataclasses** (Python 3.7+, `@dataclass`) auto-generate `__init__`, `__repr__`, `__eq__`, and optionally `__hash__`, `__lt__` etc. from field definitions. They replace much of the boilerplate in plain classes when the primary purpose is storing data.

### Code
```python
from dataclasses import dataclass, field, fields, asdict, astuple

# ── Basic dataclass ───────────────────────────────────────────────
@dataclass
class Point:
    x: float
    y: float

p = Point(1.0, 2.0)
print(p)         # Point(x=1.0, y=2.0)  — auto __repr__
p == Point(1,2)  # True — auto __eq__

# ── With defaults ─────────────────────────────────────────────────
@dataclass
class Employee:
    name:       str
    department: str
    salary:     float = 50_000.0
    tags:       list[str] = field(default_factory=list)  # ✅ mutable default

e = Employee("Alice", "Eng")
e.tags.append("python")

# ── frozen — immutable dataclass (hashable) ───────────────────────
@dataclass(frozen=True)
class FrozenPoint:
    x: float
    y: float
# FrozenPoint(1,2).x = 10  # ← raises FrozenInstanceError

p = FrozenPoint(3.0, 4.0)
{p, FrozenPoint(3,4)}   # hashable — usable in sets/dicts

# ── order — auto-generates comparison methods ──────────────────────
@dataclass(order=True)
class Card:
    rank: int
    suit: str

cards = [Card(3,"♠"), Card(1,"♥"), Card(3,"♣")]
sorted(cards)   # sorts by rank first, then suit (field order)

# ── __post_init__ — custom init logic ────────────────────────────
@dataclass
class Circle:
    radius: float

    def __post_init__(self):
        if self.radius < 0:
            raise ValueError(f"Radius cannot be negative: {self.radius}")
        self.area = 3.14159 * self.radius ** 2  # computed field

# ── field() options ───────────────────────────────────────────────
from dataclasses import field

@dataclass
class Config:
    name:    str
    values:  list = field(default_factory=list)  # mutable default
    _hash:   str  = field(init=False, repr=False)  # excluded from init/repr

    def __post_init__(self):
        self._hash = hash(self.name)

# ── Utility functions ─────────────────────────────────────────────
@dataclass
class Person:
    name: str
    age: int

p = Person("Alice", 30)
asdict(p)     # {"name": "Alice", "age": 30}
astuple(p)    # ("Alice", 30)
fields(p)     # tuple of Field objects with metadata
```

### ⚡ Recall
- `@dataclass` = auto-generates `__init__`, `__repr__`, `__eq__`
- `field(default_factory=list)` for mutable defaults (never `field(default=[])`)
- `frozen=True` = immutable + hashable
- `order=True` = auto-generates `<`, `<=`, `>`, `>=`
- `__post_init__` = custom logic after auto-generated `__init__` runs
- `asdict()` / `astuple()` = convert to dict/tuple

### 🎯 Interview Q&A

> **Q: What is a dataclass and when would you use it over a regular class?**  
> **A:** A `@dataclass` auto-generates `__init__`, `__repr__`, and `__eq__` from annotated fields — eliminating boilerplate for data-holding classes. Use dataclasses for classes whose primary purpose is **storing data** (DTOs, configuration objects, value objects). Use regular classes when you need complex initialisation logic, no field-based equality, or extensive behaviour beyond data storage. Compared to `namedtuple`, dataclasses are mutable by default, support inheritance naturally, and allow default values with `field()`.

> **Q: Why use `field(default_factory=list)` instead of `default=[]`?**  
> **A:** The same mutable default argument trap that applies to functions applies to dataclasses. If you write `values: list = []`, all instances share the same list object — modifying one instance's list modifies all. `field(default_factory=list)` calls `list()` to create a **new empty list** for each instance. Always use `default_factory` for mutable defaults (lists, dicts, sets).

---

## 27. Regular Expressions

### Concept
**Regular expressions** (regex) are patterns for matching, searching, and manipulating strings. Python's `re` module provides full regex support. Always use **raw strings** (`r"..."`) for patterns to avoid double-escaping backslashes.

### Code
```python
import re

# ── Core functions ────────────────────────────────────────────────
text = "The price is $42.50 and $10.00"

re.match(r"\d+", "123abc")    # match at START of string → Match object
re.search(r"\d+", text)       # first match ANYWHERE → Match object
re.findall(r"\$[\d.]+", text) # all matches → ['$42.50', '$10.00']
re.finditer(r"\$[\d.]+", text) # iterator of Match objects
re.sub(r"\$[\d.]+", "PRICE", text)  # substitute matches
re.split(r"[,\s]+", "a, b,c  d")    # split on pattern → ['a','b','c','d']

# ── Match object methods ──────────────────────────────────────────
m = re.search(r"(\d+)\.(\d+)", "Price: 42.50")
m.group()    # "42.50"  — whole match
m.group(1)   # "42"     — first capture group
m.group(2)   # "50"     — second capture group
m.start()    # 7        — start index
m.end()      # 12       — end index
m.span()     # (7, 12)

# ── Common patterns ───────────────────────────────────────────────
# . = any char (except \n)  \d = digit  \w = word char  \s = whitespace
# + = 1+  * = 0+  ? = 0 or 1  {n} = exactly n  {n,m} = n to m
# ^ = start  $ = end  [] = char class  [^] = negated  () = group
# | = or  \b = word boundary  (?:) = non-capturing group

email_pattern  = r"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"
phone_pattern  = r"\b\d{3}[-.]?\d{3}[-.]?\d{4}\b"
url_pattern    = r"https?://[^\s]+"
ipv4_pattern   = r"\b(?:\d{1,3}\.){3}\d{1,3}\b"
date_pattern   = r"\b(\d{4})-(\d{2})-(\d{2})\b"

# Validate email
def is_valid_email(email: str) -> bool:
    return bool(re.fullmatch(r"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}", email))

# ── Flags ─────────────────────────────────────────────────────────
re.search(r"python", "I love Python", re.IGNORECASE)
re.search(r"^start", text, re.MULTILINE)  # ^ matches each line start
re.DOTALL     # . matches \n too
re.VERBOSE    # allow whitespace and comments in pattern

pattern = re.compile(r"""
    (\d{4})   # year
    -
    (\d{2})   # month
    -
    (\d{2})   # day
""", re.VERBOSE)

# ── compile — reuse patterns ──────────────────────────────────────
compiled = re.compile(r"\d+")
compiled.findall("abc 123 def 456")   # ['123', '456']

# ── Named groups ─────────────────────────────────────────────────
m = re.search(r"(?P<year>\d{4})-(?P<month>\d{2})-(?P<day>\d{2})", "2024-05-15")
m.group("year")    # "2024"
m.group("month")   # "05"
m.groupdict()      # {'year':'2024','month':'05','day':'15'}

# ── Lookahead and lookbehind ──────────────────────────────────────
re.findall(r"\d+(?= dollars)", "100 dollars and 50 euros")  # ['100']
re.findall(r"(?<=\$)\d+", "Cost: $42")   # ['42']
```

### ⚡ Recall
- **Always use raw strings** `r"..."` for regex patterns
- `re.match` = start only | `re.search` = anywhere | `re.fullmatch` = entire string
- `re.findall` = all matches as list | `re.finditer` = lazy iterator
- Compile patterns you reuse frequently with `re.compile()`
- `(?:...)` = non-capturing group | `(?P<name>...)` = named group
- `re.IGNORECASE`, `re.MULTILINE`, `re.DOTALL`, `re.VERBOSE` — useful flags

### 🎯 Interview Q&A

> **Q: What is the difference between `re.match`, `re.search`, and `re.fullmatch`?**  
> **A:** `re.match(pattern, s)` only matches at the **beginning** of the string — if the pattern matches at position 0, success; otherwise `None`. `re.search(pattern, s)` scans the **entire string** for a match anywhere — returns the first one found. `re.fullmatch(pattern, s)` requires the **entire string** to match the pattern. Common mistake: using `re.match` and expecting it to search the whole string — add `$` to the pattern or use `re.fullmatch` for whole-string validation.

---

## 28. Concurrency — Threading, Multiprocessing, AsyncIO

### Concept
Python has three concurrency models for different use cases:
- **Threading** — multiple threads in one process, share memory, limited by GIL for CPU work
- **Multiprocessing** — multiple processes with separate memory, true parallelism for CPU work
- **AsyncIO** — single-threaded cooperative concurrency, excellent for I/O-bound work

**The GIL (Global Interpreter Lock)** — CPython's mutex that prevents multiple threads from executing Python bytecode simultaneously. Threads are limited for CPU-bound tasks but fine for I/O-bound (GIL is released during I/O).

### Code
```python
# ── Threading — good for I/O-bound tasks ──────────────────────────
import threading
import time

def download(url, results, idx):
    time.sleep(1)   # simulate network I/O
    results[idx] = f"Content of {url}"

results = [None] * 3
threads = [
    threading.Thread(target=download, args=(f"url{i}", results, i))
    for i in range(3)
]
for t in threads: t.start()
for t in threads: t.join()   # wait for all to finish
print(results)   # all 3 done in ~1s (not 3s)

# Thread synchronisation
lock = threading.Lock()
counter = 0

def increment():
    global counter
    with lock:          # acquire/release lock automatically
        counter += 1    # critical section

# ── ThreadPoolExecutor — high-level threading ──────────────────────
from concurrent.futures import ThreadPoolExecutor, as_completed

def fetch(url):
    time.sleep(0.5)
    return f"data from {url}"

urls = ["url1", "url2", "url3", "url4"]

with ThreadPoolExecutor(max_workers=4) as executor:
    futures = [executor.submit(fetch, url) for url in urls]
    for future in as_completed(futures):
        print(future.result())

# map() version
with ThreadPoolExecutor(max_workers=4) as executor:
    results = list(executor.map(fetch, urls))

# ── Multiprocessing — good for CPU-bound tasks ─────────────────────
from multiprocessing import Pool, Process
import os

def cpu_intensive(n):
    return sum(i*i for i in range(n))

# Pool.map — parallel map
with Pool(processes=4) as pool:
    results = pool.map(cpu_intensive, [10**6, 10**6, 10**6, 10**6])

# ProcessPoolExecutor — high-level interface
from concurrent.futures import ProcessPoolExecutor

with ProcessPoolExecutor(max_workers=4) as executor:
    results = list(executor.map(cpu_intensive, [10**6]*4))

# ── AsyncIO — good for I/O-bound with many connections ────────────
import asyncio

async def fetch_async(url: str) -> str:
    await asyncio.sleep(1)   # non-blocking I/O
    return f"data from {url}"

async def main():
    urls = ["url1", "url2", "url3"]
    # Run all coroutines concurrently
    results = await asyncio.gather(*[fetch_async(u) for u in urls])
    return results

asyncio.run(main())   # all 3 finish in ~1s total

# async with — async context manager
async def download():
    async with aiohttp.ClientSession() as session:
        async with session.get("https://example.com") as resp:
            return await resp.text()

# async for — async iterator
async def process_stream():
    async for item in async_generator():
        process(item)
```

### ⚡ Recall
- **GIL** = only one thread executes Python at a time in CPython
- **Threading** = I/O-bound (GIL released during I/O) | **Multiprocessing** = CPU-bound (bypasses GIL with separate processes)
- **AsyncIO** = single-thread, cooperative, best for many concurrent I/O operations
- `ThreadPoolExecutor` / `ProcessPoolExecutor` = high-level, preferred over raw threads/processes
- `asyncio.gather()` = run multiple coroutines concurrently
- `await` pauses coroutine until result ready | `async def` defines coroutine

### 🎯 Interview Q&A

> **Q: What is the GIL and how does it affect Python concurrency?**  
> **A:** The **Global Interpreter Lock** is a mutex in CPython that ensures only one thread executes Python bytecode at a time. It prevents data corruption in CPython's memory management (reference counting). For **I/O-bound tasks**, threading still works because the GIL is released when waiting for I/O (network, disk, sleep) — threads can run during each other's I/O waits. For **CPU-bound tasks** (heavy computation), threading provides no speedup because threads can't run in true parallel. The solution is `multiprocessing` — separate processes have separate GILs.

> **Q: When would you use threading vs multiprocessing vs asyncio?**  
> **A:** **Threading**: I/O-bound tasks where you need shared memory — moderate number of concurrent operations, simple existing code. **Multiprocessing**: CPU-bound tasks that need true parallelism — bypasses the GIL with separate processes, but has overhead for inter-process communication. **AsyncIO**: I/O-bound tasks with a large number of concurrent operations (thousands of connections) — very efficient because it's single-threaded cooperative scheduling with minimal overhead per "task." Rule of thumb: I/O + many connections → asyncio; I/O + simple → threading; CPU → multiprocessing.

---

## 29. Memory Management & Garbage Collection

### Concept
CPython manages memory through **reference counting** (primary) and a **cyclic garbage collector** (for reference cycles). Understanding this is crucial for writing memory-efficient code and avoiding leaks.

### Code
```python
import sys
import gc

# ── Reference counting ────────────────────────────────────────────
x = [1, 2, 3]
print(sys.getrefcount(x))   # ≥ 2 (x + temporary argument ref)

y = x          # ref count 3
del y          # ref count 2
# When ref count hits 0, object is immediately deallocated

# ── id() and object lifecycle ─────────────────────────────────────
a = "hello"
b = a
print(id(a) == id(b))   # True — same object
del a
# b still holds the reference; object not deallocated

# ── Circular references — need GC ────────────────────────────────
class Node:
    def __init__(self):
        self.next = None

a = Node()
b = Node()
a.next = b
b.next = a   # cycle! ref counts never reach 0

del a, b     # Python's cyclic GC eventually cleans this up

# Force GC collection
gc.collect()           # returns number of unreachable objects found
gc.get_count()         # (gen0, gen1, gen2) collection counts
gc.get_threshold()     # (700, 10, 10) — collection thresholds

# ── Memory-efficient patterns ────────────────────────────────────
# 1. Use generators instead of lists for large sequences
total = sum(x**2 for x in range(10**7))   # O(1) memory vs O(n)

# 2. Use __slots__ to reduce instance memory
class Normal:
    def __init__(self, x, y):
        self.x, self.y = x, y

class Slotted:
    __slots__ = ["x", "y"]   # no __dict__ created
    def __init__(self, x, y):
        self.x, self.y = x, y

print(sys.getsizeof(Normal(1,2)))    # ~48 bytes (varies)
print(sys.getsizeof(Slotted(1,2)))  # smaller, no __dict__

# 3. del to release references
large_data = list(range(10**6))
process(large_data)
del large_data   # allows GC to reclaim before next allocation

# 4. weakref — reference that doesn't prevent GC
import weakref

class Cache:
    def __init__(self):
        self._cache = {}

    def store(self, key, obj):
        self._cache[key] = weakref.ref(obj)   # won't prevent GC

    def get(self, key):
        ref = self._cache.get(key)
        return ref() if ref else None   # ref() returns obj or None if GC'd
```

### ⚡ Recall
- CPython uses **reference counting** — object freed when count hits 0
- **Cyclic GC** handles circular references (generational: gen0, gen1, gen2)
- `sys.getrefcount(x)` = current reference count (always ≥ 1)
- `__slots__` = removes `__dict__`, reduces per-instance memory significantly
- `weakref.ref(obj)` = reference that doesn't increment refcount
- `del x` removes the variable binding (decrements refcount), may not free memory immediately

### 🎯 Interview Q&A

> **Q: How does Python's garbage collection work?**  
> **A:** CPython uses two mechanisms. **Reference counting** is primary — every object tracks how many references point to it; when it hits 0, the object is immediately deallocated. This handles most cases instantly. The problem is **circular references** — two objects referencing each other both have refcount > 0 even when unreachable. CPython's **cyclic garbage collector** (generational, with 3 generations) periodically scans for isolated reference cycles and breaks them. You can trigger it with `gc.collect()`, but it runs automatically based on allocation thresholds.

> **Q: What are `__slots__` and when would you use them?**  
> **A:** By default, every Python instance stores its attributes in a `__dict__` (a dictionary), which has significant memory overhead. `__slots__ = ['x', 'y']` tells Python to allocate a fixed, compact structure instead — no `__dict__` is created. Benefits: 30-50% less memory per instance, slightly faster attribute access. Drawbacks: can't add arbitrary attributes at runtime, slightly complicates inheritance. Use `__slots__` for classes where you create millions of instances with known fixed attributes — data classes in numerical computation, graph nodes, event objects.

---

## 30. Testing — unittest & pytest

### Concept
Testing verifies code correctness. **unittest** is the built-in framework (xUnit style). **pytest** is the most popular third-party framework — simpler syntax, powerful fixtures, better output.

### Code
```python
# ── unittest ──────────────────────────────────────────────────────
import unittest

def add(a, b): return a + b
def divide(a, b):
    if b == 0: raise ZeroDivisionError("Cannot divide by zero")
    return a / b

class TestMathFunctions(unittest.TestCase):
    # setUp runs BEFORE each test method
    def setUp(self):
        self.sample_list = [1, 2, 3, 4, 5]

    # tearDown runs AFTER each test method
    def tearDown(self):
        pass

    def test_add_positive(self):
        self.assertEqual(add(2, 3), 5)

    def test_add_negative(self):
        self.assertEqual(add(-1, -1), -2)

    def test_divide_normal(self):
        self.assertAlmostEqual(divide(10, 3), 3.333, places=3)

    def test_divide_by_zero(self):
        with self.assertRaises(ZeroDivisionError):
            divide(10, 0)

    def test_assertions(self):
        self.assertTrue(5 > 3)
        self.assertFalse(2 > 5)
        self.assertIsNone(None)
        self.assertIsNotNone(42)
        self.assertIn(3, [1, 2, 3])
        self.assertNotIn(99, [1, 2, 3])
        self.assertIsInstance("hello", str)

if __name__ == "__main__":
    unittest.main()

# Run: python -m unittest test_module.py
# Run: python -m unittest discover  (find all test_*.py files)

# ── pytest (recommended) ──────────────────────────────────────────
# pip install pytest

def test_add():         # function just needs to start with test_
    assert add(2, 3) == 5

def test_divide_by_zero():
    import pytest
    with pytest.raises(ZeroDivisionError, match="Cannot divide"):
        divide(10, 0)

def test_close_enough():
    import pytest
    assert divide(10, 3) == pytest.approx(3.333, rel=1e-3)

# ── pytest fixtures ───────────────────────────────────────────────
import pytest

@pytest.fixture
def sample_data():
    """Reusable test data."""
    return {"name": "Alice", "age": 30, "scores": [90, 85, 92]}

@pytest.fixture
def db_connection():
    """Setup and teardown with yield."""
    conn = create_test_db()
    yield conn       # test runs here
    conn.close()     # teardown runs after test

def test_with_fixture(sample_data):   # fixture injected by name
    assert sample_data["name"] == "Alice"
    assert sum(sample_data["scores"]) / len(sample_data["scores"]) > 88

# ── parametrize — run same test with multiple inputs ──────────────
@pytest.mark.parametrize("a, b, expected", [
    (2, 3, 5),
    (-1, -1, -2),
    (0, 0, 0),
    (100, -50, 50),
])
def test_add_parametrized(a, b, expected):
    assert add(a, b) == expected

# ── Mocking ───────────────────────────────────────────────────────
from unittest.mock import Mock, MagicMock, patch

# Mock an object
mock_service = Mock()
mock_service.get_user.return_value = {"id": 1, "name": "Alice"}
result = mock_service.get_user(1)
assert result["name"] == "Alice"
mock_service.get_user.assert_called_once_with(1)

# patch — replace real object with mock in context
with patch("requests.get") as mock_get:
    mock_get.return_value.status_code = 200
    mock_get.return_value.json.return_value = {"data": "ok"}
    response = requests.get("https://api.example.com")
    assert response.json()["data"] == "ok"

# patch as decorator
@patch("mymodule.requests.get")
def test_api_call(mock_get):
    mock_get.return_value.json.return_value = {"status": "ok"}
    result = my_function_that_calls_api()
    assert result == "ok"
```

### ⚡ Recall
- `unittest`: `setUp`/`tearDown`, `assertX` methods, `class TestX(unittest.TestCase)`
- `pytest`: simpler — plain `assert`, `def test_x()`, auto-discovery
- `@pytest.fixture` = reusable setup/teardown with `yield`
- `@pytest.mark.parametrize` = run one test with many inputs
- `Mock` = fake object | `patch` = replace real thing with mock
- Run pytest: `pytest` (auto-discovers `test_*.py` or `*_test.py`)

### 🎯 Interview Q&A

> **Q: What is the difference between unittest and pytest?**  
> **A:** **unittest** (stdlib) is an xUnit-style framework requiring test methods in `TestCase` subclasses, `self.assertX()` methods for assertions, and explicit setup/teardown with `setUp`/`tearDown`. **pytest** is simpler — plain `assert` statements, no class required, automatic test discovery, better failure output showing actual vs expected values, and powerful fixtures. pytest can also run unittest tests. In practice, pytest is the industry standard for new projects; unittest is encountered in legacy codebases or when you can't add dependencies.

> **Q: What is mocking and why is it important in testing?**  
> **A:** **Mocking** replaces real dependencies (databases, network calls, file systems) with controlled fake objects during tests. Why: (1) **speed** — avoid slow real I/O; (2) **isolation** — test one unit without depending on external systems; (3) **control** — simulate specific responses (errors, edge cases) that are hard to trigger in reality; (4) **determinism** — tests don't break due to external service downtime. `unittest.mock.patch` temporarily replaces an object with a Mock for the duration of the test, then restores the original.
---

## 31. Big O Notation & Complexity

### Concept
**Big O notation** describes how an algorithm's time or space requirements scale with input size `n`. It describes the **worst-case upper bound** — ignoring constants and lower-order terms.

**Why it matters:** choosing the wrong algorithm on large data (millions of records) can mean the difference between milliseconds and hours.

### Common Complexities (fastest → slowest)
| Notation | Name | Example |
|----------|------|---------|
| O(1) | Constant | dict lookup, list append |
| O(log n) | Logarithmic | binary search, balanced BST |
| O(n) | Linear | linear search, single loop |
| O(n log n) | Linearithmic | merge sort, heapsort |
| O(n²) | Quadratic | bubble sort, nested loops |
| O(n³) | Cubic | matrix multiplication (naïve) |
| O(2ⁿ) | Exponential | all subsets, brute-force recursion |
| O(n!) | Factorial | all permutations |

### Code
```python
# O(1) — constant time, regardless of input size
def get_first(lst):
    return lst[0]

# O(log n) — input halved each step
def binary_search(arr, target):
    lo, hi = 0, len(arr) - 1
    while lo <= hi:
        mid = (lo + hi) // 2
        if arr[mid] == target: return mid
        elif arr[mid] < target: lo = mid + 1
        else: hi = mid - 1
    return -1

# O(n) — one pass through input
def linear_search(lst, target):
    for i, val in enumerate(lst):
        if val == target: return i
    return -1

# O(n log n) — sort then single pass
def has_duplicate_sorted(lst):
    sorted_lst = sorted(lst)        # O(n log n)
    for i in range(len(sorted_lst) - 1):  # O(n)
        if sorted_lst[i] == sorted_lst[i+1]:
            return True
    return False

# O(n²) — nested loops
def bubble_sort(arr):
    n = len(arr)
    for i in range(n):           # O(n)
        for j in range(n-i-1):  # O(n)
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]

# ── Space complexity examples ────────────────────────────────────
def sum_list(lst):              # O(1) space — no extra data
    return sum(lst)

def duplicate_list(lst):        # O(n) space — new list same size
    return lst[:]

def all_pairs(lst):             # O(n²) space — n² pairs
    return [(a, b) for a in lst for b in lst]

# ── Amortised analysis — list.append ────────────────────────────
# Most appends: O(1) — just store in pre-allocated slot
# Occasional:   O(n) — resize array (copy all elements)
# Amortised:    O(1) — resizing is rare, cost spread over all appends

# ── Simplification rules ─────────────────────────────────────────
# Drop constants:       O(2n) → O(n)
# Drop lower terms:     O(n² + n) → O(n²)
# Different variables:  two separate inputs → O(a + b) NOT O(n)
# Nested loops (same): O(n) * O(n) = O(n²)
```

### ⚡ Recall
```
O(1)      → dict/set lookup, index access
O(log n)  → binary search, balanced tree ops
O(n)      → single loop, linear scan
O(n log n)→ efficient sorting (merge, heap, timsort)
O(n²)     → nested loops over same input
O(2ⁿ)    → subsets, Fibonacci (naïve recursion)
```

### 🎯 Interview Q&A

> **Q: What is the difference between time complexity and space complexity?**  
> **A:** **Time complexity** measures how the number of operations grows with input size. **Space complexity** measures how memory usage grows. Both use Big O notation. An algorithm can trade one for the other — memoisation uses O(n) extra space to reduce time from O(2ⁿ) to O(n). The best solution minimises both, but usually time is prioritised unless memory is constrained.

> **Q: What is amortised complexity?**  
> **A:** Amortised complexity averages the cost over a sequence of operations — a single operation may be expensive, but rarely enough that the average is cheap. Python list's `append()` is O(1) **amortised** — normally it's O(1) (write to pre-allocated slot), but occasionally O(n) (copy all elements to a 2× larger array). Since doublings are exponentially rare, the average cost per append is O(1). This is different from average-case complexity, which considers input distributions.

> **Q: What is the time complexity of common Python operations?**  
> **A:** List: `append` O(1)amort, `pop()` O(1), `pop(0)` O(n), `in` O(n), `sort` O(n log n), `index access` O(1). Dict/Set: `get`/`set`/`in` O(1) average. Deque: `append`/`appendleft`/`pop`/`popleft` all O(1). String `+` in loop: O(n²) — use `join`. Sorting is always O(n log n) for CPython's Timsort.

---

## 32. Arrays & Dynamic Arrays

### Concept
A **static array** stores elements in contiguous memory with fixed size — O(1) index access, O(n) search. A **dynamic array** (Python `list`) resizes automatically — amortised O(1) append. In Python, `array.array` provides typed, compact arrays; `numpy.ndarray` for numerical computing.

### Code
```python
# Python list AS dynamic array
arr = []
for i in range(10):
    arr.append(i)      # amortised O(1)

arr[3]       # O(1) — direct index access
arr[3] = 99  # O(1) — direct write
len(arr)     # O(1) — stored separately

# typed array — more memory efficient than list
import array
arr = array.array('i', [1, 2, 3, 4, 5])   # 'i' = signed int
arr.append(6)
arr[2]    # 3

# ── Two-pointer technique on array ─────────────────────────────────
def two_sum_sorted(arr, target):
    """Find pair summing to target in sorted array. O(n) time, O(1) space."""
    left, right = 0, len(arr) - 1
    while left < right:
        total = arr[left] + arr[right]
        if total == target:
            return (left, right)
        elif total < target:
            left += 1
        else:
            right -= 1
    return None

# ── Prefix sums — precompute running totals ────────────────────────
def build_prefix(arr):
    prefix = [0] * (len(arr) + 1)
    for i, val in enumerate(arr):
        prefix[i+1] = prefix[i] + val
    return prefix

def range_sum(prefix, l, r):
    """O(1) range sum query after O(n) preprocessing."""
    return prefix[r+1] - prefix[l]

arr = [3, 1, 4, 1, 5, 9]
prefix = build_prefix(arr)
print(range_sum(prefix, 1, 4))   # sum of [1,4,1,5] = 11

# ── Kadane's Algorithm — maximum subarray sum ─────────────────────
def max_subarray(arr):
    """O(n) time, O(1) space."""
    max_sum = current_sum = arr[0]
    for val in arr[1:]:
        current_sum = max(val, current_sum + val)
        max_sum     = max(max_sum, current_sum)
    return max_sum

max_subarray([-2, 1, -3, 4, -1, 2, 1, -5, 4])   # 6 (subarray [4,-1,2,1])

# ── Rotate array in place ─────────────────────────────────────────
def rotate(arr, k):
    """Rotate right by k. O(n) time, O(1) space (reverse trick)."""
    n = len(arr)
    k %= n
    arr.reverse()
    arr[:k] = reversed(arr[:k])
    arr[k:]  = reversed(arr[k:])
```

### ⚡ Recall
- List `append` = O(1) amortised | `insert(0)` = O(n)
- `x in list` = O(n) | `x in set` = O(1)
- **Prefix sums** = O(1) range queries after O(n) preprocessing
- **Kadane's** = O(n) max subarray (extend or restart at each element)
- Two-pointer on sorted array = O(n) instead of O(n²) brute force

---

## 33. Linked Lists

### Concept
A **linked list** is a linear data structure where each **node** holds a value and a pointer to the next node. Unlike arrays, nodes are not contiguous in memory — no random access. O(1) insert/delete at known node, O(n) to find a node.

| Operation | Linked List | Array |
|-----------|-------------|-------|
| Access by index | O(n) | O(1) |
| Insert at head | O(1) | O(n) |
| Insert at tail | O(1) with tail ptr | O(1) amort |
| Search | O(n) | O(n) |
| Delete head | O(1) | O(n) |

### Code
```python
class ListNode:
    def __init__(self, val=0, next=None):
        self.val  = val
        self.next = next

    def __repr__(self):
        return f"{self.val} -> {self.next}"

# ── Build linked list ─────────────────────────────────────────────
def build(values):
    if not values: return None
    head = ListNode(values[0])
    cur  = head
    for v in values[1:]:
        cur.next = ListNode(v)
        cur = cur.next
    return head

head = build([1, 2, 3, 4, 5])

# ── Traverse ──────────────────────────────────────────────────────
def to_list(head):
    result = []
    while head:
        result.append(head.val)
        head = head.next
    return result

# ── Reverse a linked list (iterative) ────────────────────────────
def reverse(head):
    prev, curr = None, head
    while curr:
        next_node  = curr.next
        curr.next  = prev
        prev, curr = curr, next_node
    return prev

# ── Reverse (recursive) ──────────────────────────────────────────
def reverse_recursive(head):
    if not head or not head.next: return head
    new_head = reverse_recursive(head.next)
    head.next.next = head
    head.next = None
    return new_head

# ── Detect cycle — Floyd's tortoise and hare ──────────────────────
def has_cycle(head):
    slow = fast = head
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
        if slow == fast:
            return True
    return False

def find_cycle_start(head):
    """Returns node where cycle begins, or None."""
    slow = fast = head
    while fast and fast.next:
        slow, fast = slow.next, fast.next.next
        if slow == fast:
            break
    else:
        return None
    slow = head
    while slow != fast:
        slow, fast = slow.next, fast.next
    return slow

# ── Find middle (slow/fast pointer) ──────────────────────────────
def find_middle(head):
    slow = fast = head
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
    return slow   # slow lands at middle

# ── Merge two sorted lists ────────────────────────────────────────
def merge_sorted(l1, l2):
    dummy = cur = ListNode(0)
    while l1 and l2:
        if l1.val <= l2.val:
            cur.next, l1 = l1, l1.next
        else:
            cur.next, l2 = l2, l2.next
        cur = cur.next
    cur.next = l1 or l2
    return dummy.next

# ── Remove Nth node from end (one pass) ──────────────────────────
def remove_nth_from_end(head, n):
    dummy = ListNode(0, head)
    fast = slow = dummy
    for _ in range(n + 1):
        fast = fast.next
    while fast:
        fast, slow = fast.next, slow.next
    slow.next = slow.next.next
    return dummy.next

# ── Doubly Linked List node ───────────────────────────────────────
class DListNode:
    def __init__(self, val=0):
        self.val  = val
        self.prev = None
        self.next = None
```

### ⚡ Recall
- **Fast/slow pointer** = cycle detection, finding middle
- **Dummy node** = simplifies head-insertion and deletion edge cases
- Reverse: `prev=None, curr=head` → loop: save next, flip pointer, advance
- `has_cycle`: slow+1, fast+2 → meet if cycle exists
- `find_middle`: fast moves 2×, slow 1× → slow is at middle when fast reaches end

### 🎯 Interview Q&A

> **Q: How does Floyd's cycle detection (tortoise and hare) work?**  
> **A:** Two pointers start at head — `slow` moves 1 step, `fast` moves 2. If there's a cycle, `fast` will lap `slow` and they'll eventually meet inside the cycle. If no cycle, `fast` reaches `None`. To find the **cycle start**: after they meet, reset `slow` to `head` while `fast` stays at the meeting point. Now both advance 1 step at a time — they meet exactly at the cycle start. This works because of the mathematical relationship between the cycle start distance and the meeting point.

> **Q: Why use a dummy head node in linked list problems?**  
> **A:** A dummy (sentinel) node is a fake head node before the real head. It eliminates special cases for inserting or deleting at the head of the list — you always operate on `dummy.next`, never the raw `head`. Without a dummy, code needs separate `if not head` or "is this the first node?" checks. With a dummy, the first real node is treated identically to all others. Always return `dummy.next` at the end.

---

## 34. Stacks

### Concept
A **stack** is a LIFO (Last-In, First-Out) structure — you can only add to and remove from the top. Operations: `push` (add), `pop` (remove top), `peek` (view top). Python's `list` makes an excellent stack with O(1) `append`/`pop`.

### Code
```python
# Python list as stack — O(1) push and pop from right
stack = []
stack.append(1)    # push
stack.append(2)
stack.append(3)
stack.pop()        # 3 — LIFO
stack[-1]          # 2 — peek without removing

# ── Balanced parentheses ──────────────────────────────────────────
def is_balanced(s: str) -> bool:
    stack = []
    pairs = {")":"(", "]":"[", "}":"{"}
    for ch in s:
        if ch in "([{":
            stack.append(ch)
        elif ch in ")]}":
            if not stack or stack[-1] != pairs[ch]:
                return False
            stack.pop()
    return len(stack) == 0

is_balanced("({[]})")  # True
is_balanced("([)]")    # False

# ── Min stack — O(1) getMin ──────────────────────────────────────
class MinStack:
    def __init__(self):
        self.stack     = []
        self.min_stack = []   # parallel stack tracking minimums

    def push(self, val):
        self.stack.append(val)
        min_val = min(val, self.min_stack[-1] if self.min_stack else val)
        self.min_stack.append(min_val)

    def pop(self):
        self.min_stack.pop()
        return self.stack.pop()

    def top(self):   return self.stack[-1]
    def get_min(self): return self.min_stack[-1]

# ── Evaluate Reverse Polish Notation ─────────────────────────────
def eval_rpn(tokens):
    stack = []
    ops = {
        "+": lambda a,b: a+b,
        "-": lambda a,b: a-b,
        "*": lambda a,b: a*b,
        "/": lambda a,b: int(a/b)   # truncate toward zero
    }
    for t in tokens:
        if t in ops:
            b, a = stack.pop(), stack.pop()
            stack.append(ops[t](a, b))
        else:
            stack.append(int(t))
    return stack[0]

eval_rpn(["2","1","+","3","*"])   # (2+1)*3 = 9

# ── Largest rectangle in histogram (monotonic stack) ─────────────
def largest_rectangle(heights):
    stack  = []   # indices of ascending heights
    max_area = 0
    heights.append(0)   # sentinel to flush remaining
    for i, h in enumerate(heights):
        while stack and heights[stack[-1]] > h:
            height = heights[stack.pop()]
            width  = i if not stack else i - stack[-1] - 1
            max_area = max(max_area, height * width)
        stack.append(i)
    return max_area

# ── Daily temperatures (next greater element) ─────────────────────
def daily_temperatures(temps):
    """Returns days until warmer temperature."""
    result = [0] * len(temps)
    stack  = []   # indices
    for i, t in enumerate(temps):
        while stack and temps[stack[-1]] < t:
            j = stack.pop()
            result[j] = i - j
        stack.append(i)
    return result
```

### ⚡ Recall
- Python list as stack: `append` = push, `pop()` = pop, `lst[-1]` = peek
- All stack operations O(1)
- Classic problems: **balanced parens**, **min stack**, **monotonic stack** (next greater element, histogram)
- **Monotonic stack** = maintains elements in sorted order → solves "next greater/smaller element" in O(n)

### 🎯 Interview Q&A

> **Q: What is a monotonic stack and when is it useful?**  
> **A:** A monotonic stack maintains elements in strictly increasing or decreasing order. When a new element breaks the monotonicity, you pop elements until the order is restored. This gives O(n) solution to "next greater element", "daily temperatures", "largest rectangle in histogram" — problems that would be O(n²) with brute force. The key insight: each element is pushed and popped at most once, giving O(n) total.

---

## 35. Queues & Deques

### Concept
A **queue** is FIFO (First-In, First-Out) — enqueue at back, dequeue from front. Python's `collections.deque` provides O(1) operations from both ends. Critical for BFS and task scheduling.

### Code
```python
from collections import deque

# Deque as queue — O(1) both ends
q = deque()
q.append(1)      # enqueue right
q.append(2)
q.append(3)
q.popleft()      # 1 — dequeue left O(1)
q[0]             # peek front

# ❌ list as queue — O(n) popleft!
# ✅ always use deque for queues

# ── BFS template using queue ──────────────────────────────────────
from collections import deque

def bfs(graph, start):
    visited = {start}
    queue   = deque([start])
    result  = []
    while queue:
        node = queue.popleft()
        result.append(node)
        for neighbor in graph[node]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)
    return result

# ── BFS — shortest path ──────────────────────────────────────────
def shortest_path(graph, start, end):
    if start == end: return [start]
    visited = {start}
    queue   = deque([[start]])
    while queue:
        path = queue.popleft()
        node = path[-1]
        for neighbor in graph[node]:
            if neighbor not in visited:
                new_path = path + [neighbor]
                if neighbor == end:
                    return new_path
                visited.add(neighbor)
                queue.append(new_path)
    return None

# ── Sliding window maximum (monotonic deque) ──────────────────────
def max_sliding_window(nums, k):
    """O(n) — maintain decreasing deque of indices."""
    dq = deque()   # stores indices, values in decreasing order
    result = []
    for i, num in enumerate(nums):
        # Remove indices out of window
        while dq and dq[0] < i - k + 1:
            dq.popleft()
        # Remove smaller elements (they can never be max)
        while dq and nums[dq[-1]] < num:
            dq.pop()
        dq.append(i)
        if i >= k - 1:
            result.append(nums[dq[0]])
    return result

max_sliding_window([1,3,-1,-3,5,3,6,7], 3)   # [3,3,5,5,6,7]

# ── Priority Queue (heap) as queue ────────────────────────────────
import heapq

pq = []
heapq.heappush(pq, (1, "low priority"))
heapq.heappush(pq, (3, "high priority"))
heapq.heappush(pq, (2, "medium priority"))
heapq.heappop(pq)    # (1, "low priority") — smallest first
```

### ⚡ Recall
- `deque` = O(1) from both ends | `list.pop(0)` = O(n)
- BFS always uses a queue (FIFO ensures level-by-level traversal)
- **Monotonic deque** = sliding window max/min in O(n)
- `heapq` = priority queue (min-heap) — use `(-val, item)` for max-heap

---

## 36. Hash Tables

### Concept
A **hash table** maps keys to values using a hash function. Average O(1) insert/lookup/delete. Python's `dict` and `set` are hash tables. Understanding collision handling and load factors is key for interviews.

### Code
```python
# Python dict IS a hash table
d = {}
d["key"] = "value"   # O(1) average
d.get("key")         # O(1) average
"key" in d           # O(1) average

# ── Implement simple hash map ─────────────────────────────────────
class HashMap:
    def __init__(self, capacity=16):
        self.capacity = capacity
        self.size     = 0
        self.buckets  = [[] for _ in range(capacity)]  # chaining

    def _hash(self, key):
        return hash(key) % self.capacity

    def put(self, key, value):
        idx    = self._hash(key)
        bucket = self.buckets[idx]
        for i, (k, v) in enumerate(bucket):
            if k == key:
                bucket[i] = (key, value)
                return
        bucket.append((key, value))
        self.size += 1
        if self.size / self.capacity > 0.75:
            self._resize()

    def get(self, key):
        bucket = self.buckets[self._hash(key)]
        for k, v in bucket:
            if k == key: return v
        raise KeyError(key)

    def _resize(self):
        old_buckets   = self.buckets
        self.capacity *= 2
        self.buckets   = [[] for _ in range(self.capacity)]
        self.size      = 0
        for bucket in old_buckets:
            for k, v in bucket:
                self.put(k, v)

# ── Classic hash table interview problems ─────────────────────────

# 1. Two Sum — O(n) time with hash map
def two_sum(nums, target):
    seen = {}   # val → index
    for i, num in enumerate(nums):
        complement = target - num
        if complement in seen:
            return [seen[complement], i]
        seen[num] = i
    return []

two_sum([2, 7, 11, 15], 9)   # [0, 1]

# 2. Group anagrams — O(nk) where k = max word length
from collections import defaultdict

def group_anagrams(words):
    groups = defaultdict(list)
    for word in words:
        key = tuple(sorted(word))   # "eat","tea","ate" → ('a','e','t')
        groups[key].append(word)
    return list(groups.values())

# 3. Longest consecutive sequence — O(n)
def longest_consecutive(nums):
    num_set = set(nums)
    longest = 0
    for n in num_set:
        if n - 1 not in num_set:   # start of a sequence
            length = 1
            while n + length in num_set:
                length += 1
            longest = max(longest, length)
    return longest

# 4. Subarray sum equals k — O(n) with prefix sum + hash map
def subarray_sum(nums, k):
    count, prefix = 0, 0
    freq = {0: 1}     # prefix_sum → count of times seen
    for num in nums:
        prefix += num
        count  += freq.get(prefix - k, 0)
        freq[prefix] = freq.get(prefix, 0) + 1
    return count
```

### ⚡ Recall
- Hash table: average O(1) get/set/delete | worst O(n) (collisions)
- Load factor > 0.75 → resize (Python resizes at 2/3)
- **Two Sum** = classic hash map pattern: store seen values, check complement
- **Group by key** = `defaultdict(list)` + `tuple(sorted(word))` as key
- Prefix sum + hash map = O(n) subarray problems

### 🎯 Interview Q&A

> **Q: How does a hash table handle collisions?**  
> **A:** Two main strategies: (1) **Chaining** — each bucket holds a list (or linked list) of all key-value pairs that hash to that index. Python uses a variant of this. (2) **Open addressing** — on collision, probe for the next empty slot (linear probing, quadratic probing, double hashing). CPython's dict uses open addressing with perturbation. Collision rate increases with **load factor** (number of entries / number of buckets). Python resizes when load factor exceeds ~2/3, keeping collisions rare.

---

## 37. Trees — Binary Tree & BST

### Concept
A **tree** is a hierarchical structure — nodes connected by edges, no cycles. A **binary tree** has at most 2 children per node. A **BST (Binary Search Tree)** maintains the property: left subtree < node < right subtree — enabling O(log n) search in balanced trees.

**Traversal orders:**
- **Inorder** (L-Node-R): gives sorted order in BST
- **Preorder** (Node-L-R): copy tree, serialize
- **Postorder** (L-R-Node): delete tree, evaluate expressions
- **Level-order** (BFS): level-by-level, shortest path

### Code
```python
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val   = val
        self.left  = left
        self.right = right

# ── Build tree from list (level-order) ───────────────────────────
from collections import deque

def build_tree(values):
    if not values: return None
    root  = TreeNode(values[0])
    queue = deque([root])
    i     = 1
    while queue and i < len(values):
        node = queue.popleft()
        if i < len(values) and values[i] is not None:
            node.left = TreeNode(values[i])
            queue.append(node.left)
        i += 1
        if i < len(values) and values[i] is not None:
            node.right = TreeNode(values[i])
            queue.append(node.right)
        i += 1
    return root

# ── DFS Traversals (recursive) ────────────────────────────────────
def inorder(root):    # L-Node-R
    if not root: return []
    return inorder(root.left) + [root.val] + inorder(root.right)

def preorder(root):   # Node-L-R
    if not root: return []
    return [root.val] + preorder(root.left) + preorder(root.right)

def postorder(root):  # L-R-Node
    if not root: return []
    return postorder(root.left) + postorder(root.right) + [root.val]

# ── Inorder iterative (important for interviews) ──────────────────
def inorder_iterative(root):
    result, stack, curr = [], [], root
    while curr or stack:
        while curr:
            stack.append(curr)
            curr = curr.left
        curr = stack.pop()
        result.append(curr.val)
        curr = curr.right
    return result

# ── BFS Level-order ───────────────────────────────────────────────
def level_order(root):
    if not root: return []
    result, queue = [], deque([root])
    while queue:
        level = []
        for _ in range(len(queue)):
            node = queue.popleft()
            level.append(node.val)
            if node.left:  queue.append(node.left)
            if node.right: queue.append(node.right)
        result.append(level)
    return result

# ── Common tree problems ──────────────────────────────────────────
def max_depth(root):
    if not root: return 0
    return 1 + max(max_depth(root.left), max_depth(root.right))

def is_balanced(root):
    def height(node):
        if not node: return 0
        lh = height(node.left)
        rh = height(node.right)
        if lh == -1 or rh == -1 or abs(lh - rh) > 1:
            return -1   # unbalanced signal
        return 1 + max(lh, rh)
    return height(root) != -1

def is_same_tree(p, q):
    if not p and not q: return True
    if not p or not q:  return False
    return p.val == q.val and is_same_tree(p.left, q.left) and is_same_tree(p.right, q.right)

def lowest_common_ancestor(root, p, q):
    if not root or root == p or root == q: return root
    left  = lowest_common_ancestor(root.left, p, q)
    right = lowest_common_ancestor(root.right, p, q)
    return root if left and right else left or right

# ── BST operations ────────────────────────────────────────────────
def bst_search(root, target):
    while root:
        if target == root.val: return root
        root = root.left if target < root.val else root.right
    return None

def bst_insert(root, val):
    if not root: return TreeNode(val)
    if val < root.val:
        root.left  = bst_insert(root.left, val)
    else:
        root.right = bst_insert(root.right, val)
    return root

def validate_bst(root, lo=float('-inf'), hi=float('inf')):
    if not root: return True
    if not (lo < root.val < hi): return False
    return (validate_bst(root.left, lo, root.val) and
            validate_bst(root.right, root.val, hi))

def kth_smallest_bst(root, k):
    """Inorder traversal — kth element is kth smallest in BST."""
    stack, curr = [], root
    while True:
        while curr:
            stack.append(curr)
            curr = curr.left
        curr = stack.pop()
        k -= 1
        if k == 0: return curr.val
        curr = curr.right
```

### ⚡ Recall
- **Inorder BST** = sorted ascending
- **Preorder** = root first (serialisation, copy)
- **Postorder** = root last (deletion, bottom-up processing)
- **Level-order** = BFS (shortest path, level-by-level)
- **BST search/insert/delete** = O(log n) balanced, O(n) worst case
- **LCA** = if both targets are in same subtree, recurse; else current node is LCA

### 🎯 Interview Q&A

> **Q: What is the difference between a binary tree and a BST?**  
> **A:** A **binary tree** is any tree where each node has at most 2 children — no ordering constraint. A **BST (Binary Search Tree)** adds the invariant: for every node, all values in the left subtree are less than the node's value, and all values in the right subtree are greater. This enables O(log n) search, insert, and delete in a balanced BST. Inorder traversal of a BST always yields values in sorted ascending order.

> **Q: What are the four tree traversal orders and when do you use each?**  
> **A:** **Inorder** (left-node-right): used to get BST elements in sorted order. **Preorder** (node-left-right): used to copy/serialize a tree (root processed first). **Postorder** (left-right-node): used to delete a tree, evaluate expression trees, compute directory sizes (children before parent). **Level-order** (BFS): used for shortest path, level-by-level processing, serialization that preserves tree shape.

---

## 38. Heaps & Priority Queues

### Concept
A **heap** is a complete binary tree satisfying the heap property: parent ≤ children (min-heap) or parent ≥ children (max-heap). Python's `heapq` module implements a **min-heap**. O(log n) push/pop, O(1) peek at minimum.

### Code
```python
import heapq

# ── Min-heap operations ───────────────────────────────────────────
heap = []
heapq.heappush(heap, 3)
heapq.heappush(heap, 1)
heapq.heappush(heap, 4)
heapq.heappop(heap)    # 1 — smallest
heap[0]                # 3 — peek minimum O(1)

# heapify — convert list to heap in O(n)
data = [5, 3, 1, 4, 2]
heapq.heapify(data)   # in-place, O(n) — faster than N pushes

# ── Max-heap — negate values ──────────────────────────────────────
max_heap = []
for val in [3, 1, 4, 1, 5]:
    heapq.heappush(max_heap, -val)   # negate to get max behavior
heapq.heappop(max_heap)    # -5 → actual max is 5
-max_heap[0]               # peek max

# ── Kth largest element ───────────────────────────────────────────
def kth_largest(nums, k):
    """O(n log k) — maintain min-heap of size k."""
    min_heap = []
    for num in nums:
        heapq.heappush(min_heap, num)
        if len(min_heap) > k:
            heapq.heappop(min_heap)   # remove smallest
    return min_heap[0]   # kth largest = min of top-k

kth_largest([3,2,1,5,6,4], 2)   # 5

# ── K smallest elements ───────────────────────────────────────────
def k_smallest(nums, k):
    return heapq.nsmallest(k, nums)   # built-in, O(n log k)

def k_largest(nums, k):
    return heapq.nlargest(k, nums)

# ── Merge K sorted lists ──────────────────────────────────────────
def merge_k_sorted(lists):
    """O(n log k) where n=total elements, k=number of lists."""
    result = []
    # heap stores (value, list_idx, element_idx)
    heap = [(lst[0], i, 0) for i, lst in enumerate(lists) if lst]
    heapq.heapify(heap)

    while heap:
        val, i, j = heapq.heappop(heap)
        result.append(val)
        if j + 1 < len(lists[i]):
            heapq.heappush(heap, (lists[i][j+1], i, j+1))
    return result

# ── Median from data stream ───────────────────────────────────────
class MedianFinder:
    """Two heaps: max-heap for lower half, min-heap for upper half."""
    def __init__(self):
        self.lower = []   # max-heap (negated)
        self.upper = []   # min-heap

    def add_num(self, num):
        heapq.heappush(self.lower, -num)
        # Balance: ensure lower max ≤ upper min
        if self.upper and -self.lower[0] > self.upper[0]:
            heapq.heappush(self.upper, -heapq.heappop(self.lower))
        # Balance sizes — lower can be equal or 1 more
        if len(self.lower) > len(self.upper) + 1:
            heapq.heappush(self.upper, -heapq.heappop(self.lower))
        elif len(self.upper) > len(self.lower):
            heapq.heappush(self.lower, -heapq.heappop(self.upper))

    def find_median(self):
        if len(self.lower) > len(self.upper):
            return -self.lower[0]
        return (-self.lower[0] + self.upper[0]) / 2
```

### ⚡ Recall
- `heapq` = **min-heap** | negate values for **max-heap**
- `heapify(list)` = O(n) | `heappush`/`heappop` = O(log n)
- **Kth largest** = min-heap of size k (pop when exceeds k, answer is heap top)
- **Merge K sorted** = heap stores `(value, list_idx, elem_idx)`
- **Median stream** = two heaps (max-heap lower half, min-heap upper half)

---

## 39. Graphs

### Concept
A **graph** G = (V, E) consists of vertices (nodes) and edges (connections). Graphs can be **directed/undirected**, **weighted/unweighted**, **cyclic/acyclic**. Representation: adjacency list (sparse), adjacency matrix (dense), edge list.

### Code
```python
from collections import defaultdict, deque

# ── Graph representations ─────────────────────────────────────────
# Adjacency list — most common
graph = defaultdict(list)
graph["A"] = ["B", "C"]
graph["B"] = ["A", "D"]
graph["C"] = ["A"]
graph["D"] = ["B"]

# Weighted graph
weighted = defaultdict(list)
weighted["A"].append(("B", 4))  # (neighbor, weight)
weighted["A"].append(("C", 2))

# ── BFS — shortest path (unweighted) ─────────────────────────────
def bfs(graph, start, end=None):
    visited = {start}
    queue   = deque([(start, [start])])
    while queue:
        node, path = queue.popleft()
        if node == end: return path
        for neighbor in graph[node]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append((neighbor, path + [neighbor]))
    return None

# ── DFS — iterative ───────────────────────────────────────────────
def dfs(graph, start):
    visited = set()
    stack   = [start]
    result  = []
    while stack:
        node = stack.pop()
        if node not in visited:
            visited.add(node)
            result.append(node)
            for neighbor in graph[node]:
                if neighbor not in visited:
                    stack.append(neighbor)
    return result

# ── DFS — recursive ───────────────────────────────────────────────
def dfs_recursive(graph, node, visited=None):
    if visited is None: visited = set()
    visited.add(node)
    for neighbor in graph[node]:
        if neighbor not in visited:
            dfs_recursive(graph, neighbor, visited)
    return visited

# ── Cycle detection (directed graph) ────────────────────────────
def has_cycle_directed(graph, nodes):
    WHITE, GRAY, BLACK = 0, 1, 2
    color = {n: WHITE for n in nodes}

    def dfs(node):
        color[node] = GRAY   # in current path
        for neighbor in graph[node]:
            if color[neighbor] == GRAY: return True   # back edge!
            if color[neighbor] == WHITE and dfs(neighbor): return True
        color[node] = BLACK   # fully processed
        return False

    return any(dfs(n) for n in nodes if color[n] == WHITE)

# ── Topological Sort (Kahn's BFS) ────────────────────────────────
def topological_sort(num_nodes, prerequisites):
    """For DAG — course schedule problem."""
    graph   = defaultdict(list)
    in_deg  = [0] * num_nodes
    for a, b in prerequisites:   # b → a
        graph[b].append(a)
        in_deg[a] += 1

    queue = deque(i for i in range(num_nodes) if in_deg[i] == 0)
    order = []
    while queue:
        node = queue.popleft()
        order.append(node)
        for neighbor in graph[node]:
            in_deg[neighbor] -= 1
            if in_deg[neighbor] == 0:
                queue.append(neighbor)
    return order if len(order) == num_nodes else []   # empty = cycle exists

# ── Dijkstra's — shortest path (weighted, non-negative) ──────────
def dijkstra(graph, start):
    import heapq
    dist = {node: float('inf') for node in graph}
    dist[start] = 0
    heap = [(0, start)]  # (distance, node)

    while heap:
        d, node = heapq.heappop(heap)
        if d > dist[node]: continue   # stale entry
        for neighbor, weight in graph[node]:
            new_dist = dist[node] + weight
            if new_dist < dist[neighbor]:
                dist[neighbor] = new_dist
                heapq.heappush(heap, (new_dist, neighbor))
    return dist

# ── Union-Find (Disjoint Set Union) ─────────────────────────────
class UnionFind:
    def __init__(self, n):
        self.parent = list(range(n))
        self.rank   = [0] * n

    def find(self, x):
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])  # path compression
        return self.parent[x]

    def union(self, x, y):
        px, py = self.find(x), self.find(y)
        if px == py: return False   # already connected
        if self.rank[px] < self.rank[py]: px, py = py, px
        self.parent[py] = px
        if self.rank[px] == self.rank[py]: self.rank[px] += 1
        return True
```

### ⚡ Recall
- **BFS** = queue, shortest path in unweighted | **DFS** = stack/recursion
- **Topological sort** = only for DAGs; Kahn's (BFS) or DFS+postorder
- **Dijkstra** = shortest path weighted non-negative; use min-heap
- **Union-Find** = connected components, cycle detection in undirected
- **Cycle in directed**: DFS with WHITE/GRAY/BLACK coloring

---

## 40. Recursion

### Concept
**Recursion** = function calling itself with a smaller subproblem. Every recursive solution needs: (1) **base case** (stops recursion), (2) **recursive case** (progress toward base case). Each call creates a new stack frame.

### Code
```python
import sys
sys.setrecursionlimit(10000)   # default is 1000

# ── Classic examples ──────────────────────────────────────────────
def factorial(n):
    if n <= 1: return 1         # base case
    return n * factorial(n - 1) # recursive case

def fibonacci(n):
    if n < 2: return n
    return fibonacci(n-1) + fibonacci(n-2)   # O(2^n) — bad!

# ── Power (fast exponentiation) ───────────────────────────────────
def power(base, exp):
    if exp == 0: return 1
    if exp % 2 == 0:
        half = power(base, exp // 2)
        return half * half       # O(log n)
    return base * power(base, exp - 1)

# ── Binary search (recursive) ────────────────────────────────────
def binary_search(arr, target, lo=0, hi=None):
    if hi is None: hi = len(arr) - 1
    if lo > hi: return -1
    mid = (lo + hi) // 2
    if arr[mid] == target: return mid
    if arr[mid] < target: return binary_search(arr, target, mid+1, hi)
    return binary_search(arr, target, lo, mid-1)

# ── Flatten nested list ───────────────────────────────────────────
def flatten(nested):
    result = []
    for item in nested:
        if isinstance(item, list):
            result.extend(flatten(item))
        else:
            result.append(item)
    return result

flatten([1, [2, [3, [4]], 5]])   # [1,2,3,4,5]

# ── Merge sort ────────────────────────────────────────────────────
def merge_sort(arr):
    if len(arr) <= 1: return arr
    mid   = len(arr) // 2
    left  = merge_sort(arr[:mid])
    right = merge_sort(arr[mid:])
    return merge(left, right)

def merge(left, right):
    result = []
    i = j  = 0
    while i < len(left) and j < len(right):
        if left[i] <= right[j]: result.append(left[i]); i += 1
        else:                    result.append(right[j]); j += 1
    return result + left[i:] + right[j:]

# ── Tail recursion (Python doesn't optimise — use iteration) ──────
# Python has no TCO — deep recursion causes RecursionError
# Convert to iterative or use sys.setrecursionlimit for deep trees
```

### ⚡ Recall
- Every recursion needs **base case** + **recursive case**
- Python default recursion limit = **1000** (`sys.setrecursionlimit(n)`)
- Python does **NOT** optimise tail recursion — deep recursion → `RecursionError`
- Recursion call tree: time = O(branches^depth), space = O(depth) for call stack
- Convert to iteration + explicit stack for production code

---

## 41. Dynamic Programming

### Concept
**Dynamic Programming** solves problems by breaking them into overlapping subproblems, solving each once, and storing results. Two approaches:
- **Memoisation (top-down)**: recursion + cache (natural, lazy)
- **Tabulation (bottom-up)**: iterative + table (usually more space-efficient)

**When to use DP:** optimal substructure (optimal solution built from optimal subsolutions) + overlapping subproblems (same subproblem solved multiple times).

### Code
```python
from functools import lru_cache

# ── Fibonacci ─────────────────────────────────────────────────────
# Naïve:      O(2^n) — exponential
# Memoised:   O(n) time, O(n) space
# Tabulated:  O(n) time, O(n) space
# Optimised:  O(n) time, O(1) space

@lru_cache(maxsize=None)
def fib_memo(n):
    if n < 2: return n
    return fib_memo(n-1) + fib_memo(n-2)

def fib_tab(n):
    if n < 2: return n
    dp = [0] * (n + 1)
    dp[1] = 1
    for i in range(2, n + 1):
        dp[i] = dp[i-1] + dp[i-2]
    return dp[n]

def fib_opt(n):            # O(1) space
    a, b = 0, 1
    for _ in range(n):
        a, b = b, a + b
    return a

# ── 0/1 Knapsack ─────────────────────────────────────────────────
def knapsack(weights, values, capacity):
    n  = len(weights)
    dp = [[0] * (capacity + 1) for _ in range(n + 1)]
    for i in range(1, n + 1):
        for w in range(capacity + 1):
            dp[i][w] = dp[i-1][w]   # don't take item i
            if weights[i-1] <= w:
                dp[i][w] = max(dp[i][w],
                               dp[i-1][w - weights[i-1]] + values[i-1])
    return dp[n][capacity]

# ── Longest Common Subsequence ────────────────────────────────────
def lcs(s1, s2):
    m, n = len(s1), len(s2)
    dp   = [[0] * (n + 1) for _ in range(m + 1)]
    for i in range(1, m + 1):
        for j in range(1, n + 1):
            if s1[i-1] == s2[j-1]:
                dp[i][j] = dp[i-1][j-1] + 1
            else:
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
    return dp[m][n]

lcs("ABCBDAB", "BDCAB")   # 4 (BCAB)

# ── Coin Change (minimum coins) ───────────────────────────────────
def coin_change(coins, amount):
    dp = [float('inf')] * (amount + 1)
    dp[0] = 0
    for coin in coins:
        for x in range(coin, amount + 1):
            dp[x] = min(dp[x], dp[x - coin] + 1)
    return dp[amount] if dp[amount] != float('inf') else -1

coin_change([1,5,11], 15)   # 3 (5+5+5)

# ── Longest Increasing Subsequence — O(n²) ───────────────────────
def lis(arr):
    n  = len(arr)
    dp = [1] * n
    for i in range(1, n):
        for j in range(i):
            if arr[j] < arr[i]:
                dp[i] = max(dp[i], dp[j] + 1)
    return max(dp)

# ── LIS — O(n log n) with binary search ──────────────────────────
import bisect

def lis_fast(arr):
    tails = []   # tails[i] = smallest tail of IS of length i+1
    for num in arr:
        pos = bisect.bisect_left(tails, num)
        if pos == len(tails):
            tails.append(num)
        else:
            tails[pos] = num
    return len(tails)

# ── House Robber ──────────────────────────────────────────────────
def rob(nums):
    prev2, prev1 = 0, 0
    for n in nums:
        prev2, prev1 = prev1, max(prev1, prev2 + n)
    return prev1

# ── Edit Distance (Levenshtein) ───────────────────────────────────
def edit_distance(s1, s2):
    m, n = len(s1), len(s2)
    dp   = [[0]*(n+1) for _ in range(m+1)]
    for i in range(m+1): dp[i][0] = i
    for j in range(n+1): dp[0][j] = j
    for i in range(1, m+1):
        for j in range(1, n+1):
            if s1[i-1] == s2[j-1]:
                dp[i][j] = dp[i-1][j-1]
            else:
                dp[i][j] = 1 + min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1])
    return dp[m][n]
```

### ⚡ Recall
- DP = **overlapping subproblems** + **optimal substructure**
- **Memoisation** = top-down recursion + cache (`@lru_cache`)
- **Tabulation** = bottom-up iteration + table (usually better constants)
- State transition is the key insight — write the recurrence first
- Classic DP: Fibonacci, Knapsack, LCS, Coin Change, LIS, Edit Distance

### 🎯 Interview Q&A

> **Q: What is dynamic programming and how do you identify DP problems?**  
> **A:** DP solves problems by combining solutions to overlapping subproblems, storing each result to avoid recomputation. Signs it's a DP problem: (1) asks for an **optimum** (max/min/count); (2) involves sequences, grids, or ranges; (3) has "overlapping subproblems" — the same sub-questions arise multiple times. Approach: identify the state (what info you need to define a subproblem), write the recurrence relation, add memoisation or build a table bottom-up, optimise space if possible.

---

## 42. Sorting Algorithms

### Concept
Sorting is fundamental. Know the complexities, stability, and when each algorithm excels.

| Algorithm | Best | Average | Worst | Space | Stable |
|-----------|------|---------|-------|-------|--------|
| Bubble Sort | O(n) | O(n²) | O(n²) | O(1) | ✅ |
| Selection Sort | O(n²) | O(n²) | O(n²) | O(1) | ❌ |
| Insertion Sort | O(n) | O(n²) | O(n²) | O(1) | ✅ |
| Merge Sort | O(n log n) | O(n log n) | O(n log n) | O(n) | ✅ |
| Quick Sort | O(n log n) | O(n log n) | O(n²) | O(log n) | ❌ |
| Heap Sort | O(n log n) | O(n log n) | O(n log n) | O(1) | ❌ |
| Counting Sort | O(n+k) | O(n+k) | O(n+k) | O(k) | ✅ |
| Python Timsort | O(n) | O(n log n) | O(n log n) | O(n) | ✅ |

### Code
```python
# ── Bubble Sort — O(n²) ───────────────────────────────────────────
def bubble_sort(arr):
    n = len(arr)
    for i in range(n):
        swapped = False
        for j in range(n - i - 1):
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]
                swapped = True
        if not swapped: break   # already sorted
    return arr

# ── Insertion Sort — O(n²), O(n) best, great for small/nearly sorted
def insertion_sort(arr):
    for i in range(1, len(arr)):
        key = arr[i]
        j   = i - 1
        while j >= 0 and arr[j] > key:
            arr[j+1] = arr[j]
            j -= 1
        arr[j+1] = key
    return arr

# ── Merge Sort — O(n log n), stable ──────────────────────────────
def merge_sort(arr):
    if len(arr) <= 1: return arr
    mid   = len(arr) // 2
    left  = merge_sort(arr[:mid])
    right = merge_sort(arr[mid:])
    i = j = k = 0
    result = arr[:]
    while i < len(left) and j < len(right):
        if left[i] <= right[j]: result[k] = left[i];  i += 1
        else:                    result[k] = right[j]; j += 1
        k += 1
    while i < len(left):  result[k] = left[i];  i += 1; k += 1
    while j < len(right): result[k] = right[j]; j += 1; k += 1
    return result

# ── Quick Sort — O(n log n) average, O(n²) worst ─────────────────
def quick_sort(arr, lo=0, hi=None):
    if hi is None: hi = len(arr) - 1
    if lo >= hi: return
    pivot_idx = partition(arr, lo, hi)
    quick_sort(arr, lo, pivot_idx - 1)
    quick_sort(arr, pivot_idx + 1, hi)

def partition(arr, lo, hi):
    pivot = arr[hi]
    i     = lo - 1
    for j in range(lo, hi):
        if arr[j] <= pivot:
            i += 1
            arr[i], arr[j] = arr[j], arr[i]
    arr[i+1], arr[hi] = arr[hi], arr[i+1]
    return i + 1

# ── Heap Sort — O(n log n), in-place ─────────────────────────────
import heapq

def heap_sort(arr):
    heapq.heapify(arr)
    return [heapq.heappop(arr) for _ in range(len(arr))]

# ── Counting Sort — O(n+k), for integers in range ────────────────
def counting_sort(arr, max_val):
    count  = [0] * (max_val + 1)
    result = []
    for x in arr: count[x] += 1
    for i, c in enumerate(count):
        result.extend([i] * c)
    return result

# ── Python's built-in sort (Timsort) — always use in practice ────
arr = [3, 1, 4, 1, 5, 9]
sorted_arr = sorted(arr)                      # new list
arr.sort()                                    # in-place
arr.sort(key=lambda x: -x)                   # descending
arr.sort(key=lambda x: (x[1], x[0]))        # multi-key
```

### ⚡ Recall
- **Timsort** (Python's `sort`) = O(n log n), stable, excellent on real data
- **Merge sort** = stable, guaranteed O(n log n), but O(n) space
- **Quick sort** = fastest in practice, O(n²) worst case (rare with good pivot)
- **Heap sort** = O(n log n) guaranteed, O(1) space, but not cache-friendly
- **Counting sort** = O(n) for small integer ranges

---

## 43. Binary Search

### Concept
**Binary search** finds a target in a **sorted** array by halving the search space each step — O(log n). The tricky part is getting the boundaries right to avoid infinite loops and off-by-one errors.

### Code
```python
import bisect

# ── Standard binary search ────────────────────────────────────────
def binary_search(arr, target):
    lo, hi = 0, len(arr) - 1
    while lo <= hi:
        mid = lo + (hi - lo) // 2   # avoids integer overflow
        if arr[mid] == target:  return mid
        elif arr[mid] < target: lo = mid + 1
        else:                   hi = mid - 1
    return -1

# ── Find first occurrence (leftmost) ─────────────────────────────
def find_first(arr, target):
    lo, hi = 0, len(arr) - 1
    result = -1
    while lo <= hi:
        mid = (lo + hi) // 2
        if arr[mid] == target:
            result = mid
            hi = mid - 1   # keep looking left
        elif arr[mid] < target: lo = mid + 1
        else:                   hi = mid - 1
    return result

# ── Find last occurrence (rightmost) ─────────────────────────────
def find_last(arr, target):
    lo, hi = 0, len(arr) - 1
    result = -1
    while lo <= hi:
        mid = (lo + hi) // 2
        if arr[mid] == target:
            result = mid
            lo = mid + 1   # keep looking right
        elif arr[mid] < target: lo = mid + 1
        else:                   hi = mid - 1
    return result

# ── Search insert position / lower bound ─────────────────────────
def lower_bound(arr, target):
    """First index where arr[i] >= target."""
    lo, hi = 0, len(arr)
    while lo < hi:
        mid = (lo + hi) // 2
        if arr[mid] < target: lo = mid + 1
        else:                 hi = mid
    return lo

# ── bisect module — battle-tested binary search ───────────────────
arr = [1, 2, 4, 4, 4, 6, 8]
bisect.bisect_left(arr, 4)    # 2 — first position for 4
bisect.bisect_right(arr, 4)   # 5 — last position after 4
bisect.insort(arr, 5)          # insert 5 maintaining sort

# ── Search in rotated sorted array ───────────────────────────────
def search_rotated(nums, target):
    lo, hi = 0, len(nums) - 1
    while lo <= hi:
        mid = (lo + hi) // 2
        if nums[mid] == target: return mid
        # Left half sorted
        if nums[lo] <= nums[mid]:
            if nums[lo] <= target < nums[mid]: hi = mid - 1
            else:                               lo = mid + 1
        # Right half sorted
        else:
            if nums[mid] < target <= nums[hi]: lo = mid + 1
            else:                               hi = mid - 1
    return -1

# ── Binary search on answer (minimize/maximize) ───────────────────
def can_divide(piles, h, mid):
    """Can eat all piles in h hours at speed mid?"""
    import math
    return sum(math.ceil(p / mid) for p in piles) <= h

def min_eating_speed(piles, h):
    """Koko eating bananas — binary search on answer."""
    lo, hi = 1, max(piles)
    while lo < hi:
        mid = (lo + hi) // 2
        if can_divide(piles, h, mid): hi = mid
        else:                          lo = mid + 1
    return lo
```

### ⚡ Recall
- `lo <= hi` terminates when search space empty | `lo < hi` terminates when 1 element remains
- `mid = lo + (hi - lo) // 2` — avoids integer overflow vs `(lo+hi)//2`
- `bisect_left` = first position ≥ target | `bisect_right` = first position > target
- **Binary search on answer** = define a monotonic condition, search for the boundary

---

## 44. Two Pointers Technique

### Concept
**Two pointers** uses two index variables that move through an array (usually from opposite ends or at different speeds) to solve problems in O(n) that would be O(n²) brute force.

### Code
```python
# ── Two Sum in sorted array ───────────────────────────────────────
def two_sum_sorted(arr, target):
    left, right = 0, len(arr) - 1
    while left < right:
        total = arr[left] + arr[right]
        if total == target:   return (left, right)
        elif total < target:  left += 1
        else:                 right -= 1
    return None

# ── Three Sum ─────────────────────────────────────────────────────
def three_sum(nums):
    nums.sort()
    result = []
    for i in range(len(nums) - 2):
        if i > 0 and nums[i] == nums[i-1]: continue  # skip duplicates
        left, right = i + 1, len(nums) - 1
        while left < right:
            total = nums[i] + nums[left] + nums[right]
            if total == 0:
                result.append([nums[i], nums[left], nums[right]])
                while left < right and nums[left] == nums[left+1]:   left += 1
                while left < right and nums[right] == nums[right-1]: right -= 1
                left += 1; right -= 1
            elif total < 0: left += 1
            else:           right -= 1
    return result

# ── Container with most water ─────────────────────────────────────
def max_water(heights):
    left, right = 0, len(heights) - 1
    max_vol = 0
    while left < right:
        vol     = min(heights[left], heights[right]) * (right - left)
        max_vol = max(max_vol, vol)
        if heights[left] < heights[right]: left += 1
        else:                              right -= 1
    return max_vol

# ── Palindrome check with two pointers ───────────────────────────
def is_palindrome(s):
    s = ''.join(c.lower() for c in s if c.isalnum())
    left, right = 0, len(s) - 1
    while left < right:
        if s[left] != s[right]: return False
        left += 1; right -= 1
    return True

# ── Merge sorted arrays in-place ─────────────────────────────────
def merge_in_place(nums1, m, nums2, n):
    """Merge nums2 into nums1 (nums1 has enough space at end)."""
    p1, p2, p = m-1, n-1, m+n-1
    while p2 >= 0:
        if p1 >= 0 and nums1[p1] > nums2[p2]:
            nums1[p] = nums1[p1]; p1 -= 1
        else:
            nums1[p] = nums2[p2]; p2 -= 1
        p -= 1

# ── Remove duplicates from sorted array ──────────────────────────
def remove_duplicates(arr):
    if not arr: return 0
    slow = 0
    for fast in range(1, len(arr)):
        if arr[fast] != arr[slow]:
            slow += 1
            arr[slow] = arr[fast]
    return slow + 1
```

### ⚡ Recall
- Works on **sorted** arrays or with logical ordering
- Outer-to-inner: two ends converging (two sum, container water)
- Same direction: slow/fast pointers (remove duplicates, cycle detection)
- Sort first if needed, then apply two-pointer O(n log n) vs O(n²) brute

---

## 45. Sliding Window Technique

### Concept
**Sliding window** maintains a contiguous subarray/substring of variable or fixed size, sliding across the array in O(n) instead of recomputing from scratch for every window — avoiding O(n²) or O(n³) brute force.

### Code
```python
# ── Fixed-size window: max sum subarray of size k ─────────────────
def max_sum_k(arr, k):
    window_sum = sum(arr[:k])
    max_sum    = window_sum
    for i in range(k, len(arr)):
        window_sum += arr[i] - arr[i - k]   # slide: add right, remove left
        max_sum = max(max_sum, window_sum)
    return max_sum

# ── Variable-size window: longest substring without repeating ─────
def length_of_longest_substring(s):
    char_idx = {}      # char → last seen index
    left     = 0
    max_len  = 0
    for right, ch in enumerate(s):
        if ch in char_idx and char_idx[ch] >= left:
            left = char_idx[ch] + 1  # shrink window
        char_idx[ch] = right
        max_len = max(max_len, right - left + 1)
    return max_len

length_of_longest_substring("abcabcbb")   # 3 (abc)

# ── Minimum window substring ──────────────────────────────────────
from collections import Counter

def min_window(s, t):
    """Smallest substring of s containing all chars of t."""
    need   = Counter(t)
    have   = {}
    formed = 0
    required = len(need)
    left     = 0
    result   = (float('inf'), 0, 0)

    for right, ch in enumerate(s):
        have[ch] = have.get(ch, 0) + 1
        if ch in need and have[ch] == need[ch]:
            formed += 1
        while formed == required:
            # Try to shrink window
            if right - left + 1 < result[0]:
                result = (right - left + 1, left, right)
            left_ch = s[left]
            have[left_ch] -= 1
            if left_ch in need and have[left_ch] < need[left_ch]:
                formed -= 1
            left += 1

    return "" if result[0] == float('inf') else s[result[1]:result[2]+1]

# ── Longest subarray with sum ≤ k ────────────────────────────────
def longest_subarray_sum_k(arr, k):
    left = curr_sum = max_len = 0
    for right in range(len(arr)):
        curr_sum += arr[right]
        while curr_sum > k:
            curr_sum -= arr[left]
            left += 1
        max_len = max(max_len, right - left + 1)
    return max_len

# ── Fruit into baskets (at most 2 distinct) ───────────────────────
def total_fruit(fruits):
    basket = {}
    left   = 0
    max_fruit = 0
    for right, f in enumerate(fruits):
        basket[f] = basket.get(f, 0) + 1
        while len(basket) > 2:
            basket[fruits[left]] -= 1
            if basket[fruits[left]] == 0:
                del basket[fruits[left]]
            left += 1
        max_fruit = max(max_fruit, right - left + 1)
    return max_fruit
```

### ⚡ Recall
- **Fixed window**: precompute first window, slide with add/remove
- **Variable window**: expand right, shrink left when condition violated
- Pattern: `for right in range(n): while invalid: shrink left`
- Window size = `right - left + 1`
- Classic: longest substring, minimum window, max sum subarray

---

## 46. BFS & DFS Traversals

### Concept
Two fundamental graph/tree traversal strategies with different use cases:
- **BFS**: explores level by level → shortest path, minimum steps
- **DFS**: explores as deep as possible → connected components, cycle detection, topological sort

### Code
```python
from collections import deque

# ── BFS on grid (matrix) ─────────────────────────────────────────
def bfs_grid(grid, start):
    rows, cols = len(grid), len(grid[0])
    visited    = set([start])
    queue      = deque([(start, 0)])  # (position, distance)
    directions = [(0,1),(0,-1),(1,0),(-1,0)]

    while queue:
        (r, c), dist = queue.popleft()
        for dr, dc in directions:
            nr, nc = r + dr, c + dc
            if (0 <= nr < rows and 0 <= nc < cols
                    and (nr, nc) not in visited
                    and grid[nr][nc] != '#'):
                visited.add((nr, nc))
                queue.append(((nr, nc), dist + 1))

# ── Number of islands (DFS) ───────────────────────────────────────
def num_islands(grid):
    if not grid: return 0
    rows, cols = len(grid), len(grid[0])
    count      = 0

    def dfs(r, c):
        if r < 0 or r >= rows or c < 0 or c >= cols or grid[r][c] != '1':
            return
        grid[r][c] = '#'   # mark visited (mutate grid)
        dfs(r+1,c); dfs(r-1,c); dfs(r,c+1); dfs(r,c-1)

    for r in range(rows):
        for c in range(cols):
            if grid[r][c] == '1':
                count += 1
                dfs(r, c)
    return count

# ── BFS — 0/1 Matrix (distance to nearest 0) ─────────────────────
def update_matrix(mat):
    rows, cols = len(mat), len(mat[0])
    dist  = [[float('inf')] * cols for _ in range(rows)]
    queue = deque()
    for r in range(rows):
        for c in range(cols):
            if mat[r][c] == 0:
                dist[r][c] = 0
                queue.append((r, c))
    for dr, dc in [(0,1),(0,-1),(1,0),(-1,0)]:
        pass
    while queue:
        r, c = queue.popleft()
        for dr, dc in [(0,1),(0,-1),(1,0),(-1,0)]:
            nr, nc = r + dr, c + dc
            if 0 <= nr < rows and 0 <= nc < cols:
                if dist[nr][nc] > dist[r][c] + 1:
                    dist[nr][nc] = dist[r][c] + 1
                    queue.append((nr, nc))
    return dist

# ── Clone graph (BFS) ─────────────────────────────────────────────
def clone_graph(node):
    if not node: return None
    clones = {node: Node(node.val)}
    queue  = deque([node])
    while queue:
        orig = queue.popleft()
        for nb in orig.neighbors:
            if nb not in clones:
                clones[nb] = Node(nb.val)
                queue.append(nb)
            clones[orig].neighbors.append(clones[nb])
    return clones[node]
```

### ⚡ Recall
- **BFS** → shortest path, minimum steps, level-order
- **DFS** → connected components, cycle detection, path existence, tree problems
- BFS uses **queue** (FIFO) | DFS uses **stack** (LIFO) or recursion
- Multi-source BFS: add all sources to queue at start (0/1 matrix, rotting oranges)
- Always mark visited **before** enqueuing (not after dequeuing) to avoid re-adding

---

## 47. Backtracking

### Concept
**Backtracking** is a systematic brute-force approach — explore all possibilities, abandoning (pruning) paths that can't lead to a solution. Template: choose → explore → unchoose.

### Code
```python
# ── Permutations ─────────────────────────────────────────────────
def permutations(nums):
    result = []
    def backtrack(path, remaining):
        if not remaining:
            result.append(path[:])
            return
        for i in range(len(remaining)):
            path.append(remaining[i])
            backtrack(path, remaining[:i] + remaining[i+1:])
            path.pop()  # unchoose
    backtrack([], nums)
    return result

# ── Subsets (power set) ───────────────────────────────────────────
def subsets(nums):
    result = []
    def backtrack(start, path):
        result.append(path[:])   # add every state (not just leaves)
        for i in range(start, len(nums)):
            path.append(nums[i])
            backtrack(i + 1, path)
            path.pop()
    backtrack(0, [])
    return result

# ── Combination Sum ───────────────────────────────────────────────
def combination_sum(candidates, target):
    result = []
    candidates.sort()
    def backtrack(start, path, remaining):
        if remaining == 0:
            result.append(path[:])
            return
        for i in range(start, len(candidates)):
            if candidates[i] > remaining: break  # pruning
            path.append(candidates[i])
            backtrack(i, path, remaining - candidates[i])  # i allows reuse
            path.pop()
    backtrack(0, [], target)
    return result

# ── N-Queens ──────────────────────────────────────────────────────
def solve_n_queens(n):
    result = []
    cols     = set()
    diag1    = set()   # row - col
    diag2    = set()   # row + col

    def backtrack(row, path):
        if row == n:
            result.append(["."*c + "Q" + "."*(n-c-1) for c in path])
            return
        for col in range(n):
            if col in cols or (row-col) in diag1 or (row+col) in diag2:
                continue
            cols.add(col);         diag1.add(row-col); diag2.add(row+col)
            path.append(col)
            backtrack(row + 1, path)
            path.pop()
            cols.remove(col);      diag1.remove(row-col); diag2.remove(row+col)

    backtrack(0, [])
    return result

# ── Word search in grid ───────────────────────────────────────────
def word_search(board, word):
    rows, cols = len(board), len(board[0])

    def dfs(r, c, k):
        if k == len(word): return True
        if not (0 <= r < rows and 0 <= c < cols): return False
        if board[r][c] != word[k]: return False
        tmp, board[r][c] = board[r][c], '#'  # mark visited
        found = any(dfs(r+dr, c+dc, k+1) for dr,dc in [(0,1),(0,-1),(1,0),(-1,0)])
        board[r][c] = tmp   # restore
        return found

    return any(dfs(r, c, 0) for r in range(rows) for c in range(cols))
```

### ⚡ Recall
- Template: `for choice in choices: choose → recurse → unchoose`
- **Pruning** = skip invalid branches early (most important optimisation)
- Subsets: add path at every node | Permutations: add only at leaves
- Avoid revisiting: pass `start` index (combinations) or `visited` set
- N-Queens: track cols, diagonals with sets for O(1) conflict check

---

## 48. Common Interview Patterns & Cheatsheet

### Pattern Recognition Guide
```
Array/String problem
├── Find pair/triplet with sum → Two Pointers or Hash Map
├── Subarray/substring → Sliding Window or Prefix Sum
├── In sorted array → Binary Search
├── Anagrams/frequency → Counter / Hash Map
└── All combinations/permutations → Backtracking

Linked List problem
├── Cycle detection → Fast/Slow Pointer
├── Middle of list → Fast/Slow Pointer
├── Reverse → Iterative (prev/curr/next)
├── Merge sorted → Dummy Head
└── Nth from end → Two pointers gap of N

Tree/Graph problem
├── Shortest path (unweighted) → BFS
├── Shortest path (weighted) → Dijkstra
├── All paths/exists → DFS
├── Level-order processing → BFS
├── Connected components → DFS/BFS/Union-Find
└── Topological order → Kahn's BFS or DFS+postorder

Optimization problem
├── Overlapping subproblems → Dynamic Programming
├── Top-K elements → Heap
├── Sorted + search → Binary Search on answer
└── Make local optimal choices → Greedy

Interval problem
├── Merge overlapping → Sort by start, linear merge
├── Insert interval → Find position, merge
└── Meeting rooms → Sort + count overlapping
```

### Python DSA Cheatsheet
```python
# Infinity
float('inf')       # positive infinity
float('-inf')      # negative infinity

# Integer limits (Python ints are unbounded)
import sys
sys.maxsize        # platform max int

# Sorting with multiple keys
arr.sort(key=lambda x: (x[0], -x[1]))

# Dictionary count pattern
from collections import defaultdict, Counter
freq = Counter(arr)
freq.most_common(k)

# Heap (min)
import heapq
heap = []
heapq.heappush(heap, val)
heapq.heappop(heap)
heapq.heapify(lst)         # O(n)
heapq.nlargest(k, lst)
heapq.nsmallest(k, lst)

# Max heap (negate)
heapq.heappush(heap, -val)
-heapq.heappop(heap)

# Deque
from collections import deque
dq = deque()
dq.append(x); dq.appendleft(x)
dq.pop(); dq.popleft()

# Binary search
import bisect
bisect.bisect_left(arr, x)   # leftmost position for x
bisect.bisect_right(arr, x)  # rightmost position for x
bisect.insort(arr, x)        # insert maintaining sort

# Graph
from collections import defaultdict
graph = defaultdict(list)
graph[u].append(v)

# Union-Find
parent = list(range(n))
def find(x):
    while parent[x] != x:
        parent[x] = parent[parent[x]]   # path compression
        x = parent[x]
    return x
def union(x, y):
    parent[find(x)] = find(y)

# Memoization
from functools import lru_cache
@lru_cache(maxsize=None)
def dp(i, j):
    ...

# String operations
s[::-1]                  # reverse
"".join(sorted(s))       # sort characters
s.split(); s.strip()
ord('a'), chr(97)

# Common one-liners
max(d.items(), key=lambda x: x[1])  # max value in dict
[x for x in arr if condition]        # filter
{v: k for k, v in d.items()}         # invert dict
list(zip(*matrix))                    # transpose matrix
```

### Time Complexity Quick Reference
```
O(1)       → Hash map ops, array index, stack/queue ops
O(log n)   → Binary search, balanced BST, heap push/pop
O(n)       → Linear scan, BFS/DFS, two pointers, sliding window
O(n log n) → Sorting, heap operations on all n elements
O(n²)      → Nested loops, brute force two pairs
O(n * k)   → String hashing, two-pointer on k items each
O(2ⁿ)     → All subsets, exponential recursion
O(n!)      → All permutations
```

---

*📌 Bookmark this file — these patterns cover 90%+ of technical interview problems.*

*⭐ Star this repo if it helped you crack the interview!*
