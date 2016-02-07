context("Error throwing")

test_that("color_by_dpmt throws error correctly", {
  result <- WilliamsFaculty:::color_by_dpmt("a")
  expect_output(result,"Error, one or more of the departments in the input do not exist.", label = "Failed to throw error for color_by_dpmt")
})

test_that("plot_by_dpmt throws error correctly", {
  result <- WilliamsFaculty:::plot_by_dpmt("a")
  expect_output(result,"Error, department not found.", label = "Failed to throw error for plot_by_dpmt")
})

test_that("plot_by_gender throws error correctly", {
  result <- WilliamsFaculty:::plot_by_gender("a")
  expect_output(result,"Error, please select a gender.")
})

test_that("test_age throws error correctly", {
  result <- WilliamsFaculty:::test_age(dpmt=FALSE, gender=FALSE)
  expect_output(result, "At least one of the inputs must be true.", label = "Failed to throw error for test_age")
})