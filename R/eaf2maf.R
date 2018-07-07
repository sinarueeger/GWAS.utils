## EAF 2 MAF
## -------------

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
