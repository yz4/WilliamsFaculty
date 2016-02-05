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
age_summary <- function(dpmt=FALSE,gender=FALSE) {
    data(data)
    if(dpmt == FALSE && gender == FALSE) {
      attributes <- c("Number of Professors", "Range of Ages", "Oldest", "Youngest", 
          "Average Age", "Standard Deviation", "Variance")
      attribute_data <- with(data, c(nrow(data), max(age) - min(age), as.character(name[match(max(age), 
          age)]), as.character(name[match(min(age), age)]), mean(age), sd(age), var(age)))
      df <- data.frame(attributes, attribute_data)
      df
    }
    else if (dpmt == FALSE && gender == TRUE) {
      attributes <- c("Number of Male Professors", "Number of Female Professors",
                      "Oldest Male Professor", "Youngest Male Professor",
                      "Oldest Female Professor", "Youngest Female Professor",
                      "Average Age of Male Professors", "Average Age of Female Professors",
                      "SD of Male Professor Ages", "SD of Female Professor Ages")
      male = data[data$gender =="Male",]
      female = data[data$gender == "Female",]
      attribute_data <- with(data,c(nrow(male), nrow(female),
                                    max(male$age), min(male$age),
                                    max(female$age), min(female$age),
                                    mean(male$age), mean(female$age),
                                    sd(male$age), sd(female$age)))
      df <- data.frame(attributes, attribute_data)
      df
    }
    else if (dpmt == TRUE && gender == FALSE) {
      departments <- unique(data$department)
      number_of_professors <- NULL
      for(i in departments){
        number_of_professors <- c(number_of_professors, nrow(data[data$department==as.character(i),]))
      }
      oldest <- NULL
      for(i in departments){
        oldest <- c(oldest, with(data[data$department==as.character(i),], 
                       paste(as.character(name[match(max(age), age)]),", ",max(age),sep="")))
      }
      youngest <- NULL
      for(i in departments){
        youngest <- c(youngest, with(data[data$department==as.character(i),], 
                                 paste(as.character(name[match(min(age), age)]),", ",max(age),sep="")))
      }
      average_age <- NULL
      for(i in departments){
        average_age <- c(average_age, with(data[data$department==as.character(i),], mean(age)))
      }
      df <- data.frame(departments,number_of_professors,oldest,youngest,average_age)
      datatable(df)
    }
}
