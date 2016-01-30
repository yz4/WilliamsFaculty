#' Calculates the mean of the ages of all Williams faculty
#' 
#' @return The average age of all Williams faculty
#' @export
average_age <- function() {
  data(age)
  return(mean(age$Age))
}

