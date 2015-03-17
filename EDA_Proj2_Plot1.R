# Exploratory Data Analysis Project 2 Plot 1
# DKS481
# 17 March 2015

#Check and Load Data
if (!"neiData" %in% ls()) {
  neiData <- readRDS("summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  sccData <- readRDS("Source_Classification_Code.rds")
}

# Create and Generate Plot to Answer Question 1
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "EDA_Proj2_plot1.png", 
    width = 480, height = 480, 
    units = "px")
totalEmissions <- aggregate(neiData$Emissions, list(neiData$year), FUN = "sum")
plot(totalEmissions, type = "l", xlab = "Year", 
     main = "United States Total Emissions, 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()

# Question
# 1. Have total emissions from PM2.5 decreased in the United States from 
#     1999 to 2008? Using the base plotting system, make a plot showing 
#     the total PM2.5 emission from all sources for each of the years 
#     1999, 2002, 2005, and 2008.

