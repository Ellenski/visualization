#Set-up

setwd("/Users/enikelski/Desktop/DSI/7_Visualization/visualization/02_activities/assignments")
library(tidyverse)

Moose_raw_data <- read.csv(file = "moose_population_monitoring_summaries_Assignment3.csv", header = TRUE)

#Get averages of moose per year

Total_Moose_Counts_Per_Year <- Moose_raw_data %>% dplyr::group_by(SurveyYear) %>%
                                dplyr::summarise(Sum_Obsv_Moose = sum(Obsv_Moose, na.rm = TRUE),
                                                 Sum_Obsv_Bull = sum(Obsv_Bull, na.rm = TRUE),
                                                 Sum_Obsv_Cow = sum(Obsv_Cow, na.rm = TRUE),
                                                 Sum_Obsv_Calf = sum(Obsv_Calf, na.rm = TRUE),
                                                 Sum_Obsv_Unk = sum(Obsv_Unk, na.rm = TRUE),
                                                 Sum_Sampling_Effort = sum(SamplingEffort, na.rm =TRUE),
                                                 Sum_Sampling_Effort_WMU = sum(SamplingEffort_WMU, na.rm = TRUE))
  
Total_Moose_Counts_Per_Year_2 <- dplyr::mutate(Total_Moose_Counts_Per_Year, 
                                               Calculated_Total_Moose = Sum_Obsv_Bull + Sum_Obsv_Cow + Sum_Obsv_Calf + Sum_Obsv_Unk)
Total_Moose_Counts_Per_Year_2 <- dplyr::mutate(Total_Moose_Counts_Per_Year_2,
                                               Prop_Bull = Sum_Obsv_Bull/Calculated_Total_Moose,
                                               Prop_Cow = Sum_Obsv_Cow/Calculated_Total_Moose,
                                               Prop_Calf = Sum_Obsv_Calf/Calculated_Total_Moose,
                                               Prop_Unk = Sum_Obsv_Unk/Calculated_Total_Moose)

write.csv(Total_Moose_Counts_Per_Year_2, file = "Moose_Population_Data_Processed.csv", row.names = FALSE)

  