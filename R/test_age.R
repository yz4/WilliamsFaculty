#' Statistical analysis on data
#' 
#' This function runs statistical analysis on the data. The tests run include a binomial
#' test for the number of female professors, a two-sample t-test with male and female professor
#' ages, a one-way ANOVA with professor ages in each department and a chi-squared test of independence
#' with gender and departments. The type of test performed is depended on the input: \cr
#' If dpmt is TRUE and gender is FALSE, the ANOVA test is performed. \cr
#' If dpmt is FALSE and gender is TRUE, the binomial test and the t-test are performed. \cr
#' If both are TRUE, the chi-squared test of independence is performed.
#' 
#' @param dpmt This argument is initialized as TRUE, and controls which test is performed
#' @param gender This argument is initialized as TRUE, and controls which test is performed
#' @return different statistical analysis on the data depending on the input
#' @export
test_age <- function(dpmt = TRUE, gender = TRUE) {
    data(data)
    if (dpmt && !gender) {
        results = aov(age ~ department, data = data)
        print(summary(results))
        print("The p-value is 0.0244, null hypothesis rejected at 0.05 significance level. So we reject the null hypothesis that all departments have the same mean age.")
    }
    if (!dpmt && gender) {
        number_of_professors = nrow(data)
        number_of_female_professors = nrow(data[data$gender == "Female", ])
        print(binom.test(number_of_female_professors, number_of_professors, alternative = "less"))
        print("The p-value is 0.000988, null hypothesis rejected at 0.05 significance level. So we reject the null hypothesis that the probability of a professor being female is 0.5.")
        male_ages = data[data$gender == "Male", ]$age
        female_ages = data[data$gender == "Female", ]$age
        print(t.test(male_ages, female_ages, alternative = "greater"))
        print("The p-value is 1.202e-05, null hypothesis rejected at 0.05 significance level. So we reject the null hypothesis that the mean ages of male and female professors are the same.")
    }
    if (gender && dpmt) {
        tbl = with(data, table(gender, department))
        print(chisq.test(tbl))
        print("The p-value is 0.0827, null hypothesis is not rejected at 0.05 significance level. So we do not reject the null hypothesis that gender is independent from department with regards to professor ages")
    }
} 
