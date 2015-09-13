##Following is the function to creat four different plots to show how household energy usage
##varies over a 2-day period in February, 2007. The data was taken
## from "Individual household electric power consumption Data Set" available at UCI
##Machine Learning Repository (as part of assignment1 for the course 'exdata-032' on coursera)

##PLEASE REMEMBER, following function assumes that there is a txt file named
##"household_power_consumption.txt" downloaded from:
##https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##and extracted in 'your working directory'
plot4 <- function(){
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
##Code to produce plot4 of assignment######################
        png("ExData_Plotting1/plot4.png", width = 480, height = 480, units="px")
        par(mfrow=c(2,2))
        plot(energydata$time, energydata$global_active_power, type="l", 
                ylab = "Global Active Power (kilowatts)", xlab="")
        plot(energydata$time, energydata$voltage, type="l", 
             ylab = "Voltage", xlab="datetime")
        plot(energydata$time, energydata$sub_metering_1, axes = FALSE, ylim = c(0,40), xlab = "", 
             ylab ="", col="black", type="l", main="")
        par(new=T)
        plot(energydata$time, energydata$sub_metering_2, axes = FALSE, ylim = c(0,40), xlab = "",
                ylab ="", col="red", type="l", main="")
        par(new=T)
        plot(energydata$time, energydata$sub_metering_3, ylim = c(0,40), xlab = "",
                ylab ="Energy sub mittering", col="blue", type="l", main="")
        legend("topright", pch = c('__','__','__'), col = c("black", "red", "blue"), 
                legend = c("sub_mittering_1", "sub_mittering_2", "sub_mittering_3"))
        plot(energydata$time, energydata$global_reactive_power, type="l", 
        ylab = "Global_reactive_power", xlab="datetime")
        dev.off()
}