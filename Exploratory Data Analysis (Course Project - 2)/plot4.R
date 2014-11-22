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
SCC <- readRDS("Source_Classification_Code.rds")

##find rows which including 'coal' in SCC data set
coal_match <- grepl("coal", SCC$Short.Name, ignore.case=T)

##find rows which are including 'comb' in SCC data set
combustion_match <- grepl("comb", SCC$EI.Sector, ignore.case=T)

##retrieve rows which are including 'coal' and 'comb' from SCC data set
SCC_Coal_Comb <- SCC[coal_match & combustion_match,]

##retrieve rows which are including 'coal' and 'comb' from NEI data set
NEI_SCC <- subset(NEI, NEI$SCC %in% SCC_Coal_Comb$SCC)


##calculate total emissions per year from coal combustion sources
total_emissions <- ddply(NEI_SCC, .(year), summarize, total=sum(Emissions))

##prepare the image file to write out
png("plot4.png", width=480, height=480)

##prepare ggplot
ggp <- ggplot(total_emissions, aes(year, total)) + 
            geom_line(size=2) +
		xlab("Year") + ylab(expression("Total PM"[2.5]*" Emissions (in tons)")) +
		ggtitle(expression("PM"[2.5]*" Emissions from Coal Combustion-related Sources"))

##print out ggplot
print(ggp)

##close the image file writing
dev.off()