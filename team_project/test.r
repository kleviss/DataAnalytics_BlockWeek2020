library(dplyr)    # alternatively, this also loads %>%
library(ggplot2)

data <- read.csv("dataset.csv", row.names = 1)
data <- data %>% filter(PLZHalter >= 10000 & PLZHalter < 99999) %>% mutate(PLZRegion = substr(PLZHalter, 1, 1)) %>% group_by(PLZRegion) %>% summarise(claims = sum(sanz))
ggplot(data, aes(x = PLZRegion, y = claims)) + geom_bar(stat = "identity")