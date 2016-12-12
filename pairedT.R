setwd("C:/Sam/Second Year/BME 213/R Code")

library(tidyr)
library(dplyr)
library(ggplot2)

d1 <- read.csv('trial1_data_formatted.csv')
time2 = d1[d1$Condition==1,];
time4 = d1[d1$Condition==2,];

 
t.test(d1$EyeWash_Viability[d1$Condition==1 & d1$Visit_ID == 2], d1$EyeWash_Viability[d1$Condition==2 & d1$Visit_ID == 2], paired = TRUE);

cor(d1$Total_Viability[d1$Condition==2 & d1$Visit_ID == 2], d1$Total_Count[d1$Condition==2 & d1$Visit_ID == 2]);
cor(d1$Total_Viability[d1$Condition==2 & d1$Visit_ID == 4], d1$Total_Count[d1$Condition==2 & d1$Visit_ID == 4]);

cor(d1$Total_Viability[d1$Condition==1], d1$Total_Count[d1$Condition==1]);
cor(d1$Total_Viability[d1$Condition==2], d1$Total_Count[d1$Condition==2]);
