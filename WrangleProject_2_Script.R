library(dplyr)
library(tidyr)

#RECORD S FOR MISSING VALUES
titanic_original$embarked[titanic_original$embarked ==""] <- "S"

#CALCULATE X AS MEAN AGE AND REPLACE NA VALUES WITH X
x <- mean(titanic_original$age, na.rm = TRUE)
titanic_original$age[is.na(titanic_original$age)] <- x

#FILL DUMMY VALUE 'None' IN FOR MISSING BOATS
titanic_original$boat<- sub("^$", "NA", titanic_original$boat)

#CREATE DUMMY VARIABLE FOR MISSING CABIN NUMBERS
titanic_original$cabin <- as.character(titanic_original$cabin)
titanic_original = within(titanic_original, {
  has_cabin_number <- ifelse(cabin == "", "1", "0")
})

#SAVE NEW DATA AS CLEAN CSV
write.csv(titanic_original, file="titanic_clean.csv")