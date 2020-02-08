# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

#View(airports)
View(airlines)
# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
avg_arr_delays <- flights %>% group_by(dest) %>% summarize(avg_delay = mean(arr_delay, na.rm = TRUE)) 
avg_arr_delays
airport_delays <- left_join(airports, avg_arr_delays, by = "name")
airport_largest_delay <- airports_delays %>% filter(avg_arr_delays == max(avg_arr_delays)) %>% select(name)

# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?

airline_avg_arr_delay <- flights %>% group_by(carrier) %>% summarize(avg_arr_delay = mean(arr_delay, na.rm = TRUE)) %>% left_join(airlines)
smallest_avg_arr_delay <- airline_avg_arr_delay %>% filter(avg_arr_delay == min(avg_arr_delay))
