library("dplyr")

data <- read.csv2("household_power_consumption.txt", header = TRUE)

reduced_data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

reduced_data <- transform(reduced_data, Global_active_power = as.numeric(as.character(Global_active_power)))

png(file = "plot1.png")

hist(reduced_data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
