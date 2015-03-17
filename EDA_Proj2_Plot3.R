# Exploratory Data Analysis Project 2 Plot 3
# DKS481
# 17 March 2015

# Check and Load Data
if (!"neiData" %in% ls()) {
  neiData <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  sccData <- readRDS("./data/Source_Classification_Code.rds")
}
#Subset
subset <- neiData[neiData$fips == "24510", ] 


# Create and Generate Plot to Answer Question 3
library(ggplot2)
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "EDA_Proj2_plot3.png", 
    width = 480, height = 480, 
    units = "px")
g <- ggplot(subset, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Baltimore City Total Emissions, 1999 to 2008")
dev.off()

# Question
# 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, 
#   nonroad) variable, which of these four sources have seen decreases in 
#   emissions from 1999-2008 for Baltimore City? Which have seen increases in 
#   emissions from 1999-2008? Use the ggplot2 plotting system to make a plot 
#   answer this question.