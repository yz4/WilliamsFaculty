context("Test for the function 'age_summary'")

load("test_age_summary.RData")

test_that("age_summary() returns the correct output", {
    result.1 <- WilliamsFaculty:::age_summary(dpmt=FALSE, gender=FALSE)
    result.2 <- WilliamsFaculty:::age_summary(dpmt=FALSE, gender=TRUE)
    expect_equal(result.1, truth.1, label = "Failed the test to generate correct output for age_summary(dpmt=FALSE, gender=FALSE)")
    expect_equal(result.2, truth.2, label = "Failed the test to generate correct output for age_summary(dpmt=FALSE, gender=TRUE")
})
