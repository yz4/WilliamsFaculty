#' Visualizing professor ages by gender
#'
#' This function creates a colored scatter plot with each color representing a different
#' gender. The index represents the order of the professors in the original data, since
#' the original data is in alphabetical order, the index gives a sense of which letter the
#' professor's last name starts with. A legend is included indicating which color represents which
#' gender and the oldest and youngest professors are pointed out.
#' 
#' @family plotting functions
#' @seealso \code{\link{plot_age}} for histogram of all ages, \code{\link{plot_by_dpmt}}
#' for histograms by department, \code{\link{plot_by_gender}} for histograms by gender, and
#' \code{\link{color_by_dpmt}} for colored scatter plot by department
#' 
#' @return a colored scatter plot of Williams faculty ages by gender
#' @examples 
#' color_by_gender()
#' @export
color_by_gender <- function() {
    data(data)
    temp_data <- data
    temp_data[["index"]] <- c(1:403)
    par(mar = c(5.1, 4.1, 4.1, 8.1), xpd = TRUE)
    palette("default")
    with(temp_data[temp_data$gender == "Male", ], plot(age ~ index, col = 1, xlim = c(0, 
        405), ylim = c(26, 81), main = "Williams Faculty Age by Gender"))
    with(temp_data[temp_data$gender == "Female", ], points(age ~ index, col = 2))
    points(20, 80, pch = 3, col = "blue")  ## oldest professor
    points(259, 27, pch = 4, col = "blue")  ## youngest professor
    legend(430, 90, inset = c(-0.3, 0.4), col = c(1, 2, "blue", "blue"), legend = c("Male", 
        "Female", "Oldest", "Youngest"), bty = "n", pch = c(1, 1, 3, 4), title = "Gender", 
        cex = 0.7)
} 
