context("Error throwing")

test_that("color_by_dpmt throws error correctly", {
  result <- williamsFaculty:::color_by_dpmt("a")
  expect_output(result,"Error, one or more of the departments in the input do not exist.", label = "Failed to throw error for color_by_dpmt")
})