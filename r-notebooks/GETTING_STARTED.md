# Getting Started with Bayesian Decision Theory Tutorials

This guide will help you set up your environment and run the tutorials successfully.

## Prerequisites Checklist

Before starting, ensure you have:

- [ ] **R** (version 4.3.0 or higher)
  - Check: Run `R --version` in terminal
  - Install: https://cran.r-project.org/

- [ ] **Quarto** (latest version)
  - Check: Run `quarto --version` in terminal
  - Install: `brew install quarto` (macOS) or https://quarto.org

- [ ] **RStudio** (optional but recommended)
  - Download: https://posit.co/download/rstudio-desktop/

## Step-by-Step Setup

### Step 1: Navigate to the Directory

```bash
cd path/to/ds-projects/r-notebooks
```

### Step 2: Run the Setup Script

This is the **easiest method** and handles everything automatically:

```bash
Rscript setup_renv.R
```

**What this does:**
1. Installs `renv` if needed
2. Initializes the renv environment
3. Installs all required R packages
4. Creates a project-specific library
5. Takes a snapshot of dependencies

**Expected output:**
```
Setting up renv environment for Bayesian Decision Theory tutorials...
Installing renv...
Initializing renv project...
Installing required packages...
Installing ggplot2...
Installing dplyr...
...
✓ Setup complete!
```

**Time required:** 5-15 minutes (depending on your system and internet connection)

### Step 3: Verify the Installation

Open R in the `r-notebooks` directory:

```bash
R
```

Then run:

```r
# Check renv is active
renv::status()

# Load key packages to verify installation
library(ggplot2)
library(dplyr)
library(MASS)
library(mvtnorm)
library(lightgbm)  # This is the most likely to have issues

# If all load without errors, you're ready!
```

### Step 4: Render Your First Tutorial

**Option A: Command Line**
```bash
quarto render 01_bayesian_decision_theory.qmd
open 01_bayesian_decision_theory.html
```

**Option B: RStudio**
1. Open `01_bayesian_decision_theory.qmd` in RStudio
2. Click the "Render" button (or press Cmd/Ctrl + Shift + K)
3. The HTML output will open automatically

## Tutorial Progression

Work through the tutorials in order:

1. **01_bayesian_decision_theory.qmd** (Start here!)
   - Foundations of decision theory
   - Univariate examples
   - ~30 minutes to complete

2. **02_multivariate_bayesian_decision_theory.qmd**
   - Multivariate extensions
   - Healthcare applications
   - ~45 minutes to complete

3. **03_ml_bayesian_decision_theory.qmd** (Most advanced)
   - Machine learning integration
   - LightGBM examples
   - ~60 minutes to complete

## Common Issues and Solutions

### Issue 1: lightgbm Won't Install

**Symptoms:** Error messages during `lightgbm` installation

**Solution (macOS):**
```bash
# Install dependencies first
brew install cmake libomp

# Then try installing lightgbm again
R
> install.packages("lightgbm")
```

**Solution (Linux):**
```bash
sudo apt-get install cmake libboost-dev libboost-system-dev
R
> install.packages("lightgbm")
```

