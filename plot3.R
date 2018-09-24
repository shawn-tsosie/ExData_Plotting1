hhpc <- read.csv("household_power_consumption.txt", sep = ";",
                 na.strings = "?", stringsAsFactors = FALSE)
hhpc[,1] <- as.Date(hhpc[,1], format = "%d/%m/%Y")
hhpc2Days <- subset(hhpc, hhpc[,1] == as.Date("2007-02-01")
                    | hhpc[,1] == as.Date("2007-02-02"))
hhpc2Days[hhpc2Days[,2] == "00:00:00",2] <- "00:00:01"
hhpc2Days$Date_Time <- with(hhpc2Days, paste(Date, Time))
hhpc2Days$Date_Time <- with(hhpc2Days, 
                            as.POSIXct(Date_Time, 
                                       format = "%Y-%m-%d %H:%M:%S"))

png("ExData_Plotting1/plot3.png")
with(hhpc2Days, plot(Date_Time, Sub_metering_1, 
                     "n", xlab = "", ylab = "Energy sub metering"))
with(hhpc2Days, points(Date_Time, Sub_metering_1, 
                       type ="l", col = "black"))
with(hhpc2Days, points(Date_Time, Sub_metering_2, 
                       type ="l", col = "red"))
with(hhpc2Days, points(Date_Time, Sub_metering_3, 
                       type ="l", col = "blue"))
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()