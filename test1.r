library(dplyr)
library(readr)
library(tidyr)

#prepare data

olympics <- read.csv("/Users/klevy/Downloads/olympics.csv", skip = 1)

names(olympics) <-c("Country", "Summer", "Gold", "Silver", "Bronze", "Total", "Winter", "Gold.1", "Silver.1", "Bronze.1", "Total.1", "Games", "Gold.2", "Silver.2", "Bronze.2", "Combined.total")

olympics$Country

olympics<-olympics %>%
    separate(Country, c("Country", "ID"), "[(]") %>% mutate(ID=gsub("[)]","",ID))

#Question 0 (example)
#What is the first country in df? Script should return a single string value.

olympics$Country[1]

#Question 1
#Which country has won the most gold medals in summer games?

q1olympics <- olympics$Country[which.max(olympics$Total[1:length(olympics$Gold)-1])]

#Question 2
#Which country had the biggest difference between their summer and winter gold medal counts?

q2olympics <- olympics$Country[which.max(olympics$Gold[1:length(olympics$Gold)-1] - olympics$Gold.1[1:length(olympics$Gold.1)-1])]

#Question 3
#Which country has the biggest difference between their summer gold medal counts and winter gold medal counts relative to their total gold medal count?

# summer gold -  winter gold
q3olympics_1 <- olympics %>% filter(Gold > 0 & Gold.1 > 0)

#over total
q3olympics <- q3olympics_1$Country[which.max((q3olympics_1$Gold - q3olympics_1$Gold.1)/q3olympics_1$Gold.2)]


#Question 4

q4olympics_1 <- mutate(olympics,Points=Gold.2*3+Silver.2*2+Bronze.2*1)
q4olympics <- data.frame(q44$Country,q44$Points)



glimpse(olympics)
head(olympics)
