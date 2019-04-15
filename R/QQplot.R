

#' Pretty Q-Q-plot for P values
#'
#' Creates a QQplot, given P-values, which should be uniformly distributed
#'
#' @param p numeric vector, values between 0 and 1.
#' @param neff number of effective tests,
#' see function \code{\link{eff_nbr_tests}}
#' @param main Main title
#' @param col color code
#' @param add logic, added to plot or not
#' @param ... pass plot arguments on
#'
#' @return plot (base)
#' @export
#' @importFrom grDevices gray
#' @importFrom graphics lines
#' @importFrom graphics plot
#' @importFrom graphics points
#'
#' @seealso \url{https://github.com/sinarueeger/ggGWAS} (in development)
#' and \code{\link[qqman]{qq}}
#' @examples
#'
#' QQplot(runif(100))
#' QQplot(runif(100), main = "This is the main title")
#' QQplot(runif(100), add = TRUE, col = "green")
QQplot <-
  function(p,
             neff = NULL,
             main = "QQplot",
             col = "black",
             add = FALSE,
             ...) {
    p <- p[!is.na(p)]
    N <- length(p)

    if (is.null(neff)) {
      p0 <- sort(-log10((1:N) / N - 1 / (2 * N)))
      col <-
        ifelse(length(col) > 1, order(-log10((1:N) / N - 1 / (2 * N))), col)
    } else {
      p0.tmp <- seq(1 / neff, 1, length.out = N)
      p0 <- sort(-log10(p0.tmp))
      col <- ifelse(length(col) > 1, order(-log10(p0.tmp)), col)
    }

    if (add) {
      points(p0, sort(-log10(p)), col = col, pch = 16, ...)
    } else {
      plot(
        p0,
        sort(-log10(p)),
        col = col,
        pch = 16,
        xlab = "Expected -log10(P)",
        ylab = "Observed -log10(P)",
        main = main,
        las = 1,
        ...
      )
    }

    lines(-log10(p0),
      -log10(p0),
      type = "l",
      col = gray(0.3)
    )
  }
