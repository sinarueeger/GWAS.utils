
# GWAS.utils 🚧

R package with basic helper functions for GWAS data. 

## Installation

```
# install.packages("devtools")
devtools::install_github("sinarueeger/GWAS.utils")
```

## Functionality

There are currenlty five functions: 

- `eaf2maf`: Transforms effect allele frequencies into minor allele frequencies. 
  
  *Input* ➡️ : numeric vector
  
  *Output* 🔙 : numeric vector. 
  
- `QQplot`: Q-Q-plot of P-values (uniformly distributed under the null). 
  
  *Input* ➡️ : numeric vector
  
  *Output*: base plot. 

- `z2p`: Transforms Z-statistics to P-values, includes an option for very large Z-statistics. 

  *Input* ➡️ : numeric vector

  *Output* 🔙 : numeric vector. 

- `eff_nbr_tests`: Calculates the effective number of tests of a GWAS, based on the correlation between the SNPs. 
  
  *Input* ➡️ : genotype data or correlation matrix
  
  *Output* 🔙 : effective number of tests. 
  
- `genomic_inflation`: Calculates the genomic inflation factor of GWAS summary statistics.
  
  *Input* ➡️ : Z-statistics vector or P-value vector
  
  *Output* 🔙 : Genomic inflation factor
  

- `inv_normal`: Inverse normal transformation of a variable.

  *Input* ➡️ : numeric vector

  *Output* 🔙 : numeric vector.
