#' Generates a summary of relevant data
#' 
#' This functions generates summaries of the data. If neither 'dpmt' or 'gender'
#' is specified as TRUE, the function returns a data frame with attributes of the whole dataframe.
#' If 'gender' is set to true, the function returns a data frame with attributes of the data with
#' regards to gender. If 'dpmt' is set to true, the function generates a DT data table with attributes of
#' the data with regards to departments.
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
    data(data)
    if (!dpmt && !gender) {
        attributes <- c("Number of Professors", "Range of Ages", "Oldest", "Youngest", 
            "Average Age", "Standard Deviation", "Variance")
        attribute_data <- with(data, c(nrow(data), max(age) - min(age), as.character(name[match(max(age), 
            age)]), as.character(name[match(min(age), age)]), round(mean(age),2), round(sd(age),2), 
            round(var(age),2)))
        df <- data.frame(attributes, attribute_data)
        return(df)
    }
    if (gender) {
        attributes <- c("Number of Male Professors", "Number of Female Professors", 
            "Oldest Male Professor", "Youngest Male Professor", "Oldest Female Professor", 
            "Youngest Female Professor", "Average Age of Male Professors", "Average Age of Female Professors", 
            "SD of Male Professor Ages", "SD of Female Professor Ages")
        male = data[data$gender == "Male", ]
        female = data[data$gender == "Female", ]
        attribute_data <- with(data, c(nrow(male), nrow(female), 
                                       with(data[data$gender == "Male", ], paste(as.character(name[match(max(age), age)]), ", ", max(age), sep = "")), 
                                       with(data[data$gender == "Male", ], paste(as.character(name[match(min(age), age)]), ", ", min(age), sep = "")), 
                                       with(data[data$gender == "Female", ], paste(as.character(name[match(max(age), age)]), ", ", max(age), sep = "")),
                                       with(data[data$gender == "Female", ], paste(as.character(name[match(min(age), age)]), ", ", min(age), sep = "")), 
                                       round(mean(male$age),2), round(mean(female$age),2), round(sd(male$age),2), round(sd(female$age),2)))
        df <- data.frame(attributes, attribute_data)
        return(df)
    }
    if (dpmt) {
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
                ], round(mean(age),2)))
        }
        df <- data.frame(departments, number_of_professors, oldest, youngest, average_age)
        return(DT::datatable(df,options=list(pageLength=6L)))
    }
} 
