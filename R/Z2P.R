
f.Z2P <- function(x)
{
  exp(pnorm(abs(x),log.p=TRUE, lower = FALSE))*2
}
