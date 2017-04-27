
# As some of the Zipcode  have more than 5 character we are making them uniform by takikng the first 5 character 
ZSFGH_b$ZipCode <-substr(ZSFGH_b$ZipCode,start = 1,stop = 5)

View(ZSFGH_b)
distinct(as.factor(ZSFGH_b$ZipCode))
str(ZSFGH_b)
class(ZSFGH_b$ZipCode)
as.factor(ZSFGH_b$ZipCode)


 