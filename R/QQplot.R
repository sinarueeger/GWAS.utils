

## pretty QQ plot
## --------------------------

QQplot <- function(p, neff = NULL, main = "", col = "black", add = FALSE, ...) {
  p <- p[!is.na(p)]
  N <- length(p)

  if (is.null(neff))
  {
      p0 <- sort(-log10((1:N)/N-1/(2*N)))
      col <- ifelse(length(col) > 1, order(-log10((1:N)/N-1/(2*N))), col)

  }else
  {
      p0.tmp <- seq(1/neff, 1, length.out = N)
      p0 <- sort(-log10(p0.tmp))
      col <- ifelse(length(col) > 1, order(-log10(p0.tmp)), col)
  }

  if(add)
  {
      points(p0,sort(-log10(p)),col=col, pch=16, ...)
  }else{
      plot(p0,sort(-log10(p)),col=col, pch=16,xlab="Expected -log10(P)",ylab="Observed -log10(P)",
  main = main, las = 1, ...)
  }

  lines(-log10(p0),-log10(p0),type="l",col=gray(0.3))
}

