# getting the row with MRN number that appeared more than once
ZSFGH_x <-ZSFGH_c[(duplicated(ZSFGH_c$MRN, fromLast = FALSE)|duplicated(ZSFGH_c$MRN, fromLast = TRUE)),]

head(ZSFGH_x)
View(ZSFGH_x)



