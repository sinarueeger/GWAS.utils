## Data source: openSNP data
## Some of the openSNP data has been made ready for
## direct download on zenondo (https://zenodo.org/record/1442755#.W7SyBVJ9jUI)
## and we will use this data for our examples.

## Original R code from https://github.com/sinarueeger/create-data-workflow-example


## Data download --------------------------------------------------------------

## First, we need to download the OpenSNP and unzip the file.

path.data <- here::here("data-raw")
system(glue::glue("wget https://zenodo.org/record/1442755/files/CrowdAI_v3.tar.gz?download=1 -O {path.data}/CrowdAI_v3.tar.gz"))
system("tar -xzf {path.data}/CrowdAI_v3.tar.gz")


## check-out the folder-structure of the downloaded data

cat(
  system(
    glue::glue(
      "tree {path.data}/CrowdAI_v3"),
    intern = TRUE),
  sep = "\n"
)


## What we need from here are the files that are for `training` only, thats 785 individuals.
##  - `subset/genotyping_data_subset_training.vcf` and : genotype information for height associated SNPs for all individuals
## - `training_set_details.txt`: phenotype information for all individuals (test and training set)


## Data preprocessing --------------------------------------------------------------

## 1. for a selection of genotypes: turn vcf to ped dosages, select only a subset of SNPs (there are hundereds of thousands of SNPs in total)
## 2. merge phenotype and genotype data into a txt file and store it into the data folder.

## Genotype data

## the snps we select are in two regions, around one of the top SNPs associated with height:
## info from here: Supp table 2 (https://www.nature.com/articles/ng.3097#s2)
## vcf to ped, you will need to use plink for this
path.gt <- here::here("data","CrowdAI_v3","subset")
path.out <- here::here("data")
system(glue::glue("./bin/plink --vcf {path.gt}/genotyping_data_subset_train.vcf
                  --recodeAD --out {path.out}/genotyping_data_subset_train
                  --chr 1 --from-kb 15000 --to-kb 20000 "))

## this will generate plenty of files, but we only need the *ped extension.
## system(glue::glue("rm {path.out}/*ped"))
## system(glue::glue("rm {path.out}/*map"))

system(glue::glue("rm {path.out}/*fam"))
system(glue::glue("rm {path.out}/*log"))
system(glue::glue("rm {path.out}/*nosex"))
system(glue::glue("rm {path.out}/*bed"))
system(glue::glue("rm {path.out}/*bim"))

## import and look at genotype data
dat.geno <- readr::read_delim(glue::glue("{path.pheno}/.ped"), delim = " ")

## description of the file...

## prepare phenotype data
path.pheno <- here::here("data","CrowdAI_v3")
dat.pheno <- readr::read_delim(glue::glue("{path.pheno}/training_set_details.txt"), delim = " ")

## merge genotype and phenotype data
opensnp <-

## Now we can store everything in the data folder.
devtools::use_data(opensnp, compress = "xz", overwrite = T)
