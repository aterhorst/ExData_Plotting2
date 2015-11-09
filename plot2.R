# Exploratory data analysis - Course Project 2

setwd("~/ownCloud/Coursera/Exploratory Data Analysis/exdata_data_NEI_data/assignment")

# load libraries

library(dplyr)
library(reshape)

# load raw data

NEI <- readRDS("~/ownCloud/Coursera/Exploratory Data Analysis/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/ownCloud/Coursera/Exploratory Data Analysis/exdata_data_NEI_data/Source_Classification_Code.rds")

# Question 2

sink()
png("plot2.png", width = 480, height = 480, units = "px")
balt_data <- NEI[which(NEI$fips == '24510'),]
tot_balt_emissions <- aggregate(Emissions ~ year, data = balt_data, FUN = sum)
options(scipen = 8)
par(mar = c(5,8,4,4))
bp <- barplot(tot_balt_emissions$Emissions, tot_balt_emissions$year, las = 1, names.arg = tot_balt_emissions$year, axes = T, main = "Total PM2.5 Emissions - Baltimore", xlab = "Year")
title(ylab = "Tons", line = 4)
lines(bp, tot_balt_emissions$Emissions, lwd = 4, col = "blue")
dev.off()

