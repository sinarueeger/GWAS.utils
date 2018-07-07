
#' Effective number of tests
#'
#' Calculates the effective number of tests performed in a GWAS, given the LD structure among the SNPs. SNPs that are highly correlated are not counted twice.
#'
#' @param mat matrix, either individual by SNP data, or correlation matrix of SNPs
#' @param cor.true indicates if option mat is a correlation matrix or not
#'
#' @return zhc.correction number of effective tests
#' @export
#'
#' @examples
#'
#' require(tidyverse)
#' dat.sim <- tibble::tibble(g = rnorm(100)) %>% mutate(g2 = g*2)
#' eff_nbr_tests(diag(10), cor.true = TRUE) ## 10, cause all independent
#' eff_nbr_tests(dat.sim, cor.true = FALSE)

eff_nbr_tests <- function(mat, cor.true = FALSE)
{
    if(!cor.true)
    {
        cor.mat <- cor(mat, use = 'pairwise.complete.obs')
    }else{
        cor.mat <- mat
    }
    cor.mat[which(is.na(cor.mat))] <- 0
    svd.data <- svd(cor.mat)
    sum.tp         <- 0
    zhc.correction <- 0
    while (sum.tp/sum(svd.data$d) < 0.995)
    {
        zhc.correction     <- zhc.correction+1
        sum.tp <- sum.tp+svd.data$d[zhc.correction]
    }
    return(zhc.correction)
}


#library(tidyverse)
#dat.sim <- tibble::tibble(g = rnorm(100)) %>% mutate(g2 = g*2)

#test_that("effective number of tests", {
#  expect_equal(f.eff.number.tests(diag(2), cor.true = TRUE), 2)
#  expect_equal(f.eff.number.tests(diag(10), cor.true = TRUE), 10)
#  expect_equal(f.eff.number.tests(dat.sim, cor.true = FALSE), 1)
#})

# ## parallelised version, when HUGE matrix, but not tested
# ## ----------------------------------------------------
#
# f.eff.number.tests.parallel <- function(mat, cores = 1)
# {
#     step <- trunc(ncol(mat)/cores)
#     ind <- seq(0, ncol(mat), by = step)
#     theo.mat <- matrix(NA, ncol = length(ind) - 1, nrow = length(ind) - 1)
#     ind.theo.mat <- which(is.na(theo.mat), arr.ind = TRUE)
#     ind.theo.mat <- ind.theo.mat[ which(ind.theo.mat[,2] >= ind.theo.mat[,1]),]
#
#     cor.mat <- matrix(NA, ncol = ncol(mat), nrow = ncol(mat))
#
#     cor.tmp <- mclapply(1:nrow(ind.theo.mat), function(x)
#                     {
#                         fromto.row <- (ind[ind.theo.mat[x,1]]+1):ind[ind.theo.mat[x,1]+1]
#                         fromto.col <- (ind[ind.theo.mat[x,2]]+1):ind[ind.theo.mat[x,2]+1]
#                         cor(mat[, fromto.row], mat[,fromto.col], use = 'pairwise.complete.obs')
#
#                     }
#                         , mc.cores = cores)
#
#
#     for (x in 1:nrow(ind.theo.mat))
#     {
#         fromto.row <- (ind[ind.theo.mat[x,1]]+1):ind[ind.theo.mat[x,1]+1]
#         fromto.col <- (ind[ind.theo.mat[x,2]]+1):ind[ind.theo.mat[x,2]+1]
#         cor.mat[fromto.row, fromto.col] <- cor.tmp[[x]]
#         cor.mat[fromto.col, fromto.row] <- t(cor.tmp[[x]])
#     }
#
#
#     cor.mat[which(is.na(cor.mat))] <- 0
#     svd.data <- svd(cor.mat)
#     sum.tp         <- 0
#     zhc.correction <- 0
#     while (sum.tp/sum(svd.data$d) < 0.995)
#     {
#         zhc.correction     <- zhc.correction+1
#         sum.tp <- sum.tp+svd.data$d[zhc.correction]
#     }
#     return(zhc.correction)
# }

## library(parallel)
## n = 100
## N = 1000
## dat <- matrix(rnorm(N * n), nrow = n, ncol = N)
## system.time(tmp1 <- f.eff.number.tests.parallel(dat, cores = 5))
## tmp1
## system.time(tmp2 <- f.eff.number.tests.parallel(dat, cores = 1))
## tmp2
## system.time(tmp2 <- f.eff.number.tests(dat))
## tmp2

## alpha.new <- 0.05/zhc.correction

#(aurelien) I think that mean.zhc.slid.win is my matrix of data, and I calculate the correlation matrix, then I do the single value decomposition.
#After that in a while loop, I sum the variance until it explains 99.5% of the signal, the value of the index when I exit the while loop will be my effective number of test.



## ---------------------------------------------------------------

## effective number of tests
## -----------------------------

#Aurelien:I finally find the paper (I was not looking in the right mailbox…)
#So here is the link to the paper: http://www.ncbi.nlm.nih.gov/pubmed/18271029
#I am not sure that Zoltan sent me some R code, but I retrieve the small one I wrote:
#load("/home/sina/projects/projectPsycolaus/report/report_200Genes/history.RData")

## from
## http://stackoverflow.com/questions/5888287/running-cor-or-any-variant-over-a-sparse-matrix-in-r

#mat <- snps.na.num
## eff.number.tests


