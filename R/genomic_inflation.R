

#' Genomic inflation factor
#'
#' @param Z Numeric vector of arbitrary length. Z-statistics (sign does not matter)
#' @param P Numeric vector of arbitrary length. Alternatively, the P-values can be provided, which will be transformed into Z-statistics
#'
#' @return value
#' @export
#' @importFrom stats qchisq
#' @importFrom stats median
#' @importFrom stats qnorm
#'
#' @examples
#'
#' ## data("giant")
#' genomic_inflation(Z = giant$BETA / giant$SE)
#' ## should give the same as
#' genomic_inflation(P = giant$P)
genomic_inflation <- function(Z = NULL, P = NULL) {
  if (is.null(Z) & !is.null(P)) {
    Z <- qnorm(P / 2) ## because Z is squared after we don't care about the sign
  }

  if (is.null(Z) & is.null(P)) {
    stop("You have to pass on Z or P.")
  }

  lambda <- median(Z^2) / qchisq(0.5, 1)
  return(lambda)
}
