#' Generates a summary of relevant data
#' 
#' This functions creates and prints a data frame containing relevant information
#' about the data, including the total number of professors, the age difference between
#' the oldest and youngest professor, the name of the oldest professor, the name of the
#' youngest professor, the average age, the standard deviation of the ages, and the
#' variance of the ages.
#' @return data frame containing summary of relevant data
#' @examples 
#' age_summary()
#' @export
age_summary <- function() {
    data(data)
    attributes <- c("Number of Professors", "Range of Ages", "Oldest", "Youngest", 
        "Average Age", "Sd", "Variance")
    attribute_data <- with(data, c(nrow(data), max(age) - min(age), as.character(name[match(max(age), 
        age)]), as.character(name[match(min(age), age)]), mean(age), sd(age), var(age)))
    df <- data.frame(attributes, attribute_data)
    print(df)
} 
