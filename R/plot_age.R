#' Plots the age distribution of all Williams faculty
#' 
#' This functions creates a histogram of the age distribution of all Williams faculty.
#' @family plotting functions
#' @seealso \code{\link{plot_by_dpmt}} for histograms by department, \code{\link{plot_by_gender}}
#' for histograms by gender, 
#' @return a histogram of the age distribution of all Williams faculty
#' @examples 
#' plot_age()
#' @export
plot_age <- function() {
    par(mar = c(5.1, 4.1, 4.1, 2.1), xpd = FALSE)
    ## adjust to default margins
    ggplot2::qplot(age, data=data, geom="bar", main="Age Distribution of Williams Faculty", xlab = "age (by years)")
} 
