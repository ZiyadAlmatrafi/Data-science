library(tidyverse)
library(lubridate)
library(nycflights13)

flights %>% 
  select(year, month, day, hour, minute)%>%
  mutate(departure= make_datetime(year, month,day, hour, minute))

#16.2.4 Exercises    
#1
ymd(c("2010-10-10", "bananas"))  # Warning message

#2
?today #a character vector specifying which time zone you would like the current time in

#3
d1 <- "January 1, 2010"
mdy(d1)
d2 <- "2015-Mar-07"
ymd(d2)
d3 <- "06-Jun-2017"
dmy(d3)
d4 <- c("August 19 (2015)", "July 1 (2015)")
mdy(d4)
d5 <- "12/30/14" # Dec 30, 2014
mdy(d5)

#16.3.4 Exercises
#1
flights_dt %>%
  filter(!is.na(dep_time)) %>%
  mutate(dep_hour = update(dep_time, yday = 1)) %>%
  mutate(month = factor(month(dep_time))) %>%
  ggplot(aes(dep_hour, color = month)) +
  geom_freqpoly(binwidth = 3600)+
  labs(
    x="Hour",
    y="Times",
    title = "How does the distribution of flight times within a day change over the course of the year?")

#3

flights_dt %>%
  mutate(flight_duration = as.numeric(arr_time - dep_time),
    air_time_mins = air_time,
    difference = flight_duration - air_time_mins
  ) %>%
  select(origin, dest, flight_duration, air_time_mins, difference)

#4
flights_dt %>%
  mutate(sched_dep_hour = hour(sched_dep_time)) %>%
  group_by(sched_dep_hour) %>%
  summarise(dep_delay = mean(dep_delay)) %>%
  ggplot(aes(y = dep_delay, x = sched_dep_hour)) +
  geom_smooth()

#5
flights_dt %>%
  mutate(wday = wday(dep_time, label = TRUE)) %>% 
  group_by(wday) %>% 
  summarize(ave_dep_delay = mean(dep_delay, na.rm = TRUE)) %>% 
  ggplot(aes(x = wday, y = ave_dep_delay)) + 
  geom_bar(stat = "identity")+
  labs(
    x="Days",
    y="Average delay",
    title = "On what day of the week should you leave if you want to minimise the chance of a delay?"
  )
  
#Exercise 16.4.3
ymd("2015-01-01") + months(0:11)

#Exercise 16.4.4
calc_age <- function(birth_day) {
  (birth_day %--% today()) %/% years(1)
}
calc_age(ymd("1997-6-7"))

