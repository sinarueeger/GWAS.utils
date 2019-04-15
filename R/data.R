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
#' Data: \url{https://portals.broadinstitute.org/collaboration/giant/images/c/c8/Meta-analysis_Locke_et_al\%2BUKBiobank_2018_UPDATED.txt.gz}
#' Data description: \url{https://portals.broadinstitute.org/collaboration/giant/images/0/01/README_summary_statistics_Yengo_et_al_2018.txt}
#' Manuscript: Yengo et al. (2018) \url{https://www.biorxiv.org/content/early/2018/03/22/274654}
"giant"


#' openSNP data
#'
#'
#'
#' @format The data set contains 23 variables of 784 individuals. Twenty-one of these variables represent minor allele counts of SNPs, where the name is a combination of SNP identifier and the minor allele.
#' \describe{
#' \item{\code{id}}{Personal identifier}
#' \item{\code{height}}{Human height in cm}
#' \item{\code{rs1985272_C}}{Minor allele counts for SNP identifier rs1985272, minor allele: C.}
#' \item{\code{...}}{}
#' \item{\code{rs10489858_C}}{Minor allele counts for SNP identifier rs10489858, minor allele: C.}

#' }
#'
#' @details Minor allele count per person is the number of minor allele an individual carries, possible values are 0, 1 and 2. For example, for variable \code{rs1985272_C} the minor allele of SNP id rs1985272 is C. In this case, an entry of 0 means that this
#' individual has no minor allele C, 1 means this individual has one minor allele C, and 2 means this person has two copies of the minor allele C.
#' @source
#' Data : CrowdAI / OpenSNP - height prediction challenge by Oliver Naret, \url{https://zenodo.org/record/1442755#.W9LfWSexVOE}
#' Manuscript:
#' openSNP: \url{https://opensnp.org/} and Greshake B, Bayer PE, Rausch H, Reda J (2014) openSNP<U+2013>A Crowdsourced Web Resource for Personal Genomics. PLOS ONE 9(3): e89204. \url{https://doi.org/10.1371/journal.pone.0089204}
"opensnp"
