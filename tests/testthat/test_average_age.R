context("Test for the function 'average_age'")

load("test_average_age.RData")

test_that("average_age returns correct value", {
  result.1 <- WilliamsFaculty:::average_age()
  expect_equal(result.1, truth.1, label = "Failed the test to calculate the correct mean")
})
