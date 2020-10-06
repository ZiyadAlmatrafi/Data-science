library("tidyverse")
table1
table2
table4a
table4b

#Exercise 12.2.2
t2_cases <- filter(table2, type == "cases") %>%
  rename(cases = count) %>%
  arrange(country, year)

t2_population  <- filter(table2, type == "population") %>%
  rename(population = count) %>%
  arrange(country, year)

t2_cases_per_cap <- tibble(
  year = t2_cases$year,
  country = t2_cases$country,
  cases = t2_cases$cases,
  population = t2_population$population
) %>%
  mutate(cases_per_cap = (cases / population) * 10000) %>%
  select(country, year, cases_per_cap)

t2_cases_per_cap <- t2_cases_per_cap %>%
  mutate(type = "cases_per_cap") %>%
  rename(count = cases_per_cap)

bind_rows(table2, t2_cases_per_cap) %>%
  arrange(country, year, type, count)

#Exercise 12.2.3
table2 %>%
  filter(type == "cases") %>%
  ggplot(aes(year, count)) +
  geom_line(aes(group = country), colour = "grey50") +
  geom_point(aes(colour = country)) +
  ylab("cases")


#12.3.3 Exercises
#1
stocks <- tibble(
  year   = c(2015, 2015, 2016, 2016),
  half  = c(   1,    2,     1,    2),
  return = c(1.88, 0.59, 0.92, 0.17)
)
stocks %>% 
  pivot_wider(names_from = year, values_from = return) %>% 
  pivot_longer(`2015`:`2016`, names_to = "year", values_to = "return")

glimpse(stocks)

stocks %>%
  pivot_wider(names_from = year, values_from = return)

#2
#Why does this code fail?
table4a %>% 
  pivot_longer(c(1999, 2000), names_to = "year", values_to = "cases")
#The years 1990,2000 must be within (`)

#3
people <- tribble(
  ~name,             ~names,  ~values,
  #-----------------|--------|------
  "Phillip Woods",   "age",       45,
  "Phillip Woods",   "height",   186,
  "Phillip Woods",   "age",       50,
  "Jessica Cordero", "age",       37,
  "Jessica Cordero", "height",   156
)
glimpse(people)

people %>%
  distinct(name, names, .keep_all = TRUE) %>%
  pivot_wider(names_from="name", values_from = "values")

#4
preg <- tribble(
  ~pregnant, ~male, ~female,
  "yes",     NA,    10,
  "no",      20,    12
)

pregTidy<- preg %>%
  pivot_longer(c(male,female), names_to="sex",values_to="count",
  values_drop_na=TRUE)

#12.4.3 Exercises

table3
?separate

tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>% 
  separate(x, c("one", "two", "three"),extra = "drop")

tibble(x = c("a,b,c", "d,e", "f,g,i")) %>% 
  separate(x, c("one", "two", "three"),fill = "right" )

#Exercise 12.6.4
who

who_tidy<-who %>%
  pivot_longer(
    cols = new_sp_m014:newrel_f65, 
    names_to = "key", 
    values_to = "cases", 
    values_drop_na = TRUE
  ) %>% 
  mutate(
    key = stringr::str_replace(key, "newrel", "new_rel")
  ) %>%
  separate(key, c("new", "var", "sexage")) %>% 
  select(-new, -iso2, -iso3) %>% 
  separate(sexage, c("sex", "age"), sep = 1)

who_tidy %>%
  group_by(country,year,sex)%>%
  summarise(cases=sum(cases))%>%
  unite(country_sex, country, sex, remove = FALSE) %>%
  filter(year > 1995) %>%
  ggplot(aes(x=year,y=cases,group = country_sex, color=sex))+
  geom_path()

#Chapter 13
install.packages("nycflights13")
library(nycflights13)

#Exercise 13.2.4
special <- tribble(
  ~year, ~month, ~day, ~holiday,
  2020, 01, 01, "New Year Day",
  2020, 09, 23, "Saudi National Day"
)

#Exercise 13.3.1
flights %>%
  arrange(year, month, day, sched_dep_time, carrier, flight) %>%
  mutate(flight_id = row_number()) %>%
  select(flight_id,everything())

#Exercise 13.3.2
Lahman::Batting #The primary keys are playerID,yearID,stint
babynames::babynames #The primary keys are year,sex,name
nasaweather::atmos #The primary keys at, long, year, month
fueleconomy::vehicles #The primary key is id
ggplot2::diamonds #There is no priamry key

#Exercise 13.4.1
airports %>%
  semi_join(flights, c("faa" = "dest")) %>%
  ggplot(aes(lon, lat)) +
  borders("state") +
  geom_point() +
  coord_quickmap()

avg_delay<- flights %>%
  group_by(dest)%>%
  summarise(delay = mean(arr_delay,na.rm = TRUE))%>%
  left_join(airports,c(dest = "faa"))

avg_delay%>%
  ggplot(aes(lon,lat,color = delay))+
  borders("state")+
  geom_point()+
  coord_quickmap()

#Exercise 13.4.4
weather_delay<-flights%>%
  left_join(weather,by =c("origin" = "origin",
                       "year" = "year",
                       "month" = "month",
                       "day" = "day",
                       "hour" = "hour"))
weather_delay%>%
  group_by(precip)%>%
  summarise(delay = mean(dep_delay,na.rm=TRUE))%>%
  ggplot(aes(x=precip,y=delay,color=precip))+
  geom_line()+
  geom_point()

#Exercise 13.4.5

flights%>%
  filter(year==2013,month==6,day==13)%>%
  group_by(dest)%>%
  summarise(delay=mean(arr_delay,na.rm = TRUE))%>%
  left_join(airports,by=c("dest"="faa"))%>%
  ggplot(aes(y=lat, x=lon, size=delay, color=delay))+
  borders("state")+
  geom_point()+
  coord_quickmap()

#Exercise 13.5.1

flights %>%
  anti_join(planes, by = "tailnum") %>%
  count(carrier, sort = TRUE) %>%
  mutate(p = n / sum(n))

#Exercise 13.5.2
planes_filter<- flights %>%
  filter(!is.na(tailnum)) %>%
  group_by(tailnum) %>%
  count() %>%
  filter(n >= 100)

flights %>%
  semi_join(planes_filter, by = "tailnum")


