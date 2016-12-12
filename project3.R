setwd("C:/Sam/Second Year/BME 213/R Code")

library(tidyr)
library(dplyr)
library(ggplot2)

d1 <- read.csv('trial1_data_formatted.csv')

names(d1)[4] = "EyeWash_Viable"
names(d1)[5] = "Eyewash_NonViable"
names(d1)[6] = "Cytology_Viable"
names(d1)[7] = "Cytology_NonViable"

timeLabel <- c("2" = "2 Hours",  "4" = "4 Hours")
treatmentLabel <- c("1" = "Treatment 1", "2" = "Treatment 2")

p <- ggplot(d1, aes(x= EyeWash_Count , y = EyeWash_Viability)) +
  geom_point() +
  stat_smooth(method = lm) +
  # facet_grid(Condition ~ Visit_ID, labeller = labeller(Visit_ID = timeLabel, Condition = treatmentLabel)) +
  ylab("Eyewash Viability") +
  xlab("Total Cell Count for EyeWash") +
  ggtitle("Viability vs Cell Count for Eyewash")
p

p <- ggplot(d1, aes(x= Cytology_Count , y = Cytology_Viability)) +
  geom_point() +
  # stat_smooth(method = lm, colour = 'red', se = FALSE) +
  # facet_grid(Condition ~ Visit_ID, labeller = labeller(Visit_ID = timeLabel, Condition = treatmentLabel)) +
  stat_smooth(method = lm) +
  ylab("Cytology Viability") +
  xlab("Total Cell Count for Cytology") +
  ggtitle("Viability vs Cell Count for Cytology")
p

p <- ggplot() +
  geom_point(data = d1, aes(x= Cytology_Count , y = Cytology_Viability), size = 0.5, colour = "red") +
  geom_point(data = d1, aes(x= EyeWash_Count , y = EyeWash_Viability), size = 0.5, colour = "blue") +
  stat_smooth(method = 'lm', aes(x= Cytology_Count , y = Cytology_Viability), se = FALSE) +
  stat_smooth(method = 'lm', aes(x= EyeWash_Count , y = EyeWash_Viability), se = FALSE) +
  ylab("Viability") +
  xlab("Total Cell Count")
p

p <- ggplot(d1, aes(x= Total_Count , y = Total_Viability)) +
  geom_point() +
  stat_smooth(method = lm, colour = 'red', se = FALSE) +
  facet_grid(Condition ~ Visit_ID, labeller = labeller(Visit_ID = timeLabel, Condition = treatmentLabel)) +
  ylab("Total Viability") +
  xlab("Total Cell Count")
p
