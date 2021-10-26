library(tidyverse)

source("R/MakeRecruitDevs.R")

moPDO <- read.csv("C:/Users/rwildermuth/Documents/FutureSeas/Recruitment Index/monthlyPDO.csv")

# remove last year (2021)
moPDO <- moPDO %>% filter(Year < 2021)
moPDO$yrPDO <- NA #rowMeans(moPDO[, 2:13])

moPDO$sumPDO <- rowMeans(moPDO[, c("augPDO", "sepPDO", "octPDO")])
moPDO$sprPDO <- rowMeans(moPDO[, c("marPDO", "aprPDO", "mayPDO", 
                                   "junPDO", "julPDO")])

for(i in 2:nrow(moPDO)){
  moPDO$yrPDO[i] <- moPDO$sumPDO[i-1] + moPDO$sprPDO[i]
}

moPDO %>% select(Year, sumPDO, sprPDO, yrPDO)

myFit <- lm(yrPDO ~ sin(2*pi*Year/60), data = moPDO)
myFit
summary(myFit)

moPDO$expPDO <- c(NA, predict(myFit))

moPDO %>% select(Year, sumPDO, sprPDO, yrPDO, expPDO)

newDat <- data.frame(Year = 2021:2120)
newDat$expPDO <- predict(myFit, newdata = newDat)

ggplot(data = moPDO, aes(x=Year, y=expPDO)) +
  geom_line() +
  geom_point(aes(y = yrPDO)) +
  geom_line(data = newDat, aes(col = "Projection"))


# Create recrtuitment deviation time series for PDO projection ------------

newDat <- rbind(data.frame(Year = 2020, expPDO = moPDO[moPDO$Year == 2020, "expPDO"]),
                newDat)

newDat$recDevPDO <- MakeRecruitDevs(envtInx = newDat$expPDO,
                                    envtCoeff = 0.548, devSD = 1) # assume SD of PDO fit in Zwolinski & Demer 2019 is 1

#write.csv(newDat, "C:/Users/rwildermuth/Documents/FutureSeas/Recruitment Index/recdevPDO2120.csv")
