#' Plots the age distribution of all Williams faculty
#' 
#' This functions creates a histogram of the age distribution of all Williams faculty.
#' @return a histogram of the age distribution of all Williams faculty
#' @family plotting functions
#' @seealso \code{\link{plot_by_dpmt}} for histograms by department, \code{\link{plot_by_gender}}
#' for histograms by gender, 
#' @return a histogram of the age distribution of all Williams faculty
#' @examples 
#' plot_age()
#' @export
plot_age <- function() {
    data(data)
    dev.off()
    ## adjust to default margins
    hist(data$age, main = "Age Distribution of Williams Faculty", xlab = "Age (by years)")
} 
