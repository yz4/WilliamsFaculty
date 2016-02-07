#' Plotting age by department
#' 
#' This function generates plots with department as a factor. If there is no input,
#' A qplot (boxplots) of the age data with all departments will be generated. If the input 
#' is a department, it will create a histogram of the age distribution of Williams faculty of 
#' that department, with bordering indicating gender. If the input is not a department, an error 
#' message would be returned. If the input is one of the department in a combined category, a histogram 
#' of that category would be returned.
#' 
#' @param dpmt This input should be one of the departments at Williams, the first letter
#' should be capitalized
#' @family plotting functions
#' @seealso \code{\link{plot_age}} for histogram of all ages, \code{\link{plot_by_gender}}
#' for histograms by gender, \code{\link{color_by_gender}} for colored scatter plot by gender, and
#' \code{\link{color_by_dpmt}} for colored scatter plot by department
#' @return a histogram of the age distribution of Williams faculty of the department
#' selected
#' @examples 
#' plot_by_dpmt('Physics')
#' plot_by_dpmt('Theatre/Dance')
#' @export
plot_by_dpmt <- function(dpmt) {
    data(data)
    par(mar = c(5.1, 4.1, 4.1, 2.1), xpd = FALSE)
    ## adjust to default margins
    departmentlist <- unique(data$department)
    if (missing(dpmt)) {
        p <- ggplot2::qplot(department, age, data = data, geom = "boxplot", fill = department, 
            main = "Boxplots of Professor Ages by Department", ylab = "Age (by year)", 
            xlab = "Department")
        p + ggplot2::theme(legend.text = element_text(size = 6)) + scale_x_discrete(breaks = NULL)
    } else {
        if (dpmt %in% departmentlist) {
            with(subset(data, department == as.character(dpmt)), ggplot2::qplot(age, 
                data = data[data$department == "Physics/Astronomy", ], geom = "histogram", 
                bins = 15, color = gender, fill = I("brown"), main = paste("Age Distribution of Williams Faculty in", 
                  sep = " ", as.character(dpmt)), xlab = "Age (by years)"))
        } else if (dpmt == "Mathematics" || dpmt == "Statistics") {
            with(subset(data, department == "Mathematics/Statistics"), ggplot2::qplot(age, 
                data = data[data$department == "Mathematics/Statistics", ], geom = "histogram", 
                bins = 15, color = gender, fill = I("brown"), main = "Age Distribution of Williams Faculty in Mathematics/Statistics", 
                xlab = "Age (by years)"))
        } else if (dpmt == "Physics" || dpmt == "Astronomy") {
            with(subset(data, department == "Physics/Astronomy"), ggplot2::qplot(age, 
                data = data[data$department == "Physics/Astronomy", ], geom = "histogram", 
                bins = 15, color = gender, fill = I("brown"), main = "Age Distribution of Williams Faculty in Physics/Astronomy", 
                xlab = "Age (by years)"))
        } else if (dpmt == "Biology" || dpmt == "Environmental Studies") {
            with(subset(data, department == "Biology/Environmental Studies"), ggplot2::qplot(age, 
                data = data[data$department == "Biology/Environmental Studies", 
                  ], geom = "histogram", bins = 15, color = gender, fill = I("brown"), 
                main = "Age Distribution of Williams Faculty in Biology/Environmental Studies", 
                xlab = "Age (by years)"))
        } else if (dpmt == "Marine Science" || dpmt == "Geoscience") {
            with(subset(data, department == "Marine Science/Geoscience"), ggplot2::qplot(age, 
                data = data[data$department == "Marine Science/Geoscience", ], 
                geom = "histogram", bins = 15, color = gender, fill = I("brown"), 
                main = "Age Distribution of Williams Faculty in Marine Science/Geoscience", 
                xlab = "Age (by years)"))
        } else if (dpmt == "Theatre" || dpmt == "Dance") {
            with(subset(data, department == "Theatre/Dance"), ggplot2::qplot(age, 
                data = data[data$department == "Theatre/Dance", ], geom = "histogram", 
                bins = 15, color = gender, fill = I("brown"), main = "Age Distribution of Williams Faculty in Theatre/Dance", 
                xlab = "Age (by years)"))
        } else if (dpmt == "Classics" || dpmt == "Romance Languages") {
            with(subset(data, department == "Classics/Romance Languages"), ggplot2::qplot(age, 
                data = data[data$department == "Classics/Romance Languages", ], 
                geom = "histogram", bins = 15, color = gender, fill = I("brown"), 
                main = "Age Distribution of Williams Faculty in Classics/Romance Languages", 
                xlab = "Age (by years)"))
        } else if (dpmt == "Anthropology" || dpmt == "Sociology") {
            with(subset(data, department == "Anthropology/Sociology"), ggplot2::qplot(age, 
                data = data[data$department == "Anthropology/Sociology", ], geom = "histogram", 
                bins = 15, color = gender, fill = I("brown"), main = "Age Distribution of Williams Faculty in Anthropology/Sociology", 
                xlab = "Age (by years)"))
        } else {
            print("Error, department not found.")
        }
    }
} 
