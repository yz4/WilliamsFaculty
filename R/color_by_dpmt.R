#' Visualizing professor ages by department
#'
#' This function creates a colored scatter plot with each color representing a different
#' department. The index represents the order of the professors in the original data, since
#' the original data is in alphabetical order, the index gives a sense of which letter the
#' professor's last name starts with. A legend is included indicating which color represents which
#' department. If there is no input, the scatter plot will have points from all 22 departments, with the oldest
#' and youngest professors pointed out. If an input is given, the scatter plot will only contain points for the professors in the specified
#' departments. If the input contains a string that is not a department, an error message will be printed.
#' Note: the legend may overlap with the plot in some RStudio layouts, adjust the size of the plot area to 
#' default for clear graph.
#' 
#' @param dpmt_displayed This input should include the names of the departments desired, in the form of a list
#' @family plotting functions
#' @seealso \code{\link{plot_age}} for histogram of all ages, \code{\link{plot_by_dpmt}}
#' for histograms by department, \code{\link{plot_by_gender}} for histograms by gender, and
#' \code{\link{color_by_gender}} for colored scatter plot by gender
#' 
#' @return a colored scatter plot of Williams faculty ages by department
#' @examples 
#' color_by_dpmt()
#' color_by_dpmt(c('Theatre/Dance','Biology/Environmental Studies', 'Anthropology/Sociology'))
#' @export
color_by_dpmt <- function(dpmt_displayed) {
    temp_data <- data
    temp_data[["index"]] <- c(1:403)
    ## added index column to keep original indices
    par(mar = c(5.1, 4.1, 4.1, 8.1), xpd = TRUE)
    ## restricts plot to the left and turn off clipping
    departmentlist <- unique(data$department)
    if (missing(dpmt_displayed)) {
        palette(rainbow(22))
        with(temp_data[temp_data$department == "Physics/Astronomy", ], plot(age ~ 
            index, xlim = c(0, 405), ylim = c(26, 81), col = 0, main = "William Faculty Age By Department"))
        c <- 1
        for (i in departmentlist) {
            with(temp_data[temp_data$department == as.character(i), ], points(age ~ 
                index, col = c))
            c = c + 1
        }
        points(20, 80, pch = 3, col = "black")  ## oldest professor
        points(259, 27, pch = 4, col = "black")  ## youngest professor
        legend(430, 90, col = c(1:22, "black", "black"), 
            legend = c(as.character(departmentlist), "Oldest", "Youngest"), bty = "n", 
            pch = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
                1, 1, 3, 4), title = "Departments", cex = 0.6)
    } else {
        contained <- TRUE
        for (i in dpmt_displayed) {
            if (!(i %in% departmentlist)) {
                contained <- FALSE
            }
        }
        if (contained) {
            departmentlist = dpmt_displayed
            if (length(departmentlist) >= 2) {
                palette(rainbow(length(departmentlist)))
            } else {
                palette("default")
            }
            with(temp_data[temp_data$department == "Physics/Astronomy", ], plot(age ~ 
                index, xlim = c(0, 405), ylim = c(26, 81), col = 0, main = "Williams Faculty Age by Department"))
            c <- 1  ## color variable
            for (i in departmentlist) {
                with(temp_data[temp_data$department == as.character(i), ], points(age ~ 
                  index, col = c))
                c = c + 1  ## increment color variable
            }
            legend("topright", inset = c(-0.58, -0.1), col = 1:length(departmentlist), 
                legend = departmentlist, bty = "n", pch = 1, title = "Departments", 
                cex = 0.6)
        } else {
            print("Error, one or more of the departments in the input do not exist.")
        }
    }
} 
