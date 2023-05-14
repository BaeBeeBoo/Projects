NYC Flights 2013 Analysis

install.packages("nycflights13")
library(nycflights13)
library("tidyverse")
library(tidyverse, warn.conflicts=FALSE)
options(dplyr.summarise.inform = FALSE)

data(package="nycflights13")

glimpse(flights)
cat("\n")
glimpse(airlines)
cat("\n")
glimpse(airports)
cat("\n")
glimpse(weather)
cat("\n")
glimpse(planes)
cat("\n")
