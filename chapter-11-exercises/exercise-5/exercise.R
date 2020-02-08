# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")


# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
View(flights)

# Which month had the greatest average departure delay?
month_greatest_delay <- flights %>%
  group_by(month) %>%
  summarize(
    avg_dep_delay = mean(dep_delay, na.rm = TRUE)
  ) %>%
  filter(avg_dep_delay == max(avg_dep_delay))

print(month_greatest_delay)

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function
delay_by_month <- flights %>%
  group_by(month)%>%
  summarize(avg_dep_delay = mean(dep_delay, na.rm = TRUE))

plot(delay_by_month)
  

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
highest_delay_dests <- flights %>%
  group_by(dest) %>%
  summarize(
    avg_arr_delay = mean(arr_delay, na.rm = TRUE)
  ) %>%
  arrange(-avg_arr_delay) %>%
  head(3)

print(highest_delay_dests)

# You can look up these airports in the `airports` data frame!
print(airports %>%
        filter(faa == "CAE"))

# Which city was flown to with the highest average speed?
highest_avg <- flights %>%
  group_by(dest) %>%
  summarize(avg_speed = mean(distance / air_time, na.rm = TRUE)) %>%
  filter(avg_speed == max(avg_speed, na.rm = TRUE))

print(highest_avg)
