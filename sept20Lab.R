getwd()
setwd("C:/Sam/Second Year/BME 213/R Code")
ls()

library(dplyr)
library(ggplot2)
library(tidyr)
library(svglite)

m.ori <- read.csv('MnSODinfectiondata.csv', check.name = FALSE)
print(m.ori)
summary(m.ori)

m <- gather(m.ori, 'Status', 'Value', -Sample)
m <- separate(m, Sample, c('Concentration', 'Replicate'), sep = '-')
m <- separate(m, Status, c('Time', 'Status'), sep = 'Hours ')

m.spread <- spread(m, Status, Value)

m.mean <- m.spread %>%
  group_by(Time, Concentration) %>%
  mutate(Viability = Alive / (Alive + Dead))
  
p <- ggplot(m.mean,aes(x = Time, y = Viability, colour = Concentration, group = Concentration)) +
  geom_point(size = 1)+ 
  geom_line(size = 1)

m.Avg <- m.mean %>%
  group_by(Time, Concentration) %>%
  summarize(Viability = mean(Viability))

p.Avg <- ggplot(m.Avg,aes(x = Time, y = Viability, colour = Concentration, group = Concentration)) +
  geom_point(size = 1)+ 
  geom_line(size = 1)