#setting working directory
setwd("EDA/project2")


# Reading the NEI  & SCC data
NEI <- readRDS("summaryScc_PM25.rds")
SCC <- readRDS("Source_classification_Code.rds")

TotalByYear <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png",width=480,height=480)

barplot(TotalByYear$Emissions, names.arg = TotalByYear$year, xlab = "Year", ylab = "Pm 2.5 Emissions", main = "Total pm2.5 Emission", col = "green")

dev.off()