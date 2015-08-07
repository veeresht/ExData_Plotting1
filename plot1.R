source("dataRead.R")

proj_data <- load_project_data()

x <- as.numeric(paste((proj_data$Global_active_power)))

png(file = "plot1.png", width = 480, height = 480, units = "px",
    bg = "transparent")
hist(x, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
