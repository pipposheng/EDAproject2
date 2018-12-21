library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_Baltimore <- subset(NEI, fips == "24510")
PM_Baltimore <- tapply(NEI_Baltimore$Emissions, NEI_Baltimore$year, sum)
barplot(Emission_Baltimore, xlab = "Year", ylab = "Annual Total Emission (ton)",
        main = "Total PM2.5 Emission per Year in Baltimore City")
dev.print(png, file = "plot2.png", width = 480, height = 480)
dev.off()