
# GWAS.utils

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/sinarueeger/GWAS.utils.svg?branch=master)](https://travis-ci.org/sinarueeger/GWAS.utils)
[![Codecov test coverage](https://codecov.io/gh/sinarueeger/GWAS.utils/branch/master/graph/badge.svg)](https://codecov.io/gh/sinarueeger/GWAS.utils?branch=master)
[![DOI](https://zenodo.org/badge/140065340.svg)](https://zenodo.org/badge/latestdoi/140065340)
<!-- badges: end -->
  
`GWAS.utils` is an R package with basic helper functions for manipulating GWAS data, including two GWAS datasets. 

To get started, please refer to this [vignette](https://sinarueeger.github.io/GWAS.utils/articles/gwas-utils-package.html).

## Install

```
remotes::install_github("sinarueeger/GWAS.utils")
```




Install including vignettes: 

```
remotes::install_github("sinarueeger/GWAS.utils", build = TRUE, 
build_opts = c("--no-resave-data", "--no-manual"))

vignette("gwas-utils-package")
```

Note: The vignette needs to have the `Rmpfr` package installed. Use an [old version](https://stackoverflow.com/a/48784649/11256920) if you have not updated R in a while.

## Usage

There are six functions: 

- `eaf2maf(eaf = eaf_vec)`: Transforms effect allele frequencies into minor allele frequencies. 

- `inv_normal(x = vec)`: Inverse normal transformation of a variable.

- `z2p(z = z_vec)`: Transforms Z-statistics to P-values, includes an option for very large Z-statistics. 

- `eff_nbr_tests(mat = genotype_df)`: Calculates the effective number of tests of a GWAS, based on the correlation between the SNPs. 

- `QQplot(p = p_vec)`: Q-Q-plot of P-values (uniformly distributed under the null). 

- `genomic_inflation(Z = z_vec)`: Calculates genomic inflation, with either P-values or Z-statistics. 
Most of the functions are just handy and trivial helper functions. For `QQplot()` and `genomic_inflation()` there are a number of other packages with similar functions, e.g. `GenABEL` or `qqman`. Our `genomic_inflation` function takes two types of summary statistics as input by making an assumption about the P-value origin. And `QQplot` can inlcude the number of effective tests. 


And two datasets:

- `giant`: _Summary statistics_ of 10'000 SNPs from a GWAS in human body height.
- `opensnp` data: _Genotype data_ and human body height of 784 individuals from the publicly accessible [openSNP database](http://opensnp.org/snps). 


## Contributing

Please note that the 'GWAS.utils' project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms.
