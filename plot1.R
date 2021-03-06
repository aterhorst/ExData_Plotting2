# Exploratory data analysis - Course Project 2

setwd("~/ownCloud/Coursera/Exploratory Data Analysis/exdata_data_NEI_data/assignment")

# load libraries

library(dplyr)
library(reshape)

# load raw data

NEI <- readRDS("~/ownCloud/Coursera/Exploratory Data Analysis/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/ownCloud/Coursera/Exploratory Data Analysis/exdata_data_NEI_data/Source_Classification_Code.rds")

# Question 1

sink()
png("plot1.png", width = 480, height = 480, units = "px")
tot_emissions <- aggregate(Emissions ~ year, data=NEI, FUN = sum)
options(scipen = 8)
par(mar = c(5,8,4,4))
bp <- barplot(tot_emissions$Emissions, tot_emissions$year, las = 1, names.arg = tot_emissions$year, axes = T, main = "Total PM2.5 Emissions - USA", xlab = "Year")
title(ylab = "Tons", line = 5)
lines(bp, tot_emissions$Emissions, lwd = 4, col = "blue")
dev.off()

