#' A package to visualize data on Williams faculty age
#' 
#' \tabular{ll}{ Package \tab williamsFaculty \cr Type: \tab Package\cr 
#' Version: \tab 1.0\cr Date: \tab 2016-02-03\cr License: \tab GPL-3\cr }
#' 
#' The williamsFaculty package focuses on the ages of Williams College faculty members.
#' The package 
#' 
#' 
#' The package contains a main function \code{backtestGraphics} that takes in a 
#' data frame of backtest results, and returns summary statistics about the data 
#' frame and plots the historical traces of market values and profits. The package
#' also contains many helper functions that perform the calculations and 
#' plotting for the \code{backtestGraphics} function. These helper functions can
#' only be called within the \code{backtestGraphics} function.
#' 
#' The package contains three data frames, \code{commodity}, \code{equity} and 
#' \code{credit}. The \code{commodity} data frame contains the backtest results 
#' for 28 commodities in the futures market. The \code{equity} data frame 
#' contains the backtest results for random 50 stocks. The \code{credit} data 
#' frame is the backtest result for credit default swap. The user can simply 
#' call \code{backtestGraphics} with these data frames. An example will be
#' \code{backtestGraphics(x = commodity)}.
#' 
#' In order to use the user's own data frame, sometimes the user might need to
#' specify the column names of her data frame and pass them into the function.
#' Type \code{?backtestGraphics} for more details.
#' 
#' @name williamsFaculty-package
#' @docType package
NULL