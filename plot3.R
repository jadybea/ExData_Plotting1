library("dplyr")

data <- read.csv2("household_power_consumption.txt", header = TRUE)

reduced_data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

reduced_data <- transform(reduced_data, Date = as.character(Date))

reduced_data <- transform(reduced_data, Time = as.character(Time))

reduced_data <- transform(reduced_data, Date = as.POSIXct(paste(reduced_data$Date, reduced_data$Time), format = "%d/%m/%Y %H:%M:%S"))

reduced_data <- transform(reduced_data, Sub_metering_1 = as.numeric(as.character(Sub_metering_1)))

reduced_data <- transform(reduced_data, Sub_metering_2 = as.numeric(as.character(Sub_metering_2)))

reduced_data <- transform(reduced_data, Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))

png(file = "plot3.png")

with(reduced_data, plot(Date, Sub_metering_1,  ylab = "Energy sub metering", xlab = "", type ="n"))
with(reduced_data, lines(Date, Sub_metering_1))
with(reduced_data, lines(Date, Sub_metering_2, col = "red"))
with(reduced_data, lines(Date, Sub_metering_3, col ="blue"))
legend("topright",  lty = 1, col = c("black", "red", "blue" ), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off() 