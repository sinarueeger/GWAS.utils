
# GWAS.utils

R package with basic helper functions for GWAS data. 

## Installation

```
# install.packages("devtools")
devtools::install_github("sinarueeger/GWAS.utils", ref = "personalised-for-sina")
```

## Functionality

There are currenlty five functions: 

- `eaf2maf`: Transforms effect allele frequencies into minor allele frequencies. Input: numeric vector, output: numeric vector. 
- `QQplot`: Q-Q-plot of P-values (uniformly distributed under the null). Input: numeric vector, output: base plot. 
- `z2p`: Transforms Z-statistics to P-values, includes an option for very large Z-statistics. Input: numeric vector, output: numeric vector. 
- `eff_nbr_tests`: Calculates the effective number of tests of a GWAS, based on the correlation between the SNPs. Input: genotype data or correlation matrix, output: effective number of tests. 
- `inv_normal`: Inverse normal transformation of a variable. Input: numeric vector, output: numeric vector.
