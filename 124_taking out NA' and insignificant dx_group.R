

colnames(ZSFGH_h)

ZSFGH_i <-ZSFGH_h[!(is.na(ZSFGH_h$dx_group)) & !(ZSFGH_h$dx_group=="Factors influencing h status & contact hservices"),]

ggplot(filter(ZSFGH_i,status=="Readmitted"),aes(dx_group, fill= dx_group))+ geom_bar(aes(y = (..count..)/sum(..count..)))+
  #geom_text(aes(y = ((..count..)/sum(..count..)), label = scales::percent((..count..)/sum(..count..))), stat = "count", vjust = -0.25)+
  scale_y_continuous(labels = percent)+ theme(axis.title.y=element_blank(),axis.text.x = element_text(angle = 90, hjust = 1),legend.position="none")+
  ggtitle("Distribution of readmitted patients by dx group")
nrow(ZSFGH_i)
#8691
ggplot(filter(ZSFGH_i,status=="Readmitted"),aes(homelessness, fill= homelessness))+ geom_bar(aes(y = (..count..)/sum(..count..)))+
  #geom_text(aes(y = ((..count..)/sum(..count..)), label = scales::percent((..count..)/sum(..count..))), stat = "count", vjust = -0.25)+
  scale_y_continuous(labels = percent)+ theme(axis.title.y=element_blank(),axis.text.x = element_text(angle = 90, hjust = 1),legend.position="none")+
  ggtitle("Distribution of readmitted patients by homelessness")



ggplot(ZSFGH_i,aes(homelessness,fill=status))+ geom_bar(aes(y = (..count..)/sum(..count..)),position = "dodge")+
  geom_text(aes(y = ((..count..)/sum(..count..)), label = scales::percent((..count..)/sum(..count..))), stat = "count", vjust = -0.25)+
  scale_y_continuous(labels = percent)+ theme(axis.title.y=element_blank(),axis.text.x = element_text(angle = 90, hjust = 1))+ ggtitle("Distribution of patients by homelessness")

nrow(ZSFGH_i)
#######
# total length of stay
ggplot(ZSFGH_i,aes(tot_len_of_stay,fill= status)) + geom_density() + facet_grid(~status)+ggtitle("Distribution of total length of stay")
#ggplot(ZSFGH_i,aes(x= status,y=tot_len_of_stay,fill= status)) + geom_boxplot()+ggtitle("Distribution of total length of stay")
#Hb level
ggplot(ZSFGH_i,aes(Hb,fill= status)) + geom_histogram(position = 'dodge',binwidth = 4) +ggtitle("Distribution of Hemoglobin by readmission status")
ggplot(ZSFGH_i,aes(Hb,fill= status)) +geom_density(alpha=0.5)

ggplot(ZSFGH_i,aes(x=status,y=Hb,fill= status)) + geom_boxplot() + labs(x="30-day readmission status",y= "Hemoglobin level")+ ggtitle("Distribution of Hb level by 30-day readmission status")



#Na level
ggplot(ZSFGH_i,aes(Na,fill= status)) + geom_histogram(position = 'dodge',binwidth = 10) +ggtitle("Distribution of Sodium by readmission status")
ggplot(ZSFGH_i,aes(Na,fill= status)) +geom_density(alpha=0.5)

ggplot(ZSFGH_i,aes(x=status,y=Na,fill= status)) + geom_boxplot() + labs(x="30-day readmission status",y= "Sodium level")+ ggtitle("Distribution of Na level by 30-day readmission status")




#####




# getting the row with MRN number that appeared more than once
ZSFGH_x <-ZSFGH_i[(duplicated(ZSFGH_i$MRN, fromLast = FALSE)|duplicated(ZSFGH_i$MRN, fromLast = TRUE)),]
nrow(ZSFGH_x)
#3182

nrow(ZSFGH_x %>%group_by(MRN)%>% slice(which.min(Interval)))

View(ZSFGH_x %>%group_by(MRN))


ZSFGH_x %>%group_by(MRN)%>% filter(MRN=="78088")%>% slice(which.min(Interval))



ZSFGH_x %>%group_by(MRN)%>% filter(status=="Readmitted")%>%select(MRN)%>%as.vector 
catch <-ZSFGH_x%>% filter(status=="Readmitted")%>%select(MRN)%>%sapply(as.vector) 

ZSFGH_x %>%group_by(MRN)%>% filter(MRN=="78088")%>% slice(which.min(Interval))
catch
class(catch)
length(catch)
#906
"78088" %in% catch
View(ZSFGH_x %>% group_by(MRN)%>%filter(MRN %in% catch)%>% slice(which.min(Interval)))
nrow(ZSFGH_x %>% group_by(MRN)%>%filter(MRN %in% catch)%>% slice(which.min(Interval)))
# 593
data_mod_raw <- ZSFGH_x %>% group_by(MRN)%>%filter(MRN %in% catch)%>% slice(which.min(Interval))
data_mod_raw1 <- as.data.frame(data_mod_raw)
data_mod_raw1$ulti_stat <-rep("yes",nrow(data_mod_raw))
class(data_mod_raw1)
data_rest <-ZSFGH_x[!(ZSFGH_x$MRN %in%catch),] 
View(data_rest)
data_rest1 <- subset(data_rest, data_rest$Interval== 0)
class(data_mod_raw1)
class(data_rest1)
data_rest1$ulti_stat <- rep("no",nrow(data_rest1))

data_inter <- rbind(data_mod_raw1, data_rest1)
View(data_inter)
data_inter$ulti_stat <- as.factor(data_inter$ulti_stat)

str(data_inter)
View(data_inter)

nrow(data_inter)
colnames(data_inter)


data_mod <- data_inter[c(-1,-2, -5,-9,-10,-14, -16)]
head(data_mod)

write.csv(data_mod, "data_mod.csv", row.names = FALSE)


t.test(Hb~ status, data=ZSFGH_i)
#t.test(Hb~ status, data=ZSFGH_i, subset = status %in% c("Readmitted","Not_readmitted"))
t.test(Na~ status, data=ZSFGH_i)
t.test(tot_len_of_stay~ status, data=ZSFGH_i)
