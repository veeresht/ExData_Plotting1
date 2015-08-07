

load_project_data <- function() {
    if(file.exists("household_power_consumption.zip")) {
        proj_data <- read.table(unz("household_power_consumption.zip", 
                                "household_power_consumption.txt"), 
                                header=T, quote="\"", sep=";")
    }
    else if(file.exists("household_power_consumption.txt")) {
        proj_data <- read.table("household_power_consumption.txt", 
                                header=T, quote="\"", sep=";")
    }
    else {
        stop('Dataset file (.zip or .txt) not found in the 
             working directory for the project!')
    }
    
    # Convert Date and Time columns from integers to datetime type
    proj_data$DateTime <- strptime(paste(proj_data$Date, proj_data$Time), 
                                   format = "%d/%m/%Y %H:%M:%S")
    proj_data$Date <- strptime(proj_data$Date, format = "%d/%m/%Y")
    proj_data$Time <- strptime(proj_data$Time, format = "%H:%M:%S")

    # Select subset of data from 2007-02-01 and 2007-02-02
    proj_data_subset <- proj_data[(proj_data$Date == "2007-02-01" | 
                                   proj_data$Date == "2007-02-02"), ]
}