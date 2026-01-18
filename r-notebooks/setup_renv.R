#!/usr/bin/env Rscript
# Setup script to initialize renv environment for r-notebooks
# Run this once to set up the environment: Rscript setup_renv.R

cat("Setting up renv environment for Bayesian Decision Theory tutorials...\n\n")

# Check if renv is installed
if (!requireNamespace("renv", quietly = TRUE)) {
  cat("Installing renv...\n")
  install.packages("renv")
}

# Initialize renv (if not already initialized)
if (!file.exists("renv/activate.R")) {
  cat("Initializing renv project...\n")
  renv::init(bare = TRUE)
} else {
  cat("renv already initialized.\n")
}

# Install required packages
cat("\nInstalling required packages...\n")
packages <- c(
  # Data manipulation
  "dplyr",
  "tidyr",
  "reshape2",

  # Visualization
  "ggplot2",
  "gridExtra",

  # Statistical distributions
  "MASS",
  "mvtnorm",

  # Machine learning
  "lightgbm",
  "pROC",

  # Document generation
  "knitr",
  "rmarkdown"
)

for (pkg in packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    cat(sprintf("Installing %s...\n", pkg))
    install.packages(pkg, repos = "https://cloud.r-project.org")
  } else {
    cat(sprintf("%s already installed.\n", pkg))
  }
}

# Create snapshot
cat("\nCreating renv snapshot...\n")
renv::snapshot(prompt = FALSE)

cat("\n✓ Setup complete!\n")
cat("\nNext steps:\n")
cat("1. Open R/RStudio in this directory\n")
cat("2. renv should activate automatically\n")
cat("3. Open any .qmd file and render it\n")
cat("\nOr run: quarto render 01_bayesian_decision_theory.qmd\n")
