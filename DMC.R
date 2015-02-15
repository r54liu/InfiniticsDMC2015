setwd("C:/Users//Ruicheng//Desktop//dmc-2015/")

build <- read.csv("SEM_DAILY_BUILD.csv", header = T)

AD_ID <- as.factor(build$AD_ID)
HEADLINE <- as.factor(build$HEADLINE)
CLICKS <- build$CLICKS

AD_ID.levels <- levels(AD_ID)
AD_ID.levels <- AD_ID.levels[AD_ID.levels != ""]                    # 13341 factors

HEADLINE.levels <- levels(HEADLINE)
HEADLINE.levels <- HEADLINE.levels[HEADLINE.levels != ""]           # 26 factors


# Creating indicator variables for each keywords

KEYWD_TXT <- train.click$KEYWD_TXT
KEYWD_TXT <- levels(KEYWD_TXT)
keyword <- unlist(strsplit(KEYWD_TXT, "[+]"))
keyword <- keyword[keyword !=""]
keyword <- unique(keyword)

KEYWD_TXT <- paste(KEYWD_TXT, "+", sep= "")
keyword <-paste(keyword, "+", sep="")

keyword.indicator <- matrix (keyword, ncol=length(keyword), nrow = 1)

j = 1
while (j <= length(KEYWD_TXT)) {
count = c()
i = 1
while (i <= length(keyword)) {
  if (grepl(keyword[i], KEYWD_TXT[j])) {
    count <- append (count, 1)
  } else {
    count <- append (count, 0)}
i <- i+1
}
keyword.indicator <- rbind(keyword.indicator, count)
j = j+1
}

# end of creating keyword indicators
