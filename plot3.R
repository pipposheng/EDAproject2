library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_Baltimore <- subset(NEI, fips == "24510")
ggplot(NEI_Baltimore, aes(factor(year), Emissions, fill = type)) + 
  geom_bar(stat="identity") + facet_grid(.~type) + 
  labs(x = "year", y = "Annual PM2.5 Emission (ton)", 
       title = "Annual PM2.5 Emission in Baltimore City by Source Type")
dev.print(png, file = "plot3.png", width = 720, height = 480)
dev.off()