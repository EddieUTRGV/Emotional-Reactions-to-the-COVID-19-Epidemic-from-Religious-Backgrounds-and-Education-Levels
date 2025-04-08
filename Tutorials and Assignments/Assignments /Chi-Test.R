# Load necessary libraries
library(dplyr)
library(ggplot2)

# Load the starwars dataset
data("starwars")

# Step 2: Summarize Your Categorical Variable
sex_summary <- starwars %>%
  group_by(sex) %>%
  summarize(count = n())

hair_color_summary <- starwars %>%
  group_by(hair_color) %>%
  summarize(count = n())

# Step 3: Check Assumptions (not coded here, print expected counts if needed)

# Step 4: Run the Chi-Squared Goodness-of-Fit Test
# For Sex
sex_table <- table(starwars$sex)
chi_squared_sex <- chisq.test(sex_table)

# For Hair Color
hair_color_table <- table(starwars$hair_color)
chi_squared_hair_color <- chisq.test(hair_color_table)

# Step 5: Visualize the Distribution
# Bar Plot for Sex
ggplot(sex_summary, aes(x = sex, y = count)) +
  geom_bar(stat = "identity") +
  labs(title = "Distribution of Sex in Star Wars", x = "Sex", y = "Count")

# Bar Plot for Hair Color
ggplot(hair_color_summary, aes(x = hair_color, y = count)) +
  geom_bar(stat = "identity") +
  labs(title = "Distribution of Hair Color in Star Wars", x = "Hair Color", y = "Count")

# Step 6: Print chi-squared test results
print(chi_squared_sex)
print(chi_squared_hair_color)
