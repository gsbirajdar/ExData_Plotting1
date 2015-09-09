plot1 <- function(){
        x <- grep("1/2/2007", readLines("household_power_consumption.txt"))[1]
        y <- grep("3/2/2007", readLines("household_power_consumption.txt"))[1]
        z <- y-x-1
        energydata <- read.table("household_power_consumption.txt", skip = grep("1/2/2007",+
        readLines("household_power_consumption.txt"))-1, nrows = z,+
        colClasses = "character", sep = ";")
        energydata$V1<- as.Date(energydata$V1, "%d/%m/%Y")
        energydata$V2<- energydata$V2 <- strftime(energydata$V2, format = "%H:%M:%S")
        colnames(energydata2) <- c("date", "time", "global_active_power",+
        "global_reactive_power", "voltage", "global_intensity", "sub_metering_1",+
        "sub_metering_2", "sub_metering_3")
        hist(energydata2$global_active_power, col = "red", xlab = "Global Active Power")
}
        