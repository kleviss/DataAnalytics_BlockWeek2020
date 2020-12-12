library(dplyr)
library(readr)
library(tidyr)

#prepare data
census <- read_csv(url("https://raw.githubusercontent.com/Yehorchenkov/Analysis_Dortmund_2020/main/data/census.csv"))

#Question 5
#Which state has the most counties in it? 
#    (hint: consider the sumlevel key carefully! You’ll need this for future questions too…)



#frame table according to STNAME
d <- data.frame(table(census$STNAME))
#rename table header
colnames(d)[1]  <- "STATE"
colnames(d)[2]  <- "Count"

#Arrange table based on highest count
framedTable <- arrange(d, desc(Count))

#print first value
mostCounties <- framedTable[1,]
print(mostCounties)

#q6
v <- order(census$CENSUS2010POP, decreasing=TRUE)[1:3]
census$STNAME[v]

#q7
new_census <- filter(census, !(census$SUMLEV == 40))
new_census<-new_census[,c("POPESTIMATE2010","POPESTIMATE2011","POPESTIMATE2012","POPESTIMATE2013","POPESTIMATE2014","POPESTIMATE2015")]
results<-(apply(new_census,1,FUN=max)-apply(new_census,1,FUN=min))
censusf<-census[which.max(results),]
censusf$CTYNAME

#q8
