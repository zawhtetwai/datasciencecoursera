##if you have installed them before in your machine
##pleaes comment below 2 packages 
install.packages("plyr") 
install.packages("ggplot2")

##load plyr package
library(plyr)

##load ggplot2 package
library(ggplot2)

##load Emissions data
NEI <- readRDS("summarySCC_PM25.rds")

NEI_Baltimore <- subset(NEI, NEI$fips == "24510")

##calculate total emissions per year across all sources
total_emissions <- ddply(NEI_Baltimore, .(year, type), summarize, total=sum(Emissions))

##prepare the image file to write out
png("plot3.png", width=480, height=480)

##prepare ggplot
ggp <- ggplot(total_emissions, aes(year, total, color=type)) + 
            geom_line(size=2) +
		xlab("Year") + ylab(expression("Total PM"[2.5]*" Emissions (in tons)")) +
		ggtitle(expression("PM"[2.5]*" Emission in Baltimore City, Maryland"))

##print out ggplot
print(ggp)

##close the image file writing
dev.off()