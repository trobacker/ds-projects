# R Notebooks

This directory contains R tutorials and analyses using Quarto documents.

## Quick Start

```bash
# 1. Navigate to this directory
cd r-notebooks

# 2. Set up R environment (one time only)
Rscript setup_renv.R

# 3. Render a tutorial
quarto render 01_bayesian_decision_theory.qmd

# 4. Open the generated HTML file
open 01_bayesian_decision_theory.html
```

Or use RStudio:
1. Open any `.qmd` file
2. Click "Render" button (or Cmd/Ctrl + Shift + K)
3. renv will automatically activate

## Setup

### Prerequisites

- R (version 4.3.0 or higher recommended)
- RStudio (optional, but recommended)
- Quarto CLI

### Installing Quarto

```bash
# macOS with Homebrew
brew install quarto

# Or download from https://quarto.org/docs/get-started/
```

### Setting up R Environment

This project uses `renv` for R package management to ensure reproducibility.

#### Option 1: Automated Setup (Recommended)

```bash
# Navigate to r-notebooks directory
cd r-notebooks

# Run setup script
Rscript setup_renv.R
```

This will:
1. Install renv if needed
2. Initialize the renv project
3. Install all required packages
4. Create a snapshot of the environment

#### Option 2: Manual Setup

```r
# In R, navigate to r-notebooks directory
setwd("r-notebooks")

# Install renv if not already installed
if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv")
}

# Initialize renv (first time only)
renv::init()

# Or restore from existing lockfile
renv::restore()
```

#### Verifying the Setup

```r
# Check that renv is active
renv::status()

# Test loading a package
library(ggplot2)
library(lightgbm)  # This may take longer to install
```

### Special Note: LightGBM Installation

The `lightgbm` package (used in Tutorial 03) may require additional setup:

**macOS:**
```bash
# Install cmake and libomp
brew install cmake libomp
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get install cmake libboost-dev libboost-system-dev libboost-filesystem-dev
```

**Windows:**
- LightGBM should install directly from CRAN
- If issues arise, see: https://lightgbm.readthedocs.io/en/latest/R/index.html

If you encounter persistent issues with `lightgbm`, you can still run Tutorials 01 and 02 which don't require it.

## Rendering Documents

### Render a single document

```bash
# From the r-notebooks directory
quarto render 01_bayesian_decision_theory.qmd
```

### Render to different formats

```bash
# HTML (default)
quarto render 01_bayesian_decision_theory.qmd --to html

# PDF (requires LaTeX)
quarto render 01_bayesian_decision_theory.qmd --to pdf

# Word document
quarto render 01_bayesian_decision_theory.qmd --to docx
```

### Preview with live reload

```bash
quarto preview 01_bayesian_decision_theory.qmd
```

## Using RStudio

1. Open the `.qmd` file in RStudio
2. Click the "Render" button
3. Or use Ctrl/Cmd + Shift + K

## Tutorials

### 01_bayesian_decision_theory.qmd

An applied tutorial on Bayesian Decision Theory covering:
- The decision-theoretic framework
- Medical diagnosis with 0-1 loss
- Parameter estimation with quadratic loss
- Classification with asymmetric loss functions
- Practical examples with visualization

### 02_multivariate_bayesian_decision_theory.qmd

Advanced multivariate applications with healthcare focus:
- Multivariate disease diagnosis with multiple biomarkers
- Treatment selection based on multiple patient features
- Sequential testing and decision-making
- Value of information analysis
- Bayesian linear regression for risk estimation
- Extensive visualizations of decision boundaries

### 03_ml_bayesian_decision_theory.qmd

Connecting machine learning with decision theory:
- How ML predictions enable optimal decisions
- Using LightGBM with Bayesian decision framework
- Credit card fraud detection with asymmetric costs
- Hospital readmission prevention with multiple interventions
- Optimal threshold analysis vs. default 0.5 threshold
- Cost-based model evaluation
- Real-world impact: 30-70% cost reductions

## Required R Packages

The following packages are managed by renv:

- **Data manipulation**: `dplyr`, `tidyr`, `reshape2`
- **Visualization**: `ggplot2`, `gridExtra`
- **Statistical distributions**: `MASS`, `mvtnorm`
- **Machine learning**: `lightgbm`, `pROC`
- **Document generation**: `knitr`, `rmarkdown`

## Adding New Packages

If you need additional packages for your analysis:

```r
# Install and track new package
install.packages("package_name")
renv::snapshot()  # Update renv.lock
```

## Troubleshooting

### renv not activating

If renv doesn't activate automatically:
```r
# Manually source the activation script
source("renv/activate.R")

# Or restart R in the r-notebooks directory
```

### Package installation fails

```r
# Try installing from a specific CRAN mirror
options(repos = c(CRAN = "https://cloud.r-project.org"))
renv::restore()

# Or install a specific package
install.packages("package_name", repos = "https://cloud.r-project.org")
```

### lightgbm installation issues

**macOS**: If you see compiler errors:
```bash
# Install required tools
brew install cmake libomp

# Then try again in R
install.packages("lightgbm")
```

**Error: "cannot load shared library"**: This usually means missing system dependencies. See the special note about LightGBM above.

### Quarto not found

```bash
# Check if quarto is installed
which quarto

# If not, install it
brew install quarto  # macOS
# Or download from https://quarto.org
```

### RStudio doesn't recognize renv

1. Close RStudio
2. Delete `.Rprofile` in your home directory (if it conflicts)
3. Reopen RStudio in the `r-notebooks/` directory
4. RStudio should now detect and use the local `.Rprofile`

### Memory issues with large datasets

If you encounter memory errors:
```r
# Reduce sample sizes in code chunks
n_samples <- 1000  # Instead of 5000

# Or increase R memory limit (Windows)
memory.limit(size = 8000)
```

## Tips

- Keep tutorial documents well-organized with clear sections
- Include mathematical notation using LaTeX syntax
- Add code chunks with explanatory markdown
- Generate visualizations to illustrate concepts
- Run `renv::snapshot()` after installing new packages to update the lockfile
- Each tutorial has renv instructions in a callout box at the setup section
