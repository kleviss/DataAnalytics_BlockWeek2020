library(dplyr)
library(readr)
library(tidyr)
library(tidyverse)

pollutantmean <- function(directory, pollutant, id = 1:332){
    fileList <- list.files(path = directory, pattern =".csv", full.names = TRUE)
    
    #empty vector for storing values
    values <- numeric()
    
    #fill the vector with data with loop
    for( i in id) {
        data <- read.csv(fileList[i])
        values <- c(values, data[[pollutant]])
    }
    
    mean(values, na.rm = TRUE)
   
}

pollutantmean("./specdata/", "sulfate", 1:10)
