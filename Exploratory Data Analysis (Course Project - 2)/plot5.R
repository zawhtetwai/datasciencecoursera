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
NEI_BM_LA <- subset(NEI, NEI$fips == "24510" | NEI$fips == "06037")
SCC <- readRDS("Source_Classification_Code.rds")

##find rows which are including 'vehicle' in SCC data set
vehicle_match <- grepl("vehicle", SCC$EI.Sector, ignore.case=T)

##retrieve rows which are including 'vehicle' from SCC data set
SCC_Coal_Comb <- SCC[vehicle_match ,]

##retrieve rows which are including 'vehicle' from NEI data set
NEI_SCC <- subset(NEI_Baltimore, NEI_Baltimore$SCC %in% SCC_Coal_Comb$SCC)


##calculate total emissions per year from vehicle sources
total_emissions <- ddply(NEI_SCC, .(year), summarize, total=sum(Emissions))

##prepare the image file to write out
png("plot5.png", width=480, height=480)

##prepare ggplot
ggp <- ggplot(total_emissions, aes(year, total)) + 
            geom_line(size=2) +
		xlab("Year") + ylab(expression("Total PM"[2.5]*" Emissions (in tons)")) +
		ggtitle(expression("PM"[2.5]*" Emissions from Motor Vehicle Sources in Baltimore, Maryland"))

##print out ggplot
print(ggp)

##close the image file writing
dev.off()