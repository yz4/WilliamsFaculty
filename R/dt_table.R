#' Generates a DT table of the data
#' 
#' This functions simply creates a DT data table for all the data. The DT table
#' is useful for the user to explore and manipulate the data.
#' 
#' @return a DT data table of the faculty age data
#' @export
dt_table <- function() {
    data(data)
    datatable(data, rownames = FALSE, filter = "top", caption = "The data is retrieved from the Williams college archive for the\n            2013-14 school year")
} 
