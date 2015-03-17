# Exploratory Data Analysis Project 2 Plot 6
# DKS481
# 17 March 2015

# Get and Check Data 
if (!"neiData" %in% ls()) {
  neiData <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  sccData <- readRDS("./data/Source_Classification_Code.rds")
}
#Subset
subset <- neiData[neiData$fips == "24510"|neiData$fips == "06037", ]

# Create and Generate Plot to Answer Question 6
library(ggplot2)
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "EDA_Proj2_plot6.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")
motor <- grep("motor", sccData$Short.Name, ignore.case = T)
motor <- sccData[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]

g <- ggplot(motor, aes(year, Emissions, color = fips))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Comparison of Total Emissions From Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County, 1999 to 2008") +
  scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))
dev.off()

# Question
# 6. Compare emissions from motor vehicle sources in Baltimore City with 
#   emissions from motor vehicle sources in Los Angeles County, California 
#   (fips == "06037"). Which city has seen greater changes over time in motor 
#   vehicle emissions?