# compare performance metrics among scenarios

library(ggplot2)

noCat <- read.csv("C:/Users/rwildermuth/Documents/FutureSeas/AFSresults/nocatchrrmetrics.csv")
noCatBio <- read.csv("C:/Users/rwildermuth/Documents/FutureSeas/AFSresults/nocatchrrsmryBio.csv")

pikitch0.8Bthresh <- read.csv("C:/Users/rwildermuth/Documents/FutureSeas/AFSresults/pickrr4metrics.csv")
pikitch0.8BthreshBio <- read.csv("C:/Users/rwildermuth/Documents/FutureSeas/AFSresults/pickrr4smryBio.csv")

pikitchFmsy <- read.csv("C:/Users/rwildermuth/Documents/FutureSeas/AFSresults/pickmsyrrmetrics.csv")
pikitchFmsyBio <- read.csv("C:/Users/rwildermuth/Documents/FutureSeas/AFSresults/pickmsyrrsmryBio.csv")

merge(pikitch0.8BthreshBio, pikitchFmsyBio, by = "iter")

dim(pikitch0.8Bthresh)
dim(pikitchFmsy)
dim(noCat)

pikitch0.8Bthresh$scenario <- "Pikitch0.8"
pikitchFmsy$scenario <- "PikitchFmsy"
noCat$scenario <- "NoCatch"

results <- rbind(pikitch0.8Bthresh, 
                 pikitchFmsy[sample(pikitchFmsy$X, nrow(pikitch0.8Bthresh)),],
                 noCat[sample(noCat$X, nrow(pikitch0.8Bthresh)),])

ggplot(data = results, aes(x = scenario, y = closureFreq)) + 
  geom_boxplot() +
  theme_minimal()

ggplot(data = results, aes(x = scenario, y = meanB1plus)) + 
  geom_boxplot() +
  theme_minimal()

ggplot(data = results, aes(x = scenario, y = meanCat)) + 
  geom_boxplot() +
  theme_minimal()

ggplot(data = results, aes(x = scenario, y = sdCat)) + 
  geom_boxplot() +
  theme_minimal()
