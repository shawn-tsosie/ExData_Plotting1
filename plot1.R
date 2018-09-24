hhpc <- read.csv("household_power_consumption.txt", sep = ";",
                 na.strings = "?", stringsAsFactors = FALSE)
hhpc[,1] <- as.Date(hhpc[,1], format = "%d/%m/%Y")
hhpc2Days <- subset(hhpc, hhpc[,1] == as.Date("2007-02-01")
                    | hhpc[,1] == as.Date("2007-02-02"))

png("ExData_Plotting1/plot1.png")
with(hhpc2Days, hist(Global_active_power, main = "Global Active Power", col = "red",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))
dev.off()