context("test-opensnp")

test_that("properties of opensnp dataset", {
  expect_equal(nrow(opensnp), 784)
  expect_equal(ncol(opensnp), 23)
  expect_equal(names(opensnp), c("id", "height", "rs1985272_C", "rs7536679_G", "rs7516087_G",
                                 "rs2076596_T", "rs2076595_T", "rs3818038_G", "rs3818033_G", "rs2057096_G",
                                 "rs730387_A", "rs2014725_T", "rs3748756_T", "rs214302_G", "rs4912090_C",
                                 "rs4911997_A", "rs10917451_C", "rs12066114_G", "rs999974_G",
                                 "rs1542875_C", "rs12059827_G", "rs4508039_C", "rs10489858_C"))
})
