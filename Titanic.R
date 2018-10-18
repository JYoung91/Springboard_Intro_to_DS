# install pertinent packages to visualize analysis
library(ggplot2)
library(titanic)

# 1 - Check the structure of titanic

str(titanic)

# 2 - Use ggplot() for the first instruction
ggplot(titanic, aes(x = Pclass, fill = Sex)) +
  geom_bar(position = "dodge")

# 3 - Plot 2, add facet_grid() layer
ggplot(titanic, aes(x = Pclass, fill = Sex)) +
  geom_bar(position = "dodge") +
  facet_grid(. ~ Survived)

# 4 - Define an object for position jitterdodge, to use below
posn.jd <- position_jitterdodge(0.5, 0, 0.6)

# 5 - Plot 3, but use the position object from instruction 4
ggplot(titanic, aes(x = Pclass, y = Age, col = Sex)) +
  geom_point(position = posn.jd, size = 3, alpha = 0.5) +
  facet_grid(. ~ Survived)

# Additional visualization

# Distribution of Age

ggplot(titanic, aes(x = Age, fill = Survived)) +
  geom_histogram(binwidth = 4, fill = "#377EB8") +
  labs(title ="Distribution of Age", y = "Distribution")

# Distribution of Age by Sex

ggplot(titanic, aes(x = Age)) +
  geom_histogram(binwidth = 4, fill = "#377EB8") +
  facet_grid(. ~ Sex)
labs(title ="Distribution of Age", y = "Distribution")

# Begin observing relationship between Sex and Age

ggplot(titanic, aes(x = Sex, y = Age)) +
  geom_point()

# Expand datapoints for better visibility using jitter

ggplot(titanic, aes(x = Sex, y = Age)) +
  geom_point(position = "jitter")

# Factor in the survival of both Sexes by color
# Convert Survival into categorical variable using factor

titanic$Survived <- as.factor(titanic$Survived)

ggplot(titanic, aes(x = Sex, y = Age, col = Survived)) +
  geom_point(position = "jitter")

# Tidy the datapoints into their own columns to show a clearer survival distribution

titanic$Survived <- as.factor(titanic$Survived)

posn.jd <- position_jitterdodge(0.5, 0, 0.6)

ggplot(titanic, aes(x = Sex, y = Age, col = Survived)) +
  geom_point(position = posn.jd)

# Disect that distribution by Pclass (1, 2, 3)
# Add additional plotting attributes

titanic$Survived <- as.factor(titanic$Survived)

posn.jd <- position_jitterdodge(0.5, 0, 0.8)

ggplot(titanic, aes(x = Sex, y = Age, col = Survived)) +
  geom_point(position = posn.jd, size = 3, alpha = 0.5) +
  facet_grid(. ~ Pclass)
