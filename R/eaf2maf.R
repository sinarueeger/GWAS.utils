## EAF 2 MAF
## -------------

#' Transforms EAF to MAF
#' Turns effect allele frequency (between 0 and 1) into minor allele frequency (between 0 and 0.5)
#'
#'
#' @param eaf effect allele frequecy, numeric between 0 and 1.
#'
#' @return P
#' @export
#'
#' @examples
#' eaf2maf(0.7)
#'
eaf2maf <- function(eaf)
{
  maf <- eaf #rep(length(eaf))
  ind <- which(eaf >= 0.5)
  maf[ind] <- 1-eaf[ind]
  return(maf)
}

#test_that("Testing EAF > MAF", {
#  expect_equal(f.eaf2maf(0.5), 0.5)
#  expect_equal(f.eaf2maf(0), 0)
#  expect_equal(f.eaf2maf(1), 0)
#  expect_equal(f.eaf2maf(0.51), 0.49)
#})
