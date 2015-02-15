setwd("C:/Users//Ruicheng//Desktop//dmc-2015/")

build <- read.csv("SEM_DAILY_BUILD.csv", header = T)

AD_ID <- as.factor(build$AD_ID)
HEADLINE <- as.factor(build$HEADLINE)
CLICKS <- build$CLICKS

AD_ID.levels <- levels(AD_ID)
AD_ID.levels <- AD_ID.levels[AD_ID.levels != ""]

HEADLINE.levels <- levels(HEADLINE)
HEADLINE.levels <- HEADLINE.levels[HEADLINE.levels != ""]
