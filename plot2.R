library("dplyr")

data <- read.csv2("household_power_consumption.txt", header = TRUE)

reduced_data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

reduced_data <- transform(reduced_data, Global_active_power = as.numeric(as.character(Global_active_power)))

reduced_data <- transform(reduced_data, Date = as.character(Date))

reduced_data <- transform(reduced_data, Time = as.character(Time))

reduced_data <- transform(reduced_data, Date = as.POSIXct(paste(reduced_data$Date, reduced_data$Time), format = "%d/%m/%Y %H:%M:%S"))

png(file = "plot2.png")

with(reduced_data, plot(Date, Global_active_power,  ylab = "Global Active Power (kilowatts)", xlab = "", type ="n"))
with(reduced_data, lines(Date, Global_active_power))

dev.off()