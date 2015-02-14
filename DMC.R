setwd("C:/Users//Ruicheng//Desktop//dmc-2015/")

build <- read.csv("SEM_DAILY_BUILD.csv", header = T)

AD_ID <- as.factor(build$AD_ID)
HEADLINE <- as.factor(build$HEADLINE)
CLICKS <- build$CLICKS

