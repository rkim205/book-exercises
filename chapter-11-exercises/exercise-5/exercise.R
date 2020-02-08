# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
dep_delay_by_month <- flights %>% group_by(month) %>% summarize(avg_dep_delay = mean(dep_delay, na.rm = TRUE))


# Which month had the greatest average departure delay?
greatest_dep_delay <- flights %>% group_by(month) %>% summarize(avg_dep_delay = mean(dep_delay, na.rm = TRUE)) %>% filter(avg_dep_delay == max(avg_dep_delay)) %>% select(month, avg_dep_delay)


# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function
plot(greatest_dep_delay)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
arrival_dep_dest <- flights %>% group_by(dest) %>% summarize(avg_arr_delay = mean(arr_delay, na.rm = TRUE)) %>% arrange(desc(avg_arr_delay))
head(arrival_dep_dest)

# You can look up these airports in the `airports` data frame!
airports

# Which city was flown to with the highest average speed?
highest_avg_speed_city <- flights %>% group_by(dest) %>% mutate(speed = distance/air_time) %>% arrange(desc(speed)) %>% select(dest, speed)
head(highest_avg_speed_city)
