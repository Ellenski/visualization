#Create an R figur showing Moose demographics through time with mosaic plot

#load data
setwd("/Users/enikelski/Desktop/DSI/7_Visualization/visualization/02_activities/assignments")
library(tidyverse)
Moose_data <- read.csv(file = "Moose_Population_Data_Processed.csv", header = TRUE)

#Create a line graph ploting total moose observed versus sampling effort

ggplot(Moose_data, aes(x = SurveyYear)) +
  geom_line(aes(y = Sum_Obsv_Moose), color = "indianred1", size = 1, alpha = 0.75) +
  geom_line(aes(y = Sum_Sampling_Effort*7), color = "darkgreen", size = 1, alpha = 0.85) +
  scale_x_continuous(breaks=seq(1975, 2025, 2)) +
  scale_y_continuous(name = "Total Moose Individuals Observed",
    sec.axis = sec_axis(~./7, name = "Total Sampling Effort (hrs)")) +
theme(axis.text.x = element_text(angle = 90),
      panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
      panel.background = element_blank(), axis.line = element_line(colour = "black"),
      axis.title.x = element_text(size = 18, margin = margin(t = 15)),
      axis.title.y = element_text(size = 18, color = "indianred1", margin = margin(r = 15)),
      axis.title.y.right = element_text(size = 18, color = "darkgreen", margin = margin(l = 15)),
      axis.text = element_text(size =14),
      plot.title = element_text(size = 22, margin = margin(b = 15), hjust = 0.5)
) +
  labs(x = "Survey Year", title = "How does sampling effort affect reported moose populations\n in Ontario?")
