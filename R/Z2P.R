

#' Transform Z-statistic into P-value
#'
#' Transforms Z-statistic into P-value. Works for large Z-statistics too.
#'
#' @param Z Z-statistic (neg or pos), numeric vector of length 1 or longer.
#'
#' @return P P-value, same length as Z.
#' @export
#'
#' @examples
#' Z2P(-1.959964)
#' Z2P(20)
#'
Z2P <- function(Z)
{
  P <- exp(pnorm(abs(Z),log.p=TRUE, lower = FALSE))*2
  return(P)
}
