###AVL Dataset Quality Evaluation
setwd("~/DAEN690")

AVL <- read.csv(file = "GMU_2021_Summer_AVL.csv", header = FALSE, fileEncoding="UTF-8-BOM")
AVL <- setNames(AVL, c("AVL_IncidentNumber","AVL_UnitID","AVL_Timestamp", "AVL_UnitStatus","AVL_Speed"))
CAD <- read.csv(file = 'GMU_2021_Summer_CAD.csv')
CAD$CAD_IncidentNumber[CAD$CAD_IncidentNumber == ""] <- NA
sum(is.na(CAD$CAD_IncidentNumber))
41226350-23314404

##Completeness
###AVL_IncidentNumber
#Replace empty elements as NA values
AVL$AVL_IncidentNumber[AVL$AVL_IncidentNumber == ""] <- NA
sum(is.na(AVL$AVL_IncidentNumber))
#[1] 23314404
mean(is.na(AVL$AVL_IncidentNumber))
#[1] 0.5655219

###AVL_UnitID
AVL$AVL_UnitID[AVL$AVL_UnitID == ""] <- NA
sum(is.na(AVL$AVL_UnitID))
#[1] 0

###AVL_Timestamp
AVL$AVL_Timestamp[AVL$AVL_Timestamp == ""] <- NA
sum(is.na(AVL$AVL_Timestamp))
#[1] 0

###AVL_UnitStatus
AVL$AVL_UnitStatus[AVL$AVL_UnitStatus == ""] <- NA
sum(is.na(AVL$AVL_UnitStatus))
#[1] 181
mean(is.na(AVL$AVL_UnitStatus))
subset(AVL,is.na(AVL_UnitStatus))

###AVL_Speed
AVL$AVL_Speed[AVL$AVL_Speed == ""] <- NA
sum(is.na(AVL$AVL_Speed))
#[1] 0

###Consistency
#Explore ranges and outliers
Un1 <- unique(AVL$AVL_IncidentNumber)
unique(data.frame(Group=Un1, x=nchar(Un1))$x)
#All elements in IncidentNumber are of length 10 or are value N/A, shows consistency
range(AVL$AVL_IncidentNumber, na.rm=TRUE)

#AVL_UnitID
range(AVL$AVL_UnitID, na.rm=TRUE)
unique(AVL[c("AVL_UnitID")])

#AVL_Timestamp
range(AVL$AVL_Timestamp, na.rm=TRUE)
AVL$AVL_Date <- substr(AVL$AVL_Timestamp, 0, 8)
range(AVL$AVL_Date)
#"20170101" "20201231"

#AVL_UnitStatus
unique(AVL[c("AVL_UnitStatus")])
unique(AVL[c("AVL_Speed")])