library(tidyverse)

dat <- read.table("data/household_power_consumption.txt",
                  header = T,
                  sep = ';') |>
  mutate(`Date/Time` = as_datetime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) |>
  filter(`Date/Time` >= as.Date("2007-02-01") &
           `Date/Time` <= as.Date("2007-02-03"))

png(filename = "plot2.png", width = 480, height = 480)
plot(dat$`Date/Time`,
     dat$Global_active_power,
     type = 'l',
     col = 'black',
     lwd = 2,
     pch = 16,
     xaxt = "n",
     xlab = "",
     ylab = "Global Active Power(kilowatts)")

weekdays_labels <- weekdays(dat$`Date/Time`, abbreviate = TRUE)

unique_indices <- seq(1, length(dat$`Date/Time`), length.out = length(unique(weekdays_labels)))
axis(1, at = as.numeric(dat$`Date/Time`[unique_indices]), labels = weekdays_labels[unique_indices])
dev.off()
