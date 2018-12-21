library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC_coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE),]
NEI_coal <- merge(NEI,SCC_coal,by = "SCC")
PM_coal <- tapply(NEI_coal$Emissions, NEI_coal$year, sum)
barplot(PM_coal, xlab = "Year", ylab = "Annual Total Emission from Coal (ton)", 
        main = "Annual Emission from Coal-Combustion Related Sources")
dev.print(png, file = "plot4.png", width = 480, height = 480)
dev.off()