library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
PM_Annual <- tapply(NEI$Emissions, NEI$year, sum)
barplot(PM_Annual, xlab = "Year", ylab = "Annual Total Emission (ton)",
     main = "Total PM2.5 Emission per Year in US")
dev.print(png, file = "plot1.png", width = 480, height = 480)
dev.off()