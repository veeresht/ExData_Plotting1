source("dataRead.R")

proj_data <- load_project_data()

global_active_power <- as.numeric(paste((proj_data$Global_active_power)))
voltage <- as.numeric(paste((proj_data$Voltage)))
sub_metering_1 <- as.numeric(paste((proj_data$Sub_metering_1)))
sub_metering_2 <- as.numeric(paste((proj_data$Sub_metering_2)))
sub_metering_3 <- as.numeric(paste((proj_data$Sub_metering_3)))
global_reactive_power <- as.numeric(paste((proj_data$Global_reactive_power)))

png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
plot(proj_data$DateTime, global_active_power, type = "l", col = "black",
     xlab = "", ylab = "Global Active Power (kilowatts)")

plot(proj_data$DateTime, voltage, type = "l", col = "black",
     xlab = "datetime", ylab = "Voltage")

plot(proj_data$DateTime, sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy sub metering")
lines(proj_data$DateTime, sub_metering_1, col = "black", type = "l")
lines(proj_data$DateTime, sub_metering_2, col = "red", type = "l")
lines(proj_data$DateTime, sub_metering_3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", 
                     "Sub_metering_3"), col = c("black", "red", "blue"), 
       lwd = 1.5, bty = "n")

plot(proj_data$DateTime, global_reactive_power, type = "l", col = "black",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()