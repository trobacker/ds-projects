# R Notebooks

This directory contains R tutorials and analyses using Quarto documents.

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

```r
# Install renv if not already installed
install.packages("renv")

# Navigate to the r-notebooks directory and restore packages
renv::restore()
```

This will install all required packages specified in `renv.lock`.

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

## Tips

- Keep tutorial documents well-organized with clear sections
- Include mathematical notation using LaTeX syntax
- Add code chunks with explanatory markdown
- Generate visualizations to illustrate concepts
- Run `renv::snapshot()` after installing new packages to update the lockfile
