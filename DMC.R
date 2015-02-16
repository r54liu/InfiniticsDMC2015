setwd("C:/Users//Ruicheng//Desktop//dmc-2015/")

build <- read.csv("SEM_DAILY_BUILD.csv", header = T)
test <- read.csv("SEM_DAILY_VALIDATION.csv", header = T)

CLICKS <- build$CLICKS

ENGN_ID.f. <- as.factor(build$ENGN_ID)                # Binary
LANG_ID.f. <- as.factor(build$LANG_ID)                # Binary
MTCH_TYPE_ID.f. <- as.factor(build$MTCH_TYPE_ID)      # Binary
DVIC_ID.f. <- as.factor(build$DVIC_ID)                # 3 levels
HEADLINE.f. <- as.factor(build$HEADLINE)              # 27 levels
DESCRIPTION_1.f. <- as.factor(build$DESCRIPTION_1)    # 69 levels
DESCRIPTION_2.f. <- as.factor(build$DESCRIPTION_2)    # 33 levels
LANDING_PAGE.f. <- as.factor(build$LANDING_PAGE)      # 27 levels

# Creating indicator variables for each keywords
build.click.only <- na.omit(subset(build, select=c(CLICKS)))

KEYWD_TXT <- build$KEYWD_TXT
KEYWD_TXT <- as.character(KEYWD_TXT)
keyword <- unlist(strsplit(KEYWD_TXT, "[+]"))
keyword <- keyword[keyword !=""]
keyword <- unique(keyword)
keyword <- sort(keyword)

KEYWD_TXT <- paste(KEYWD_TXT, "+", sep= "")
keyword <-paste(keyword, "+", sep="")

keyword.indicator <- NULL

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

colnames(keyword.indicator) <- keyword
keyword.indicator <- as.data.frame.matrix(keyword.indicator)   # convert Matrix into Data Table

# end of creating keyword indicators