**Workaround:** If installation continues to fail:
- Run Tutorials 01 and 02 (they don't need lightgbm)
- Consider using XGBoost as an alternative (see note below)

### Issue 2: renv Doesn't Activate

**Symptoms:** Packages aren't found, or you see "package not installed" errors

**Solution:**
```r
# Manually activate renv
source("renv/activate.R")

# Restore packages
renv::restore()
```

### Issue 3: Out of Memory Errors

**Symptoms:** R crashes or reports memory errors

**Solution:**
Reduce the dataset sizes in code chunks. For example, in Tutorial 03:
```r
# Change this:
n_samples <- 5000

# To this:
n_samples <- 1000
```

### Issue 4: Quarto Command Not Found

**Symptoms:** `quarto: command not found`

**Solution:**
```bash
# macOS
brew install quarto

# Or download installer
# Visit: https://quarto.org/docs/get-started/
```

## Alternative: Using XGBoost Instead of LightGBM

If you can't get `lightgbm` working, you can modify Tutorial 03 to use `xgboost`:

```r
# Install xgboost
install.packages("xgboost")

# In the tutorial, replace lightgbm code with:
library(xgboost)

# Convert data
dtrain <- xgb.DMatrix(data = train_matrix, label = train_label)

# Train model
xgb_model <- xgboost(
  data = dtrain,
  max_depth = 6,
  eta = 0.05,
  nrounds = 200,
  objective = "binary:logistic",
  eval_metric = "auc"
)

# Predictions
test_pred <- predict(xgb_model, test_matrix)
```

## Using the Tutorials

### Interactive Exploration

**In RStudio:**
1. Open a `.qmd` file
2. Run chunks individually with Cmd/Ctrl + Shift + Enter
3. Modify parameters and re-run to explore
4. Render the full document when ready

**In R Console:**
```r
# Extract and run code from chunks
knitr::purl("01_bayesian_decision_theory.qmd", output = "extracted_code.R")
source("extracted_code.R")
```

### Customization Tips

- **Modify sample sizes:** Change `n_samples` to run faster
- **Try different parameters:** Adjust loss matrices, priors, etc.
- **Add your own examples:** Copy existing code chunks as templates
- **Export results:** Use `ggsave()` to save plots

### Rendering Options

```bash
# HTML (default, best for viewing)
quarto render tutorial.qmd

# PDF (requires LaTeX installation)
quarto render tutorial.qmd --to pdf

# Word document (great for reports)
quarto render tutorial.qmd --to docx

# Live preview (auto-refreshes on save)
quarto preview tutorial.qmd
```

## Understanding renv

### What is renv?

`renv` creates an isolated, reproducible R environment for this project:
- Packages are installed in `r-notebooks/renv/library/`
- Your global R packages are not affected
- `renv.lock` tracks exact package versions
- Anyone can recreate the exact environment

### Useful renv Commands

```r
# Check environment status
renv::status()

# Install a new package
install.packages("new_package")
renv::snapshot()  # Save to renv.lock

# Update all packages
renv::update()

# Reset to lockfile state
renv::restore()

# Deactivate renv (use global packages)
renv::deactivate()

# Reactivate renv
renv::activate()
```

## Getting Help

### Within the Tutorials

Each tutorial includes:
- **Callout boxes** with setup instructions
- **Code comments** explaining each step
- **Mathematical notation** for theory
- **Visualizations** to aid understanding

### External Resources

- **Quarto Documentation**: https://quarto.org/docs/guide/
- **renv Documentation**: https://rstudio.github.io/renv/
- **LightGBM R Documentation**: https://lightgbm.readthedocs.io/en/latest/R/
- **ggplot2 Documentation**: https://ggplot2.tidyverse.org/

### Troubleshooting

If you encounter issues:
1. Check the **Troubleshooting** section in `README.md`
2. Review this guide's **Common Issues** section
3. Run `renv::diagnostics()` to check for environment issues
4. Ensure all prerequisites are installed correctly

## Quick Reference

### File Structure
```
r-notebooks/
├── .Rprofile                    # Auto-activates renv
├── setup_renv.R                 # Setup script (run once)
├── renv.lock                    # Package versions
├── 01_bayesian_decision_theory.qmd
├── 02_multivariate_bayesian_decision_theory.qmd
├── 03_ml_bayesian_decision_theory.qmd
├── README.md                    # Detailed documentation
└── GETTING_STARTED.md          # This file
```

### Workflow Summary

```bash
# One-time setup
cd r-notebooks
Rscript setup_renv.R

# Regular usage
quarto render 01_bayesian_decision_theory.qmd
open 01_bayesian_decision_theory.html

# Or use RStudio with the Render button
```

## Success Checklist

You're ready to go when:

- [ ] `Rscript setup_renv.R` completes without errors
- [ ] `renv::status()` shows "The project is synchronized"
- [ ] All libraries load: `ggplot2`, `dplyr`, `MASS`, `mvtnorm`, `lightgbm`
- [ ] Tutorial 01 renders successfully to HTML
- [ ] Plots display correctly in the rendered document

## Next Steps

1. **Start with Tutorial 01**: Foundation concepts
2. **Experiment**: Modify parameters and re-run
3. **Progress to Tutorial 02**: Multivariate methods
4. **Tackle Tutorial 03**: ML + Decision Theory
5. **Apply to your work**: Use the frameworks in real projects

Enjoy the tutorials! 🎉
