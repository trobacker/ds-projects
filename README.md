# ds-projects

A collection of data science projects and experiments.

## Project Structure

```
ds-projects/
├── notebooks/       # Jupyter notebooks for exploratory analysis
├── scripts/         # Python scripts for data processing and analysis
├── data/           # Data files (gitignored)
├── results/        # Output files, figures, models (gitignored)
└── pyproject.toml  # Project dependencies
```

## Quick Start

### 1. Install uv

```bash
# macOS/Linux
curl -LsSf https://astral.sh/uv/install.sh | sh

# Windows
powershell -c "irm https://astral.sh/uv/install.ps1 | iex"

# Or with pip
pip install uv
```

### 2. Set Up the Environment

```bash
# Create virtual environment and install all dependencies
uv sync

# This creates a .venv directory with Python 3.13 and all packages
```

### 3. Use with VS Code (Recommended)

See **[VSCODE_SETUP.md](VSCODE_SETUP.md)** for detailed VS Code setup instructions.

**Quick version:**
1. Install Python and Jupyter extensions in VS Code
2. Open the repository in VS Code
3. Select the `.venv` interpreter (Cmd/Ctrl+Shift+P → "Python: Select Interpreter")
4. Open a notebook and start coding!

### 4. Or Use in Terminal

```bash
# Activate the virtual environment
source .venv/bin/activate  # macOS/Linux
# or
.venv\Scripts\activate  # Windows

# Start Jupyter Lab
jupyter lab
```

### Installing Additional Packages

```bash
# Add a new dependency to pyproject.toml and install it
uv add package-name

# Add a development dependency
uv add --group dev package-name

# Install packages without adding to pyproject.toml (temporary)
uv pip install package-name
```

## Installed Libraries

The environment includes common data science libraries:

- **Data manipulation**: pandas, polars, numpy
- **Machine learning**: scikit-learn, lightgbm
- **Statistical analysis**: scipy, statsmodels
- **Visualization**: matplotlib, seaborn, plotly
- **Notebooks**: jupyter, jupyterlab, ipython

## Development Workflow

1. Activate the virtual environment
2. Create notebooks in `notebooks/` or scripts in `scripts/`
3. Store data in `data/` (not tracked by git)
4. Save results/outputs in `results/` (not tracked by git)
5. Document your work with clear markdown and comments

## Updating Dependencies

```bash
# Update all dependencies to latest compatible versions
uv lock --upgrade

# Sync environment with updated lockfile
uv sync
```
