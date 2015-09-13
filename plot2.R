##Following is the function to show the distrbution of Global active power variable (over days)
##from "Individual household electric power consumption Data Set" available at UCI
##Machine Learning Repository (as part of assignment1 for the course 'exdata-032' on coursera)

##PLEASE REMEMBER, following function assumes that there is a txt file named
##"household_power_consumption.txt" downloaded from:
##https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##and extracted in 'your working directory'
plot2 <- function(){
##Code to load required data to R and tranform to appropriate classes for analysis#######
        options(warn = -1)
        x <- grep("1/2/2007", readLines("household_power_consumption.txt"))[1]
        y <- grep("3/2/2007", readLines("household_power_consumption.txt"))[1]
        p <- y-x
        energydata <- read.table("household_power_consumption.txt", skip = grep("1/2/2007", 
                        readLines("household_power_consumption.txt"))-1, nrows = p, sep = ";")
        datetime <- paste(energydata$V1, energydata$V2)
        energydata$V1 <- as.Date(energydata$V1, format="%d/%m/%Y")
        energydata$V2 <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
        colnames(energydata) <- c("date", "time", "global_active_power", "global_reactive_power", 
                                  "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", 
                                  "sub_metering_3")
##Code to produce plot2 of assignment######################
        png("ExData_Plotting1/plot2.png", width = 480, height = 480, units="px")
        plot(energydata$time, energydata$global_active_power, type="l", 
            ylab = "Global Active Power (kilowatts)", xlab="")
        dev.off()
}