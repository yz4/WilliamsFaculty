#' Plots the age distribution of all Williams faculty
#' 
#' @export
plot_age_distribution <- function(){
  data(age)
  hist(age$Age, main = "Age Distribution of Williams Faculty", xlab = "Age (by years)")
}