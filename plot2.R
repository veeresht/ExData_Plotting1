source("dataRead.R")

proj_data <- load_project_data()

x <- as.numeric(paste((proj_data$Global_active_power)))

png(file = "plot2.png", width = 480, height = 480, units = "px", 
    bg = "transparent")
plot(proj_data$DateTime, x, type = "l", col = "black",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()