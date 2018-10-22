#' @importFrom tibble tibble
NULL

#' Height GWAS
#'
#' Associations between human body height and genetic markers.
#' This is a random selection of 10'000 SNPs from summary statistics produced by the manuscript of Yengo et al. (2018).
#'
#' @format The data set contains 10 variables:
#' \describe{
#' \item{\code{snp}}{SNP identifier}
#' \item{\code{chr}}{Chromosome}
#' \item{\code{pos}}{Physical position (Genome build hg19)}
#' \item{\code{tested_allele}}{Allele corresponding to the effect size \code{beta}}
#' \item{\code{other_allele}}{Other allele}
#' \item{\code{freq_tested_allele_hrs}}{Frequency of the tested allele in the Health and Retirement Study (from 8,552 unrelated participants).}
#' \item{\code{beta}}{(Marginal) effect size}
#' \item{\code{se}}{Standard error of the effect size}
#' \item{\code{p}}{P-value of the effect size}
#' \item{\code{n}}{Sample size}
#' }
#'
#' @details The summary statistics by running a genome-wide association study (GWAS) for
#'  height in ~700K individuals of European ancestry. Each line in the dataset corresponds
#'  to the association between height (transformed) as an outcome and one genetic marker
#'  (indicated in \code{snp}) plus covariates as predictors.
#'
#' @source
#' Data: \url{https://portals.broadinstitute.org/collaboration/giant/images/c/c8/Meta-analysis_Locke_et_al%2BUKBiobank_2018_UPDATED.txt.gz}
#' Data description: \url{https://portals.broadinstitute.org/collaboration/giant/images/0/01/README_summary_statistics_Yengo_et_al_2018.txt}
#' Manuscript: Yengo et al. (2018) \url{https://www.biorxiv.org/content/early/2018/03/22/274654}
"giant"


#' openSNP data
#'
#'
#'
#' @format The data set contains x variables:
#' \describe{
#' \item{\code{id}}{}
#' \item{\code{height}}{}
#' \item{\code{rs1}}{SNP1 ...}
#' }
#'
#' @details
#' @source
#' Data: \url{}
#' Data description: \url{}
#' Manuscript: \url{}
"opensnp"

