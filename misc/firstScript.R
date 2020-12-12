install.packages("airqualityES")
install.packages("starwars")

air_df <- airquality
print(air_df)

sum(is.na(air_df$Ozone))

air_df$Ozone[47]

stardf <- starwars
print(stardf)

meanvalues <- subset(starwars, starwars$species=="Human")
mean(starwars$mass, na.rm = TRUE)

aggregate(starwars$mass,
          by = list(Species = starwars$species),
          mean)

stardf$skin_color

sum(!complete.cases(dat[-1]))

starwars %>%
    count(species, sort = TRUE)
min(subset(airquality$Wind,airquality$Month==7))


# Simple Bar Plot
counts <- table(airquality$Temp)
barplot(counts, main="y val",
        xlab="x val")

# Simple Horizontal Bar Plot with Added Labels
counts <- table(airquality$Temp)
barplot(counts, main="Car Distribution", horiz=TRUE,
        names.arg=c("3 Gears", "4 Gears", "5 Gears"))


Ozone <- airquality$Ozone
h <- hist(Ozone)
h

x <- airquality$Ozone
y <- airquality$Temp
# Plot with main and axis titles
# Change point shape (pch = 19) and remove frame.
plot(x, y, main = "Main title",
     xlab = "X axis title", ylab = "Y axis title",
     pch = 19, frame = FALSE)
# Add regression line
plot(x, y, main = "Main title",
     xlab = "X axis title", ylab = "Y axis title",
     pch = 19, frame = FALSE)
abline(lm(y ~ x, data = mtcars), col = "blue")


input <- starwars[,c('wt','mpg')]
print(head(input))