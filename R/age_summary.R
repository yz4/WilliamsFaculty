#' Generates a summary of relevant data
#' 
#' This functions generates summaries of the data. If neither 'dpmt' or 'gender'
#' is specified as TRUE, the function returns a summary table with attributes of the whole dataframe.
#' If 'gender' is set to true, the function returns a summary table with attributes of the data with
#' regards to gender. If 'dpmt' is set to true, the function generates a DT data table with attributes of
#' the data with regards to departments, and also a qplot that displays each professor under each department
#' in a clear manner. 
#' 
#' @param dpmt This argument is initialized as FALSE. When set to TRUE, the function generates
#' summary of data with regards to departments
#' @param gender This argument is initialized as FALSE. Wehn set to TRUE, the function generates 
#' summary of data with regards to gender
#' 
#' @return summaries of data depending on input
#' @examples 
#' age_summary()
#' age_summary(dpmt=TRUE)
#' age_summary(gender=TRUE)
#' @export
age_summary <- function(dpmt = FALSE, gender = FALSE) {
    if (dpmt == FALSE && gender == FALSE) {
        attributes <- c("Number of Professors", "Range of Ages", "Oldest", "Youngest", 
            "Average Age", "Standard Deviation", "Variance")
        attribute_data <- with(data, c(nrow(data), max(age) - min(age), as.character(name[match(max(age), 
            age)]), as.character(name[match(min(age), age)]), mean(age), sd(age), 
            var(age)))
        df <- data.frame(attributes, attribute_data)
        df
    } else if (dpmt == FALSE && gender == TRUE) {
        attributes <- c("Number of Male Professors", "Number of Female Professors", 
            "Oldest Male Professor", "Youngest Male Professor", "Oldest Female Professor", 
            "Youngest Female Professor", "Average Age of Male Professors", "Average Age of Female Professors", 
            "SD of Male Professor Ages", "SD of Female Professor Ages")
        male = data[data$gender == "Male", ]
        female = data[data$gender == "Female", ]
        attribute_data <- with(data, c(nrow(male), nrow(female), max(male$age), 
            min(male$age), max(female$age), min(female$age), mean(male$age), mean(female$age), 
            sd(male$age), sd(female$age)))
        df <- data.frame(attributes, attribute_data)
        df
    } else if (dpmt == TRUE && gender == FALSE) {
        departments <- unique(data$department)
        number_of_professors <- NULL
        for (i in departments) {
            number_of_professors <- c(number_of_professors, nrow(data[data$department == 
                as.character(i), ]))
        }
        oldest <- NULL
        for (i in departments) {
            oldest <- c(oldest, with(data[data$department == as.character(i), ], 
                paste(as.character(name[match(max(age), age)]), ", ", max(age), 
                  sep = "")))
        }
        youngest <- NULL
        for (i in departments) {
            youngest <- c(youngest, with(data[data$department == as.character(i), 
                ], paste(as.character(name[match(min(age), age)]), ", ", min(age), 
                sep = "")))
        }
        average_age <- NULL
        for (i in departments) {
            average_age <- c(average_age, with(data[data$department == as.character(i), 
                ], mean(age)))
        }
        df <- data.frame(departments, number_of_professors, oldest, youngest, average_age)
        with(data, ggplot2::qplot(age, department))
        DT::datatable(df)
    }
} 
