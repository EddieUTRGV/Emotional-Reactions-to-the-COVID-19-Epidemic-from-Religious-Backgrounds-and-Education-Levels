
library(lsr)
library(gplots)
library(car)
library(dplyr)

data("starwars")

your_data <- starwars %>% filter(!is.na(mass) & !is.na(species))

xtabs(~ species, data = your_data)

aggregate(mass ~ species, data = your_data, mean)

aggregate(mass ~ species, data = your_data, sd)

plotmeans(mass ~ species, 
          data = your_data,
          xlab = "Species",
          ylab = "Mass (grams)",
          main = "Mass by Species with 95% CI")

model <- aov(mass ~ species, data = your_data)

summary(model)

etaSquared(model)

posthocPairwiseT(model)

leveneTest(mass ~ species, data = your_data)

shapiro.test(residuals(model))

#In my one-way ANOVA test examining the mass of different Star Wars species, 
#the results I got indicates that there is a significant difference in mass among the species (F(30, 25) = 89.44, p < 2e-16),
#explaining that species affects mass. 
#The eta squared value of 0.99 indicates a large effect size. 
#However, residuals from the ANOVA show non-normal distribution (Shapiro-Wilk test, p < 0.001), 
#and the Levene's test I did confirms equal variances across groups (p = 0.9481). 
#Post-hoc pairwise comparisons have revealed individual differences in mass between many species, while some species have insufficient data (e.g., Aleena, Besalisk). 
#Overall, my findings tell that different species significantly influence mass.