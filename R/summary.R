#' Generates a summary of relevant data
#' 
#' @return summary of relevant data
age_summary <- function(){
  attributes <- c("Number of Professors","Range of Ages", "Oldest", "Youngest", "Average Age",
                  "Sd", "Variance")
  attribute_data <- with(age, c(nrow(data),max(Age)-min(Age),Name[match(max(Age),Age)],
                  Name[match(min(Age),Age)], mean(Age),sd(Age),var(Age)))
  df <- data.frame(attributes,attribute_data)
  head(df)
}