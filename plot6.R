library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_Baltimore <- subset(NEI, fips == "24510")
NEI_LA <- subset(NEI, fips == "06037")
NEI_vehicle_BM <- merge(NEI_Baltimore,SCC_vehicle,by = "SCC")
NEI_vehicle_BM$city <- "Baltimore City"
NEI_vehicle_LA <- merge(NEI_LA,SCC_vehicle,by = "SCC")
NEI_vehicle_LA$city <- "Los Angeles County"
PM_Comparison <- rbind(NEI_vehicle_BM,NEI_vehicle_LA)

ggplot(PM_Comparison, aes(factor(year), Emissions, fill = city)) + 
  geom_bar(stat="identity") + 
  facet_grid(.~city) + 
  labs(x="year", y="Annual PM2.5 Emission (ton)", 
  title="Annual PM2.5 Emission from Vehicle in Baltimore City vs Los Angeles County")
dev.print(png, file = "plot6.png", width = 640, height = 480)
dev.off()
