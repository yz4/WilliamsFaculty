## ---- echo=FALSE, include=FALSE------------------------------------------
library(WilliamsFaculty)
library(xlsx)
library(DT)
library(ggplot2)
data=read.xlsx(system.file("extdata","data.xlsx", package="WilliamsFaculty"),1)

## ---- fig.width=5, fig.height=5------------------------------------------
plot_age()

## ------------------------------------------------------------------------
age_summary()

## ------------------------------------------------------------------------
datatable(data, options = list(pageLength=6))

## ------------------------------------------------------------------------
age_summary(gender=TRUE)

## ---- fig.show='hold'----------------------------------------------------
plot(1:10)
plot(10:1)

## ---- echo=FALSE, results='asis'-----------------------------------------
DT::datatable(head(data))

