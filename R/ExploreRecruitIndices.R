# Explore data for sardine recruitment indices

library(tidyverse)
library(r4ss)

# From Peter Kuriyama, 9/28/2021:
# Here's the weight-at-age file used in the sardine assessment. If you load r4ss 
# you can read the values in with SS_readwtatage(file="wtatage.ss"). Once loaded, 
# the values for Fleet 4 are from the survey and season 1 is summer (July to 
# December) and season 2 is spring (January to June of following calendar year). 

wtAgeDat <- SS_readwtatage(file="C:/Users/rwildermuth/Documents/FutureSeas/Recruitment Index/wtatage.ss")
test1 <- wtAgeDat %>% filter(Fleet == 4, Seas == 2)
matplot(test1$Yr, test1[, 9:ncol(test1)], type = "l", ylim = c(0, 0.5))

# compare to estimated recruitment from the research model
researchResults <- SS_output(dir = "C:/Users/rwildermuth/Documents/FutureSeas/sardine_research_assessment")
researchResults$recruit
lines(researchResults$recruit$Yr, (scale(log(researchResults$recruit$exp_recr))/5)+0.25, col = "darkblue")

lines(test1$Yr, (scale(rowMeans(test1[, 9:ncol(test1)]))/5)+0.25, col = "red")
