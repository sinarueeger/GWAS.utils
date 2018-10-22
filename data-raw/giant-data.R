## Data source: GIANT summary statistics on Meta GWAS on height
## https://portals.broadinstitute.org/collaboration/giant/index.php/GIANT_consortium_data_files#2018_GIANT_and_UK_BioBank_Meta_Analysis_for_Public_Release

## Data download --------------------------------------------------------------

path.data <- here::here("data-raw")
system(glue::glue("wget https://portals.broadinstitute.org/collaboration/giant/images/c/c8/Meta-analysis_Locke_et_al%2BUKBiobank_2018_UPDATED.txt.gz?download=1 -O {path.data}/Meta-analysis_Locke_et_al%2BUKBiobank_2018_UPDATED.txt.gz"))
system(glue::glue("gunzip {path.data}/Meta-analysis_Locke_et_al%2BUKBiobank_2018_UPDATED.txt.gz"))

## There is only one text file.
## The README states the following (https://portals.broadinstitute.org/collaboration/giant/images/0/01/README_summary_statistics_Yengo_et_al_2018.txt)
## This describes the columns of the summary statistics generated in Yengo et al. (2018)
## Meta-analysis of genome-wide association studies for height and body mass index in ~700,000 individuals of European ancestry

# ----------------------
#   Columns description
# ----------------------
#
# SNP:                        RS ID
# CHR:                        Chromosome
# POS:                        Physical position (Genome build hg19)
# Tested_Allele:              Allele corresponding to the effect size (BETA/BETA_COJO)
# Other_Allele:               Other allele
# Freq_Tested_Allele_in_HRS:  Frequency of the tested allele in the Health and Retirement Study (from 8,552 unrelated participants).
# BETA:                       Marginal SNP effect size.
# SE:                         Standard error of the effect size.
# P:                          P-value measuring the significance of the marginal effect.
# N:                          Sample size.
# BETA_COJO:                  Conditional effect size from the software GCTA version 1.9 using HRS as linkage disequilibrium panel.
# SE_COJO:                    Standard error of the conditional effect size.
# P_COJO:                     P-value measuring the significance of the conditional effect.

## Data preprocessing --------------------------------------------------------------

## 1. select a subset of rows (= SNPs)
## 2. select a set of columns
## 3. store

## select a random subset of SNPs
set.seed(3)
n.sample <- 1e4
dat.giant <- readr::read_tsv(glue::glue("{path.data}/Meta-analysis_Locke_et_al%2BUKBiobank_2018_UPDATED.txt"))
dat.giant <- dat.giant %>%  sample_n(n.sample)

## select a set of columns
giant <- dat.giant %>% select(-contains("COJO")) %>% ## we don't want the COJO summary stats
  ##  and all to lowercase

## Now we can store everything in the data folder.
devtools::use_data(giant, compress = "xz", overwrite = T)
