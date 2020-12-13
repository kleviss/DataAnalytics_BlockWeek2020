library(dplyr)
library(ggplot2)

data <- read.csv("./Volkswohl_Bund_Daten/dataset.csv", sep=";", row.names = 1)
data2 <- read.csv("./Volkswohl_Bund_Daten/plz_einwohner.csv", colClasses=c("character", "numeric"))

inhabitants <- data2 %>% mutate(PLZRegion = substr(plz, 1, 1)) %>% group_by(PLZRegion) %>% summarise(inhabitants = sum(einwohner))

plz_data <- data %>% filter(PLZHalter > 1000 & PLZHalter < 99999) %>% mutate(PLZChar = sprintf("%05d",PLZHalter), PLZRegion = substr(PLZChar, 1, 1)) %>% group_by(PLZRegion) %>% summarise(claims = sum(sanz))

plz_data$inhabitants <- inhabitants$inhabitants

plz_data <- plz_data %>% mutate(ClaimsPer100kInhabitants = claims/inhabitants * 100000)
ggplot(plz_data, aes(x = PLZRegion, y = ClaimsPer100kInhabitants)) + geom_bar(stat = "identity")
