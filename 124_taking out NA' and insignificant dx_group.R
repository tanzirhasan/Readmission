# Function for scoring
#risk_score
riskcalculation<-function(){
  risk_score <- 0

}

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

ZSFGH_x %>%group_by(MRN)%>% slice(which.min(Interval))

View(ZSFGH_x %>%group_by(MRN))
