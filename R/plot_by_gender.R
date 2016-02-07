#' Plotting age by gender
#' 
#' This function generates plots with gender as a factor. If there is no input, a qplot (boxplots)
#' of the age data with both genders will be generated. If the input is a gender, it will create
#' a histogram of the age distribution of Williams faculty of that gender. If
#' the input is not a gender, an error message would be returned.
#' 
#' @param gender This input should be one of the genders
#' @family plotting functions
#' @seealso \code{\link{plot_age}} for histogram of all ages, \code{\link{plot_by_dpmt}}
#' for histograms by department, \code{\link{color_by_gender}} for colored scatter plot by gender, and
#' \code{\link{color_by_dpmt}} for colored scatter plot by department
#' @return a histogram of the age distribution of Williams faculty of the gender selected
#' @examples 
#' plot_by_gender('Male')
#' plot_by_gender('female')
#' @export
plot_by_gender <- function(gender) {
    par(mar = c(5.1, 4.1, 4.1, 2.1), xpd = FALSE)
    ## adjust to default margins
    if (missing(gender)) {
        ggplot2::qplot(gender, age, data=data, geom="boxplot",fill=gender, ylab="age (by years)", 
                       main="Boxplots of Professor Ages by Gender")
    } else {
        if (tolower(gender) == "male") {
            with(subset(data, gender == "Male"), ggplot2::qplot(age, main = "Age Distribution of Male Williams Faculty", 
                geom = "bar", xlab = "Age (by years)"))
        } else if (tolower(gender) == "female") {
            with(subset(data, gender == "Female"), ggplot2::qplot(age, main = "Age Distribution of Female Williams Faculty", 
                geom = "bar", xlab = "Age (by years)"))
        } else {
            print("Error, please select a gender")
        }
    }
} 
