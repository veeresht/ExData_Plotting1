source("dataRead.R")

proj_data <- load_project_data()

sub_metering_1 <- as.numeric(paste((proj_data$Sub_metering_1)))
sub_metering_2 <- as.numeric(paste((proj_data$Sub_metering_2)))
sub_metering_3 <- as.numeric(paste((proj_data$Sub_metering_3)))

png(file = "plot3.png", width = 480, height = 480, units = "px",
    bg = "transparent")
plot(proj_data$DateTime, sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy sub metering")
lines(proj_data$DateTime, sub_metering_1, col = "black", type = "l")
lines(proj_data$DateTime, sub_metering_2, col = "red", type = "l")
lines(proj_data$DateTime, sub_metering_3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", 
                     "Sub_metering_3"), col = c("black", "red", "blue"), 
       lwd = 1.5)
dev.off()

