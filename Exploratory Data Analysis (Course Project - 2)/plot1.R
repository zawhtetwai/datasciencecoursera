##to make sure plyr package has been installed
install.packages("plyr") 

##load plyr package
library(plyr)

##load Emissions data
NEI <- readRDS("summarySCC_PM25.rds")

##calculate total emissions per year across all sources
total_emissions <- ddply(NEI, .(year), summarize, total=sum(Emissions))

##prepare the image file to write out
png("plot1.png", width=480, height=480)

plot(total_emissions, type = "l",
main = expression("PM"[2.5]*" Emissions in the United States"),
xlab = "Year", ylab = expression("Total PM"[2.5]*" Emissions (in tons)"))

##close the image file writing
dev.off()