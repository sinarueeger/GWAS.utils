#' Inverse normal transformation
#'
#' Transforms any variable into a standard normal distributed variable N(0,1).
#'
#' @param x numeric
#'
#' @return x.trans standard normal distributed
#' @export
#'
#' @examples
#' X <- runif(1000)
#'
#' X.trans <- inv_normal(X)
#' par(mfrow = c(1,2))
#' hist(X)
#' hist(X.trans)

inv_normal <- function(x)
  {

  x.trans <- qnorm((rank(x, na.last = "keep")-0.5)/sum(!is.na(x)))
  return(x.trans)
  }

#test_that("inv.normal of NA", {
##  expect_equal(is.na(f.inv.normal(NA)), TRUE)
#})

