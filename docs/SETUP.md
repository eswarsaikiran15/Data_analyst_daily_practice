# 🔧 Setup Guide

This guide will help you set up your environment to work with this repository.

## Prerequisites

- Python 3.8 or higher
- Git
- pip (Python package manager) or Conda

## Installation Steps

### 1. Clone the Repository

```bash
git clone https://github.com/eswarsaikiran15/Data_analyst_daily_practice.git
cd Data_analyst_daily_practice
```

### 2. Create a Virtual Environment (Recommended)

**Using venv:**
```bash
python -m venv venv

# Activate the virtual environment
# On Windows:
venv\Scripts\activate

# On macOS/Linux:
source venv/bin/activate
```

**Using Conda:**
```bash
conda create -n data_analyst python=3.9
conda activate data_analyst
```

### 3. Install Dependencies

```bash
pip install -r requirements.txt
```

### 4. Start Jupyter Notebook

```bash
jupyter notebook
```

Jupyter will open in your default browser at `http://localhost:8888`

## Verifying Installation

Create a test notebook and run:

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

print("All libraries imported successfully!")
print(f"Pandas version: {pd.__version__}")
print(f"NumPy version: {np.__version__}")
```

If all imports work, you're ready to go!

## Troubleshooting

**Issue: `ModuleNotFoundError`**
- Solution: Ensure your virtual environment is activated and dependencies are installed

**Issue: Jupyter not found**
- Solution: `pip install jupyter` and ensure it's in requirements.txt

**Issue: Python version incompatible**
- Solution: Check your Python version with `python --version` and upgrade if needed

## IDE Recommendations

- **Jupyter Notebook** (included with installation)
- **JupyterLab** (more powerful, install with `pip install jupyterlab`)
- **VS Code** with Jupyter extension
- **PyCharm** Community Edition

## Next Steps

1. Review the `LEARNING_PATH.md` document
2. Start with the first notebook in `01_foundations/`
3. Follow the exercises and practice along

Happy learning! 🚀
