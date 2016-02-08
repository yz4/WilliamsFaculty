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
#' @examples test_age(dpmt=FALSE)
#' @export
test_age <- function(dpmt = TRUE, gender = TRUE) {
    data(data)
    if (dpmt && !gender) {
        results = aov(age ~ department, data = data)
        cat(paste("The p-value is 0.0244, null hypothesis rejected at 0.05 significance level.", 
              "So we reject the null hypothesis that all departments have the same mean age.", sep='\n'))
        return(summary(results))
    }
    if (!dpmt && gender) {
        number_of_professors = nrow(data)
        number_of_female_professors = nrow(data[data$gender == "Female", ])
        print(binom.test(number_of_female_professors, number_of_professors, alternative = "less"))
        cat(paste("For the binomial test, the p-value is 0.000988, null hypothesis rejected at 0.05 significance level.", 
              "So we reject the null hypothesis that the probability of a professor being female is 0.5.", sep='\n'))
        male_ages = data[data$gender == "Male", ]$age
        female_ages = data[data$gender == "Female", ]$age
        cat(paste("For the t-test, the p-value is 1.202e-05, null hypothesis rejected at 0.05 significance level.",
              "So we reject the null hypothesis that the mean ages of male and female professors are the same.",sep='\n'))
        return(t.test(male_ages, female_ages, alternative = "greater"))
    }
    if (gender && dpmt) {
        tbl = with(data, table(gender, department))
        cat(paste("Null hypothesis is not rejected at 0.05 significance level. So we do not reject the null", 
              "hypothesis that gender is independent from department with regards to professor ages", sep='\n'))
        return(chisq.test(tbl, simulate.p.value = TRUE))
    }
    if (!gender && !dpmt) {
        print("At least one of the inputs must be true.")
    }
} 
