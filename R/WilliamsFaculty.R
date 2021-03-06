#' A package to visualize data on Williams faculty age
#' 
#' \tabular{ll}{ Package \tab WilliamsFaculty \cr Type: \tab Package\cr 
#' Version: \tab 1.0\cr Date: \tab 2016-02-03\cr License: \tab GPL-3\cr }
#' 
#' The WilliamsFaculty package focuses on the ages of Williams College faculty members.
#' The package explores the age data, with special attention paid to two factors: department and gender. 
#' The package provides functions that generate summary tables and functions that generate interesting 
#' visual presentations of the data. Some functions generate different summaries and plots depending on 
#' the user's input. In addition, The package also contains a function that performs statistical analysis on the data.
#' 
#' The most extensive summary function is \code{age_summary}, which provides general data on all ages,
#' a data table specific to gender, and a DT data table specific to departments with a qplot of the ages by department.
#' There are various plotting functions to visualize this data, including \code{color_by_dpmt} which presents professors
#' from each department with a different color in a scatter plot. 
#' 
#' The package contains an internal data frame, data, which contains the name, department, gender, and age of the
#' 403 Williams faculty members. All the functions are created to work with this data frame only. A useful future modification
#' to the package would be allowing users to import their own data frames. 
#' 
#' @name WilliamsFaculty
#' @docType package
NULL 
