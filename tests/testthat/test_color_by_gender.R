context("Test for the function 'test_age'")

test_that("test_age(dpmt=TRUE,gender=FALSE) returns the correct output", {
    result <- WilliamsFaculty:::test_age(dpmt=TRUE, gender=FALSE)
    expect_output(result, label = "Failed the test to generate correct output for test_age(dpmt=TRUE, gender=FALSE)")
})