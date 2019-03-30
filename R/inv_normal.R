#' Inverse normal transformation
#'
#' Transforms any variable into a standard normal distributed variable N(0,1).
#'
#' @param x numeric vector that needs to be transformed
#' @param const numeric value, 3/8 and 0.5 recommended.
#' @return Numeric vector of length(x) that is standard normally distributed
#' @export
#'
#' @references See also https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2921808/
#'
#' @examples
#' X <- runif(1000)
#' 
#' X.trans <- trans_inv_normal(X)
#' par(mfrow = c(1, 2))
#' hist(X)
#' hist(X.trans)
#' par(mfrow = c(1, 2))
#' qqnorm(X)
#' qqnorm(X.trans)
trans_inv_normal <- function(x, const = 3 / 8) {
  rank.x <- rank(x, na.last = "keep")
  N <- length(na.omit(x))
  qnorm((rank.x - const) / (N - 2 * const + 1))
}
