## ---------------------------------------------------------------
## Setup for R
## --------------------------------------------------------------
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Guete Morgä!")
}

## some packages that I want to have loaded all the time
.onLoad <- function(libname, pkgname) {
  library(devtools)
  library(tidyverse)
  library(testthat)
  library(glue)
  library(here)
  library(forcats)
  library(ggrepel) ## repelling text annotation
  library(RColorBrewer)
  library(parallel) ## parallel computing >> better to use arrays though
  library(styler)

#  theme_set(theme_sina())

  ## some default colors (from R color brewer (set1))
  col.green <- "#4daf4a"
  col.blue <- "#377eb8"
  col.red <- "#e41a1c"
  col.gray <- gray(0.3)


  invisible()
}
