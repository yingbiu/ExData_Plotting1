library(tidyverse)

dat <- read.table("data/household_power_consumption.txt",
                  header = T,
                  sep = ';') |>
  mutate(`Date/Time` = as_datetime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) |>
  filter(`Date/Time` >= as.Date("2007-02-01") &
           `Date/Time` <= as.Date("2007-02-02"))

dat<- dat |> mutate(Global_active_power=as.numeric(Global_active_power))


png(filename = "plot1.png", width = 480, height = 480)
hist(dat$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)",
     ylab = "Frequency")
dev.off()

