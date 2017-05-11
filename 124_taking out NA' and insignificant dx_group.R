

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
data_mod <- data_mod_raw[c(-1,-2)]
head(data_mod)
