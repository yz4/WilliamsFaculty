#' Plots the age distribution of all Williams faculty
#' 
plot_age_distribution <- function(){
  hist(age$Age, main = "Age Distribution of Williams Faculty", xlab = "Age (by years)")
}