
## inverse normal transformation
## -------------------------------
inv_normal <- function(x) qnorm((rank(x, na.last = "keep")-0.5)/sum(!is.na(x)))

#test_that("inv.normal of NA", {
##  expect_equal(is.na(f.inv.normal(NA)), TRUE)
#})

