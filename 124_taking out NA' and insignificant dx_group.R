

colnames(ZSFGH_h)

ZSFGH_i <-ZSFGH_h[!(is.na(ZSFGH_h$dx_group)) & !(ZSFGH_h$dx_group=="Factors influencing h status & contact hservices"),]

ggplot(filter(ZSFGH_i,status=="Readmitted"),aes(dx_group, fill= dx_group))+ geom_bar(aes(y = (..count..)/sum(..count..)))+
  #geom_text(aes(y = ((..count..)/sum(..count..)), label = scales::percent((..count..)/sum(..count..))), stat = "count", vjust = -0.25)+
  scale_y_continuous(labels = percent)+ theme(axis.title.y=element_blank(),axis.text.x = element_text(angle = 90, hjust = 1),legend.position="none")+
  ggtitle("Distribution of dx group by readmission status")
nrow(ZSFGH_i)
#8691

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
data_mod_raw1$ulti_stat <-rep(1,nrow(data_mod_raw))
class(data_mod_raw1)
data_rest <-ZSFGH_x[!(ZSFGH_x$MRN %in%catch),] 
View(data_rest)
data_rest1 <- subset(data_rest, data_rest$Interval== 0)
class(data_mod_raw1)
class(data_rest1)
data_rest1$ulti_stat <- rep(0,nrow(data_rest1))

data_inter <- rbind(data_mod_raw1, data_rest1)
View(data_inter)
data_inter$ulti_stat <- as.factor(data_inter$ulti_stat)


View(data_inter)

nrow(data_inter)
colnames(data_inter)


data_mod <- data_inter[c(-1,-2, -5,-14, -16)]
head(data_mod)

write.csv(data_mod, "data_mod.csv", row.names = FALSE)

