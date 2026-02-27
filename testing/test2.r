library(nycflights13)
library(dplyr)
flights
dim(flights)
str(flights)
select(flights, year, month, day)
select(flights, 1:6)
select(flights, year:dep_delay)
select(flights, !c(dep_time, dep_delay))

select(flights, YEAR = year, MONTH = month, DAY = day)
rename(flights, YEAR = year, MONTH = month, DAY = day)

filter(flights, month == 10)
flights2 <- select(flights, carrier, flight, origin, dest)
flights2

flights$month

unique(flights$month)

flights2 <- select(flights, carrier, flight, origin, dest)
flights2

filter(flights2, carrier %in% c("UA", "DL"))
filter(flights2, carrier == "UA" | carrier == "DL")

filter(flights2, origin == "JFK" & dest == "CLE")
filter(flights2, origin == "JFK", dest == "CLE")

arrange(flights, dep_delay)

flights_sml <- select(flights, year:day, ends_with("delay"), distance, air_time)
mutate(flights_sml, speed = distance / air_time * 60)

mutate(flights_sml, speed = distance / air_time * 60, gain = arr_delay - dep_delay)

summarize(flights,
    delay = mean(dep_delay, na.rm = TRUE),
    arrive = mean(arr_delay, na.rm = TRUE)
)

summarize(flights, delays_1hr = sum(arr_delay > 60, na.rm = TRUE))

summarize(flights, carriers = n_distinct(carrier))


flights_car <- select(flights, year:day, ends_with("delay"), carrier)
flights_car

by_carrier <- group_by(flights_car, carrier)
summarize(by_carrier, flights = n())

summarize(by_carrier, frequency = n(), mean_dep_delay = mean(dep_delay, na.rm = TRUE))

by_carrier

ungroup(by_carrier)
