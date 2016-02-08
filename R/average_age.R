#' Calculates the average age of all Williams faculty
#' 
#' This function simply calculates and returns the mean of the ages of all Williams faculty.
#' 
#' @return the average age of all Williams faculty
#' @examples
#' average_age()
#' 
#' @export
average_age <- function() {
    data(data)
    return(round(mean(data$age),2))
} 
