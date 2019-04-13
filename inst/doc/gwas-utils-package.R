## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup---------------------------------------------------------------
library(GWAS.utils)

## ------------------------------------------------------------------------
skimr::skim_with(factor = list(ordered = NULL))
skimr::skim(opensnp %>% dplyr::select(-id) %>% dplyr::mutate_at(dplyr::vars(dplyr::starts_with("rs")), as.factor))

## ------------------------------------------------------------------------
str(giant)

## ------------------------------------------------------------------------
eff_nbr_tests(mat = opensnp %>% dplyr::select(-id, -height))

## ---- fig.width = 8, fig.height = 4--------------------------------------
opensnp$height_tranformed <- GWAS.utils::trans_inv_normal(opensnp$height)
par(mfrow = c(1,2))

qqnorm(opensnp$height, main = "Untransformed height variable")
qqline(opensnp$height)
qqnorm(opensnp$height_tranformed, main = "Untransformed height variable")
qqline(opensnp$height_tranformed)

## or
X <- runif(1000)
X_transformed <- GWAS.utils::trans_inv_normal(runif(1000))
par(mfrow = c(1,2))
qqnorm(X, main = "Uniform distributed variable")
qqline(X)
qqnorm(X_transformed, main = "Transformed, formerly uniform distributed variable")
qqline(X_transformed)


## ------------------------------------------------------------------------
giant$maf <- eaf2maf(giant$Freq_Tested_Allele_in_HRS)
plot(giant$Freq_Tested_Allele_in_HRS, giant$maf)


## ------------------------------------------------------------------------
2 * pnorm(2, lower.tail= FALSE)

## ------------------------------------------------------------------------
pnorm(37, lower.tail= FALSE)
pnorm(38, lower.tail= FALSE)

## ------------------------------------------------------------------------
exp(pnorm(abs(38), log.p = TRUE, lower = FALSE)) * 2
exp(pnorm(abs(39), log.p = TRUE, lower = FALSE)) * 2

## ------------------------------------------------------------------------
z2p(39)
z2p(39,  method = c("Rmpfr::pnorm"))

## ---- fig.width = 4, fig.height = 4--------------------------------------
giant$P_z2p_function <- z2p(giant$BETA/giant$SE, method = c("Rmpfr::pnorm"))
plot(-log10(giant$P), -log10(giant$P_z2p_function), main = "Comparison of kown P-value with the\ncalculated P-value through z2p()", ylab = "P_z2p_function", xlab = "P")
abline(a = 0, b = 1)

## ---- fig.show='hold', fig.width = 4, fig.height = 4---------------------
QQplot(giant$P, main = "Random sample of 10K SNPs from\nGIANT height summary statistics")

## ------------------------------------------------------------------------
## use with Z-statistics
genomic_inflation(Z = giant$BETA/giant$SE)

## or use with P-value
genomic_inflation(P = giant$P)

