#' Plotting age by gender
#' 
#' This function takes an input, and if that input is a gender, it will create
#' a histogram of the age distribution of Williams faculty of that gender. If
#' the input is not a gender, an error message would be returned.
#' 
#' @param gender This input should be one of the genders
#' @family plotting functions
#' @seealso \code{\link{plot_age}} for histogram of all ages, \code{\link{plot_by_dpmt}}
#' for histograms by department,
#' @return a histogram of the age distribution of Williams faculty of the gender selected
#' @examples 
#' plot_by_gender("Male")
#' plot_by_gender("female")
#' @export
plot_by_gender <- function(gender) {
    data(data)
    if (tolower(gender) == "male") {
        with(subset(data, gender == "Male"), hist(age, main = "Age Distribution of Male Williams Faculty", 
            xlab = "Age (by years)"))
    } else if (tolower(gender) == "female") {
        with(subset(data, gender == "Female"), hist(age, main = "Age Distribution of Female Williams Faculty", 
            xlab = "Age (by years)"))
    } else {
        print("Error, please select a gender")
    }
} 