
require(ggplot2)

# Bar chart for gender
g1 <-ggplot(filter(ZSFGH_e,Interval <30 & Interval >0),aes(gender_cd,fill=gender_cd))
g1+geom_bar()


# Bar chart for race
g2 <-ggplot(filter(ZSFGH_e,Interval <30 & Interval >0),aes(race_cd,fill=race_cd))
g2+geom_bar()

# Bar chart for Zipcode 
str(ZSFGH_e)

g2 <-ggplot(filter(ZSFGH_e,Interval <30 & Interval >0),aes(zip_group,fill=zip_group))
g2+geom_bar()+ theme(axis.text.x = element_text(angle = 90, hjust = 1))





# Bar chart for dx_group
ZSFGH_e[!(is.na(ZSFGH_e$dx_group)), ]


g3 <-ggplot(filter(ZSFGH_e[!(is.na(ZSFGH_e$dx_group)), ],Interval <30 & Interval >0),aes(dx_group,fill=dx_group))
g3+geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Bar chart for hosp_svc
g4 <-ggplot(filter(ZSFGH_e,Interval <30 & Interval >0),aes(as.factor(hosp_svc),fill=hosp_svc))
g4+geom_bar()



# Bar chart for lang
g <-ggplot(filter(ZSFGH_e,Interval <30 & Interval >0),aes(as.factor(lang),fill=lang))
g+geom_bar()

g5 <-ggplot(filter(ZSFGH_e,Interval <30 & Interval >0),aes(prim_dsch_dx_cd,Interval))
g5+geom_point()


g6 <-ggplot(filter(ZSFGH_e,Interval <30 & Interval >0),aes(hosp_svc,Interval))


g6+geom_point()

cor(ZSFGH_d[sapply(ZSFGH_e,function(x)is.numeric(x))])


v <-filter(ZSFGH_d,Interval <30 & Interval >0)

v1 <- mutate(ZSFGH_e,readmit= ifelse((Interval <30 & Interval >0),0, 1))
v1$readmit
model <-lm(readmit~Hb+Na+age+gender_cd+tot_len_of_stay, data = v1,na.action = na.exclude)
summary(model)
str(v1)

model2 <-glm(readmit~Hb+Na+age+gender_cd+tot_len_of_stay, data = v1,na.action = na.exclude)
summary(model2)
