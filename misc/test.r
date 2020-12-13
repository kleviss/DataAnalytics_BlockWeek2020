library(dplyr)
library(ggplot2)

data <- read.csv("C:/Users/klevy/R/BlockWeek2020/team_case/Volkswohl_Bund_Daten/dataset.csv", sep=";", row.names = 1)
data2 <- read.csv("C:/Users/klevy/R/BlockWeek2020/team_case/Volkswohl_Bund_Daten/plz_einwohner.csv", colClasses=c("character", "numeric"))

inhabitants <- data2 %>% mutate(PLZRegion = substr(plz, 1, 1)) %>% group_by(PLZRegion) %>% summarise(inhabitants = sum(einwohner))

data <- data %>% filter(PLZHalter > 1000 & PLZHalter < 99999) %>% mutate(PLZChar = sprintf("%05d",PLZHalter), PLZRegion = substr(PLZChar, 1, 1)) %>% group_by(PLZRegion) %>% summarise(claims = sum(sanz))

data$inhabitants <- inhabitants$inhabitants

data <- data %>% mutate(ClaimsPer100kInhabitants = claims/inhabitants * 100000)
ggplot(data, aes(x = PLZRegion, y = ClaimsPer100kInhabitants)) + geom_bar(stat = "identity")
