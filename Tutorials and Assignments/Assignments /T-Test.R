library(dplyr)
library(ggplot2)


data("starwars")
head(starwars)

t.test(starwars$height, mu = 145)

ggplot(starwars, aes(x = height)) +
  geom_histogram(binwidth = 5, fill = "blue", alpha = 0.7, color = "black") +
  geom_vline(xintercept = 145, linetype = "dashed", color = "red") +
  labs(title = "Distribution of Star Wars Character Heights",
       x = "Height (cm)",
       y = "Frequency") +
  theme_minimal() +
  annotate("text", x = 145, y = 10, label = "Population Mean (75)", color = "red", vjust = -1)

#This t-test and histogram shows us that the height of characters are taller than the hypothetical population mean of 145.
#The p value is very low, making so that the null hypothesis of the true mean being 145 is not accurate.