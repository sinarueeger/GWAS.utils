geno.mat <- tibble::tibble(g = rnorm(100)) %>% mutate(g2 = g*2)
cor.mat <- diag(2)

test_that("test simple values", {
  expect_equal(eff_nbr_tests(cor.mat, cor.true = TRUE), 2)
  expect_equal(eff_nbr_tests(diag(10), cor.true = TRUE), 10)
  expect_equal(eff_nbr_tests(geno.mat, cor.true = FALSE), 1)
})


cor.mat.na <- cor.mat
geno.mat.na <- geno.mat

cor.mat.na[1,1] <- NA
geno.mat.na[22, 2] <- NA

test_that("Testing matrices with NAs", {
  expect_equal(eff_nbr_tests(cor.mat.na, cor.true = TRUE), 1)
  expect_equal(eff_nbr_tests(geno.mat.na), 1)
})

