




ZSFGH_h$status <- as.factor(ZSFGH_h$status)
levels(ZSFGH_h$status) <- c("Not_readmitted", "Readmitted")

levels(ZSFGH_h$race_cd) <-c("White","African American","other race","Asian","American Indian","Pacific Islander","Decline to specify")
summary(ZSFGH_h$race_cd)
summary(ZSFGH_h) 
library(scales)
require(ggplot2)
require(dplyr)
#ggplot(filter(ZSFGH_h,Interval <30 & Interval >0)) +geom_bar(mapping = aes(x=race_cd,y=..prop..,group=1))+scale_y_continuous(labels = percent)

# Bar chart for gender
ggplot(ZSFGH_h,aes(race_cd,fill= status))+ geom_bar(position = "dodge")+ theme(axis.text.x = element_text(angle = 90, hjust = 1))+ ggtitle("Distribution of race by readmission status")


ggplot(ZSFGH_h,aes(gender_cd,fill=status))+ geom_bar(aes(y = (..count..)/sum(..count..)),position = "dodge")+
  geom_text(aes(y = ((..count..)/sum(..count..)), label = scales::percent((..count..)/sum(..count..))), stat = "count", vjust = -.5)+
  scale_y_continuous(labels = percent)+ theme(axis.title.y=element_blank())+ggtitle("Distribution of gender by readmission status")

ggplot(filter(ZSFGH_h,status == "Readmitted"),aes(gender_cd,fill=gender_cd))+ geom_bar(aes(y = (..count..)/sum(..count..)))+
  geom_text(aes(y = ((..count..)/sum(..count..)), label = scales::percent((..count..)/sum(..count..))), stat = "count", vjust = -0.25)+
  scale_y_continuous(labels = percent)+ theme(axis.title.y=element_blank())+ ggtitle("Distribution of gender of the  readmitted patients")



# Bar chart for race

ggplot(ZSFGH_h,aes(race_cd,fill=status))+ geom_bar(aes(y = (..count..)/sum(..count..)),position = "dodge")+
  geom_text(aes(y = ((..count..)/sum(..count..)), label = scales::percent((..count..)/sum(..count..))), stat = "count", vjust = -0.25)+
  scale_y_continuous(labels = percent)+ theme(axis.title.y=element_blank(),axis.text.x = element_text(angle = 90, hjust = 1))+ ggtitle("Distribution of race of the  readmitted patients")

ggplot(filter(ZSFGH_h,status == "Readmitted"),aes(race_cd,fill=race_cd))+ geom_bar(aes(y = (..count..)/sum(..count..)))+
geom_text(aes(y = ((..count..)/sum(..count..)), label = scales::percent((..count..)/sum(..count..))), stat = "count", vjust = -0.25)+
  scale_y_continuous(labels = percent)+ theme(axis.title.y=element_blank(),axis.text.x = element_text(angle = 90, hjust = 1))+ ggtitle("Distribution of race by readmission status")

# Language distribution


ggplot(filter(ZSFGH_h,status == "Readmitted"),aes(lang,fill=lang))+ geom_bar(aes(y = (..count..)/sum(..count..)))+
  geom_text(aes(y = ((..count..)/sum(..count..)), label = scales::percent((..count..)/sum(..count..))), stat = "count", vjust = -0.25)+
  scale_y_continuous(labels = percent)+ theme(axis.title.y=element_blank(),axis.text.x = element_text(angle = 90, hjust = 1))+ ggtitle("Distribution of language by readmission status")

# diagnosis group
ggplot(ZSFGH_h,aes(dx_group, fill= status))+ geom_bar(aes(y = (..count..)/sum(..count..)),position = "dodge") +
  #geom_text(aes(y = ((..count..)/sum(..count..)), label = scales::percent((..count..)/sum(..count..))), stat = "count", vjust = -0.25)+
  scale_y_continuous(labels = percent)+ theme(axis.title.y=element_blank(),axis.text.x = element_text(angle = 90, hjust = 1))+ ggtitle("Distribution of dx group of the  readmitted patients")

# diagnosis group after removal on NA
ggplot(filter(ZSFGH_h[!(is.na(ZSFGH_h$dx_group)),]),aes(dx_group, fill= status))+ geom_bar(aes(y = (..count..)/sum(..count..)),position = "dodge") +
  #geom_text(aes(y = ((..count..)/sum(..count..)), label = scales::percent((..count..)/sum(..count..))), stat = "count", vjust = -0.25)+
  scale_y_continuous(labels = percent)+ theme(axis.title.y=element_blank(),axis.text.x = element_text(angle = 90, hjust = 1))+ ggtitle("Distribution of dx group of the  readmitted patients")



# diagnosis group only readmit

ggplot(filter(ZSFGH_h[!(is.na(ZSFGH_h$dx_group)),],status=="Readmitted"),aes(dx_group, fill= dx_group))+ geom_bar(aes(y = (..count..)/sum(..count..)))+
  #geom_text(aes(y = ((..count..)/sum(..count..)), label = scales::percent((..count..)/sum(..count..))), stat = "count", vjust = -0.25)+
  scale_y_continuous(labels = percent)+ theme(axis.title.y=element_blank(),axis.text.x = element_text(angle = 90, hjust = 1),legend.position="none")+
  ggtitle("Distribution of dx group by readmission status")

