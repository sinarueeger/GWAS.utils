


test_that("Testing EAF vector with NA, 0, 1, 0.7", {
  expect_equal(eaf2maf(c(NA, 0, 1, 0.7)), c(NA, 0, 0, 0.3))
})


test_that("Testing EAF = 0 and EAF = 1", {
  expect_equal(eaf2maf(0), 0)
  expect_equal(eaf2maf(1), 0)
})

test_that("Testing other input than numerical in EAF (NA, Inf, NULL, empty, characters)",
          {
            expect_error(eaf2maf(NA), "All values in 'eaf' are NA.")
            expect_warning(eaf2maf(c(0.2, Inf)),
                           "The 'eaf' vector contains infinite values. These will be turned into NAs.")
            expect_error(eaf2maf(NULL), "No 'eaf' vector provided.")
            expect_error(eaf2maf(), "No 'eaf' vector provided.")
            expect_error(eaf2maf("A"), "'eaf' must be a numeric vector.")
          })

test_that("Testing numerical values", {
  expect_equal(eaf2maf(0.5), 0.5)
  expect_equal(eaf2maf(0), 0)
  expect_equal(eaf2maf(1), 0)
  expect_equal(eaf2maf(0.51), 0.49)
})
