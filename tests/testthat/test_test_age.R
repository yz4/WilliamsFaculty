context("Test for the function 'test_age'")

load("test_test_age.RData")

test_that("test_age generates correct output", {
  result.1 <- WilliamsFaculty:::test_age(dpmt=FALSE)
  result.2 <- WilliamsFaculty:::test_age(gender=FALSE)
  expect_equal(result.1, truth.1, label = "Failed the test to generate correct output for test_age(dpmt=FALSE)")
  expect_equal(result.2, truth.2, label = "Failed the test to generate correct output for test_age(gender=FALSE)")
})
