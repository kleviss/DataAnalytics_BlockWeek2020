

df <- read.csv("/Users/klevy/Downloads/olympics.csv", skip = 1)

library(stringr)

#PART1

prepare_set <- function(file_name) {
    df <- read.csv(file_name, skip = 1, header = TRUE, encoding = "UTF-8")
    
    names(df)[1] = "Country"
    
    for(i in 1:length(names(df))) {
        name <- names(df)[i]
        if(str_sub(name, 2, 3) == "01") names(df)[i] <- str_c("Gold", str_sub(name))
        if(str_sub(name, 2, 3) == "02") names(df)[i] <- str_c("Silver", str_sub(name))
        if(str_sub(name, 2, 3) == "03") names(df)[i] <- str_c("Bronze", str_sub(name))
        if(str_sub(name, 3, 3) == "U") names(df)[i] <- str_c(name, 11)
        
    }
    
    cn <- str_split(df$Country, "[(]")
    
    df$Country <- sapply(cn, "[" , 1)
}

glimpse(df)
head(df)
