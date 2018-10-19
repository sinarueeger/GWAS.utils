## ---------------------------------------------------------------
## Setup for R
## --------------------------------------------------------------
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Welcome to my package")
}

.onLoad <- function(libname, pkgname) {
  library(devtools)
  library(tidyverse)
  library(testthat)
  library(forcats)
  library(gridExtra) ## for grid.arrange(plot1, plot2, ncol=2)
  library(ggrepel) ## repelling text annotation
  library(RColorBrewer)
  library(parallel) ## parallel computing >> better to use arrays though

#  theme_set(theme_sina())



  ## colors
  ## ---------

  col.green <- "#4daf4a"
  col.blue <- "#377eb8"
  col.red <- "#e41a1c"
  col.gray <- gray(0.3)


  invisible()
}
