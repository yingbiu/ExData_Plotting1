library(tidyverse)

dat <- read.table("data/household_power_consumption.txt",
                  header = T,
                  sep = ';') |>
  mutate(`Date/Time` = as.Date(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) |>
  filter(`Date/Time` >= as.Date("2007-02-01") &
           `Date/Time` <= as.Date("2007-02-02"))


