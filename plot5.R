library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_Baltimore <- subset(NEI, fips == "24510")
SCC_vehicle <- SCC[grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE),]
NEI_vehicle <- merge(NEI_Baltimore,SCC_vehicle,by = "SCC")
PM_vehicle <- tapply(NEI_vehicle$Emissions, NEI_vehicle$year, sum)
barplot(PM_vehicle, xlab = "Year", ylab = "Annual Total Emission from Vehicle (ton)", 
        main = "Annual Emission from Motor Vehicle Sources in Baltimore City")
dev.print(png, file = "plot5.png", width = 480, height = 480)
dev.off()