## ---------------------------------------------------------------
## Setup for R
## --------------------------------------------------------------
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Hello!")
}

## some packages that I want to have loaded all the time
.onLoad <- function(libname, pkgname) {

  pkgs <- c("devtools", "testthat", "glue", "here", "ggrepel", "RColorBrewer", "parallel", "styler",
            "ggplot2", "dplyr", "readr", "tidyr", "purrr", "tibble", "stringr", "forcats", "namer")
  lapply(pkgs, function(x) suppressPackageStartupMessages(library(x, character.only = TRUE)))


  theme_set(theme_bw())

  ## some default colors (from R color brewer (set1))
  col.green <- "#4daf4a"
  col.blue <- "#377eb8"
  col.red <- "#e41a1c"
  col.gray <- grDevices::gray(0.3)


  invisible()
}
