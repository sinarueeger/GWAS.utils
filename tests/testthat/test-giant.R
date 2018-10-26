context("test-giant")

test_that("properties of giant dataset", {
  expect_equal(nrow(giant), 1e4)
  expect_equal(ncol(giant), 10)
  expect_equal(names(giant), c("CHR", "POS", "SNP", "Tested_Allele", "Other_Allele", "Freq_Tested_Allele_in_HRS",
                               "BETA", "SE", "P", "N"))
})
