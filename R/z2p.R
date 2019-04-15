



#' Transforms Z-statistic into P-value
#'
#' Takes Z-statistic(s) as input and outputs P-value(s). This function works
#' for absolute Z-statistics up to x
#'
#' @param Z Z-statistic, numeric vector.
#' @param method \code{"prnorm"} (default), \code{"Rmpfr::pnorm"} (from the
#' Rmpfr package)
#'
#' @return P P-value, same length as Z.
#' @export
#' @importFrom stats pnorm
#'
#' @details The usual P value calculation for |Z|-statistics < 38 is
#' \code{pnorm(abs(Z), lower.tail = FALSE) * 2} or,
#' alternatively,
#' \code{exp(pnorm(abs(Z), log.p = TRUE, lower.tail = FALSE)) * 2}.
#' For anything that is larger, we can use the R package \code{Rmpfr::pnorm}
#' that helps us with small digits.
#'
#' @references See also this post:
#' \url{https://stackoverflow.com/questions/46416027/how-to-compute-p-values-from-z-scores-in-r-when-the-z-score-is-large-pvalue-muc}
#'
#' @examples
#' z2p(c(-1.959964, 1.96))
#' z2p(20)
#' z2p(20, method = "Rmpfr::pnorm")
#' z2p(200, method = "pnorm") # the default
#' z2p(200, method = "Rmpfr::pnorm")
z2p <- function(Z, method = c("pnorm")) {
  if (any(is.infinite(Z))) {
    warning(
      "The 'Z' vector contains infinite values. These will be turned into NAs, because no meaninful P value can be calculated from that."
    )
    is.na(Z) <- is.infinite(Z)
  }

  if (method == "pnorm") {
    P <- exp(pnorm(abs(Z), log.p = TRUE, lower.tail = FALSE)) * 2

    if (any(P == 0, na.rm = TRUE)) {
      message("Some P-values are equal to 0. Try using the option method = 'Rmpfr::pnorm'")
    }
  }

  if (method == "Rmpfr::pnorm") {
    ## from https://stackoverflow.com/questions/46416027/how-to-compute-p-values-from-z-scores-in-r-when-the-z-score-is-large-pvalue-muc
    message("using method Rmpfr::")

    ## remove all NAs
    P <- Rmpfr::mpfr(abs(Z), precBits = 100)

    P[!is.na(Z)] <- 2 * Rmpfr::pnorm(Rmpfr::mpfr(abs(Z[!is.na(Z)]),
      precBits = 100
    ),
    lower.tail = FALSE, log.p = FALSE
    )
  }

  return(P)
}
