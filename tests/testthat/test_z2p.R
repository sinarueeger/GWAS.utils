context("test-z2p")



test_that("P 0.05 and Z 1.96", {
  expect_equal(z2p(c(NA, 1.959964, -1.959964, 0)), c(NA_integer_, 0.05, 0.05, 1))
  expect_equal(z2p(c(4, 1.959964, -1.959964, 0)), z2p(c(4, 1.959964, -1.959964, 0), method = "Rmpfr::pnorm") %>% as.numeric())
  #  expect_equal(z2p(c(NA, 1.959964, -1.959964, 0), method = "Rmpfr::pnorm"), c(NaN_integer_, 0.05, 0.05, 1))
})



test_that("Testing NAs and Inf", {
  expect_equal(z2p(c(NA, NA)), c(NA_integer_, NA_integer_))
  expect_warning(
    z2p(c(0.2, Inf)),
    "The 'Z' vector contains infinite values. These will be turned into NAs, because no meaninful P value can be calculated from that."
  )
})




test_that("Z can be very large", {
  expect_equal(z2p(c(200, 300)), c(0, 0))
  expect_message(
    z2p(c(200, 300)),
    "Some P-values are equal to 0. Try using the option method = 'Rmpfr::pnorm'"
  )
  expect_equal(z2p(c(200, 300), method = "Rmpfr::pnorm"), new("mpfr", .Data = list(new("mpfr1", prec = 100L, exp = c(
    -28861L,
    -1L
  ), sign = 1L, d = c(
    -1342177280L, 879260022L, -1492104513L,
    -1945735537L
  )), new("mpfr1", prec = 100L, exp = c(-64929L, -1L), sign = 1L, d = c(1879048192L, -2068401488L, 1783661392L, -1881304130L)))))
})
