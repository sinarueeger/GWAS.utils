context("test-trans_inv_normal")

set.seed(3)
vec.normal <- rnorm(10000)

test_that("inv.normal of NA", {
  expect_equal(trans_inv_normal(NA), NA_integer_)
  #  expect_lt(trans_inv_normal(vec.normal) - vec.normal, 0.5)
})
