# VS Code Setup Guide

This guide will help you set up VS Code to work with Jupyter notebooks in this repository.

## Prerequisites

1. **Install uv** (if not already installed):
   ```bash
   # macOS/Linux
   curl -LsSf https://astral.sh/uv/install.sh | sh

   # Or with pip
   pip install uv
   ```

2. **Install VS Code Extensions**:
   - Open VS Code
   - Go to Extensions (Cmd+Shift+X on Mac, Ctrl+Shift+X on Windows/Linux)
   - Install these extensions:
     - **Python** (by Microsoft) - `ms-python.python`
     - **Jupyter** (by Microsoft) - `ms-toolsai.jupyter`

## Step-by-Step Setup

### 1. Create the Virtual Environment

From the repository root directory:

```bash
# Create and install all dependencies
uv sync
```

This will:
- Create a `.venv` directory with your virtual environment
- Install all dependencies from `pyproject.toml`
- Download and use Python 3.13 automatically

### 2. Open the Repository in VS Code

```bash
# Open VS Code from the terminal
code .
```

Or use: File → Open Folder → Select `ds-projects`

### 3. Select the Python Interpreter

**Method 1: Using Command Palette**
1. Press `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows/Linux)
2. Type: `Python: Select Interpreter`
3. Choose the interpreter that shows `.venv` in the path:
   - It should look like: `Python 3.13.5 ('.venv': venv) ./venv/bin/python`

**Method 2: Using the Status Bar**
1. Look at the bottom-right corner of VS Code
2. Click on the Python version (e.g., "Python 3.13.5")
3. Select the `.venv` interpreter from the list

### 4. Open a Jupyter Notebook

1. Navigate to `notebooks/01_ml_tutorial_iris.ipynb`
2. VS Code will automatically detect it as a Jupyter notebook
3. If prompted to select a kernel:
   - Click "Select Kernel" in the top-right
   - Choose "Python Environments..."
   - Select the `.venv` interpreter

### 5. Run the Notebook

**Run All Cells:**
- Click the "Run All" button at the top of the notebook
- Or use: `Cmd+Shift+Enter` (Mac) / `Ctrl+Shift+Enter` (Windows/Linux)

**Run Individual Cells:**
- Click the play button (▶) next to a cell
- Or place cursor in cell and press `Shift+Enter`

## Troubleshooting

### Kernel Not Found

If VS Code can't find the kernel:
1. Make sure `.venv` directory exists (run `ls -la .venv`)
2. Restart VS Code
3. Try selecting the interpreter again

### Import Errors

If you get import errors when running cells:
1. Make sure you selected the correct interpreter (`.venv`)
2. Check the kernel shows `.venv` in the top-right of the notebook
3. Restart the kernel: Click on "Restart" in the kernel dropdown

### Adding New Packages

To add more packages to your environment:

```bash
# Add a regular dependency
uv add package-name

# Add a development dependency
uv add --group dev package-name

# Then restart your Jupyter kernel in VS Code
```

## Verifying Your Setup

Run this in a notebook cell to verify everything works:

```python
import pandas as pd
import numpy as np
import sklearn
import lightgbm
import matplotlib.pyplot as plt

print("✓ All packages imported successfully!")
print(f"Python: {pd.__version__}")
print(f"NumPy: {np.__version__}")
print(f"scikit-learn: {sklearn.__version__}")
```

## Tips

1. **Jupyter in Browser**: If you prefer Jupyter Lab in your browser:
   ```bash
   source .venv/bin/activate  # or .venv\Scripts\activate on Windows
   jupyter lab
   ```

2. **Terminal in VS Code**: Open integrated terminal (Ctrl+`) and activate:
   ```bash
   source .venv/bin/activate
   ```

3. **Auto-activate**: VS Code should automatically activate the venv when you open a terminal in the project

## Next Steps

Once everything is working:
- Open `notebooks/01_ml_tutorial_iris.ipynb`
- Run all cells to see the complete ML workflow
- Experiment with the code and create your own notebooks!
