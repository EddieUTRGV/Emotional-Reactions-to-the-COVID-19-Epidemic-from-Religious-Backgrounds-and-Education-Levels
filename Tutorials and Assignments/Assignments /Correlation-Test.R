library(ggplot2)
library(MASS)
library(scales)

data(starwars)

# Set the correlation value based on height and mass
correlation_value <- cor(starwars$height, starwars$mass, use = "complete.obs")

# Generate data with specified correlation
Sigma <- matrix(c(1, correlation_value, correlation_value, 1), ncol = 2)
data <- MASS::mvrnorm(n = 100, mu = c(0, 0), Sigma = Sigma)
df <- data.frame(
  height = rescale(data[, 1], to = c(1, 200)),
  mass = rescale(data[, 2], to = c(1, 200))
)

# Create plot
ggplot(df, aes(x = height, y = mass)) +
  geom_point(color = "orange", alpha = 0.6) +
  geom_smooth(method = "lm", color = "darkblue", se = FALSE) +
  xlim(1, 200) + ylim(1, 200) +
  labs(
    title = paste0("Correlation: r = ", round(correlation_value, 2)),
    x = "Height (cm)",
    y = "Mass (kg)")

#I chose to visualize the mass and height of Star Wars characters.
#The plot shows a scatter of orange points signifying the scaled height (x-axis) and scaled mass (y-axis).
#The dark blue line represents the linear regression fit, suggesting that the increases in height are related to the increases in mass. 
#The correlaation of r (0.13) is closer to 0, which means there isn't a very strong relationship.