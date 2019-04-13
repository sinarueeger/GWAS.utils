
#' Effective number of tests
#'
#' Calculates the effective number of tests performed in a GWAS, given the LD structure among the SNPs. SNPs that are highly correlated are not counted twice.
#'
#' @param mat matrix, either individual by SNPs (n x p) matrix, or correlation matrix between SNPs
#' @param cor.true indicates if option mat is a correlation matrix or not
#'
#' @return \code{zhc.correction} number of effective tests
#' @export
#' @importFrom stats cor
#'
#' @references Implemented from \link{https://www.ncbi.nlm.nih.gov/pubmed/18271029}
#'
#' @examples
#' dat.sim <- data.frame(g = rnorm(100)) %>% dplyr::mutate(g2 = g * 2)
#' eff_nbr_tests(diag(10), cor.true = TRUE) ## 10, because all are independent
#' eff_nbr_tests(dat.sim, cor.true = FALSE)
eff_nbr_tests <- function(mat, cor.true = FALSE) {
  if (!cor.true) {
    cor.mat <- cor(mat, use = "pairwise.complete.obs")
  } else {
    cor.mat <- mat
  }
  cor.mat[which(is.na(cor.mat))] <- 0
  svd.data <- svd(cor.mat)
  sum.tp <- 0
  zhc.correction <- 0
  while (sum.tp / sum(svd.data$d) < 0.995) {
    zhc.correction <- zhc.correction + 1
    sum.tp <- sum.tp + svd.data$d[zhc.correction]
  }
  return(zhc.correction)
}
