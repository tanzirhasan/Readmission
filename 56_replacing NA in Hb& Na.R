# taking care of the missing value in Hb and Na cloumn

ZSFGH1 <-read.csv("ZSFGH.csv",header = TRUE,stringsAsFactors = FALSE)
ZSFGH1$Hb[is.na(ZSFGH1$Hb)]<-12  # replacing the missing value with normal average  Hb level



ZSFGH1$Na[is.na(ZSFGH1$Na)]<-135  # replacing the missing value with normal average Sodium level

write.csv(ZSFGH1, file = "ZSFGH1.csv",row.names = FALSE)
