library(ggplot2)
library(dplyr)
library(tidyverse)


df <- read.csv("./Volkswohl_Bund_Daten/dataset.csv", sep=";", row.names = 1)
data <- data %>% dplyr::filter(PLZHalter >= 10000 & PLZHalter < 99999) %>% mutate(PLZRegion = substr(PLZHalter, 1, 1)) %>% group_by(PLZRegion) %>% summarise(claims = sum(sanz))
ggplot(data, aes(x = PLZRegion, y = claims)) + geom_bar(stat = "identity")