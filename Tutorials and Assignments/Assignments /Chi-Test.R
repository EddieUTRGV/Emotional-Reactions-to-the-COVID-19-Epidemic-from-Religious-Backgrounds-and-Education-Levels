
library(dplyr)
library(ggplot2)

#The Chi-Square test will be used to determine if there is an association 
#between the count of characters and frequencies of gender.

#Null Hypothesis- There is no proportion of difference in gender within the 
#sample for starwars.

#Alternative Hypothesis- There is a proportion of difference in gender within
#the starwars sample

data("starwars")

table(starwars$sex)

chisq.test(table(starwars$sex))$expected

chisq.test(table(starwars$sex))

ggplot(starwars, aes(x = sex)) +
  geom_bar() +
  labs(title = "Observed Frequencies", x = "Category", y = "Count")

#The Chi-Square test showed us that there is a significant p-value of 2.2e-16.
#This means that the amount of genders in the Star Wars universe is
#significantly different and not equal at all. 
#This reinforces our Alternative Hypothesis.