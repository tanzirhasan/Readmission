# age distribution of the patient
require(ggplot2)
boxplot(age~status,data= ZSFGH_f,main=" Age Distribution by readmission status",xlab="30-day readmission status",col="green")
ggplot(ZSFGH_f,aes(age,fill= status))+geom_histogram(position = "dodge",binwidth = 10) + ggtitle("Distribution of age by readmission status")
ggplot(filter(ZSFGH_f,status==1),aes(age,fill=status))+ geom_histogram(binwidth = 10)+ ggtitle("Distribution of age of the  readmitted patients")


# race distribution
ggplot(ZSFGH_f,aes(race_cd,fill= status))+ geom_bar(position = "dodge")+ theme(axis.text.x = element_text(angle = 90, hjust = 1))+ ggtitle("Distribution of race by readmission status")
ggplot(filter(ZSFGH_f,status==1),aes(race_cd,fill= race_cd))+ geom_bar()+ theme(axis.text.x = element_text(angle = 90, hjust = 1))+ ggtitle("Distribution of race of the  readmitted patients")


# gender distribution
ggplot(ZSFGH_f,aes(gender_cd,fill= status))+ geom_bar(position = "dodge")+  ggtitle("Distribution of gender by readmission status")
ggplot(filter(ZSFGH_f,status==1),aes(gender_cd,fill= gender_cd))+ geom_bar()+ ggtitle("Distribution of gender of the  readmitted patients")

# Language distribution
ggplot(ZSFGH_f,aes(lang,fill= status))+ geom_bar()+theme(axis.text.x = element_text(angle = 90, hjust = 1))+ ggtitle("Distribution of language by readmission status")
ggplot(filter(ZSFGH_f,status==1),aes(lang,fill= lang))+ geom_bar()+ ggtitle("Distribution of language of the  readmitted patients")



# total length of stay
ggplot(ZSFGH_f,aes(tot_len_of_stay,fill= status)) + geom_density() + facet_grid(~status)+ggtitle("Distribution of total length of stay")

#Hb level
ggplot(ZSFGH_f,aes(Hb,fill= status)) + geom_histogram(position = 'dodge',binwidth = 4) +ggtitle("Distribution of Hemoglobin by readmission status")
ggplot(ZSFGH_f,aes(Hb,fill= status)) +geom_density(alpha=0.5)

ggplot(ZSFGH_f,aes(x=status,y=Hb,fill= status)) + geom_boxplot() + labs(x="30-day readmission status",y= "Hemoglobin level")+ ggtitle("Distribution of Hb level by 30-day readmission status")



#Na level
ggplot(ZSFGH_f,aes(Na,fill= status)) + geom_histogram(position = 'dodge',binwidth = 10) +ggtitle("Distribution of Sodium by readmission status")
ggplot(ZSFGH_f,aes(Na,fill= status)) +geom_density(alpha=0.5)

ggplot(ZSFGH_f,aes(x=status,y=Na,fill= status)) + geom_boxplot() + labs(x="30-day readmission status",y= "Sodium level")+ ggtitle("Distribution of Na level by 30-day readmission status")

# diagnosis group
ggplot(ZSFGH_f,aes(dx_group, fill= status))+ geom_bar(position = "dodge") +theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggplot(filter(ZSFGH_f,status==1),aes(dx_group, fill= dx_group))+ geom_bar() +theme(axis.text.x = element_text(angle = 90, hjust = 1))


# ggplot(filter(ZSFGH_e[!(is.na(ZSFGH_e$dx_group)), ],Interval <30 & Interval >0),aes(dx_group,fill=dx_group))+
# geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) 


ggplot(filter(ZSFGH_e[!(is.na(ZSFGH_e$dx_group)), ],status== 1),aes(dx_group,fill=dx_group))+
  geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) +  theme(legend.position="none")+
   ggtitle(" Distribution of diagnosis of readmitted patients")

# hospital service 

ggplot(ZSFGH_f,aes(hosp_svc, fill= status))+ geom_bar(position = "dodge") +theme(axis.text.x = element_text(angle = 90, hjust = 1))+ggtitle("Distribution of hospital Service by 30-day readmission status")

ggplot(filter(ZSFGH_f,status==1),aes(hosp_svc, fill= hosp_svc))+ geom_bar() +theme(axis.text.x = element_text(angle = 90, hjust = 1)) + ggtitle(" Distribution of hospital Service of readmitted patients")


# Zip code group

ggplot(ZSFGH_f,aes(zip_group,fill= status)) + geom_bar(position = "dodge") +theme(axis.text.x = element_text(angle = 90, hjust = 1)) + ggtitle("Distribution of patients by county")
ggplot(filter(ZSFGH_f,status==1),aes(zip_group,fill= zip_group))+ geom_bar() +theme(axis.text.x = element_text(angle = 90, hjust = 1)) + ggtitle("Distribution of readmitted patients by county")


# correlation
#install.packages("GGally")
require(GGally)
ggpairs(ZSFGH_f[sapply(ZSFGH_f,function(x)!is.factor(x))][-c(1,2)])




write.csv(ZSFGH_f, file = "ZSFGH_g.csv",row.names = FALSE)
