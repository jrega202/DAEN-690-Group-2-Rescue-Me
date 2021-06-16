setwd("~/DAEN690")
library(ggplot2)
Capacity <- read.csv(file = "GMU_2021_Summer_Capacity.csv")
Capacity$IncidentShift <- paste(Capacity$IncidentNumber, Capacity$Shift)   #combine incident and shift to create a key
IncShift <- Capacity$IncidentShift           #Create separate dataset for key column
IncShift <- data.frame(unique(IncShift))    #Remove duplicate entries, do not want to count a shift twice reacting to an incident. Although it may have been a different unit it was same shift.
IncShift$Shift <- substr(IncShift$unique.IncShift., 11, 12)
ShiftALL <- aggregate(data.frame(count = IncShift$Shift), list(value = IncShift$Shift), length)
ggplot(IncShift, aes(x = as.factor(Shift), fill=as.factor(Shift))) +
  geom_bar() +
  scale_fill_manual(values = c("red", "dark green", "black")) +
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white",size=10) +
  xlab("Shift") + ylab("Repsonse Count") + ggtitle("Incident Response Count per Shift 2017-2020") +
  theme(text = element_text(size = 20)) 