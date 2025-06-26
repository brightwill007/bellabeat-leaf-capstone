# Bellabeat Leaf Capstone Analysis
library(readr); library(dplyr); library(ggplot2); library(lubridate); library(janitor); library(skimr)

# Data import & cleaning
daily_activity <- read_csv("data/daily_activity_clean.csv") %>% clean_names()
sleep_data     <- read_csv("data/sleep_data_clean.csv")   %>% clean_names()

# Example analysis: daily steps summary
daily_steps_summary <- daily_activity %>%
  group_by(activity_date) %>%
  summarise(avg_steps = mean(total_steps), .groups = "drop")

# Plot
ggplot(daily_steps_summary, aes(x = activity_date, y = avg_steps)) +
  geom_line() +
  labs(title = "Daily Average Steps", x = "Date", y = "Steps")