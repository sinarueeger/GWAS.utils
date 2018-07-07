
## pretty QQ plot in GGPLOT
## --------------------------

qqplot_prep <- function(df, p = "p", thresh = 3)
{


  df <- df[order(df[,p], decreasing = TRUE),]
  N <- nrow(df)
  df$p0 <- sort(-log10((1:N)/N-1/(2*N)))
  df$p0.cat <- df$p0 > thresh

  return(df)
}
#ggplot(OUT)+geom_hex( aes(x = p0, y = -log10(P.imp)), bins = 50) + xlab("Expected -log10(P)") + ylab("Observed -log10(P)") +geom_abline(intercept = 0, slope = 1, linetype = 1)

