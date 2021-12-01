# Calculate performance metrics
# Created: 10/26/2021, Robert Wildermuth

# directory for MSE output
mseOutputPath <- "C:/Users/Robert W/Documents/FutureSeas/SSMSEscenarios/margCompsOMfixedSelexEM"
# scenario
scenName <- "margCompsOMfixedSelexEM_RandRecHCR1"

# get the iterations
iters <- list.dirs(file.path(mseOutputPath, scenName), recursive = FALSE, full.names = FALSE)

# # get the OM, init, and terminal year model directory names
omName <- grep("_OM", list.dirs(file.path(mseOutputPath, scenName, iters[1]),
                                recursive = FALSE,
                                full.names = FALSE), value = TRUE)

tsBio <- data.frame(Yr = NA, Bio_Smry.1 = NA, SSB =NA, Recruits = NA, iter = NA)
tsCat <- data.frame(Yr = NA, obsCat = NA, expCat = NA, iter = NA)
B0 <- NA

for(i in iters){
  omOut <- SS_output(file.path(mseOutputPath, scenName, i, omName), 
                     verbose = FALSE, printstats = FALSE)
  
  tsBio <- rbind(tsBio,
                 omOut$sprseries %>% #filter(Era == "FORE") %>%
                    select(Yr, Bio_Smry.1, SSB, Recruits) %>%
                    mutate(iter = i))
  
  tsCat <- rbind(tsCat,
                 omOut$catch %>% group_by(Yr) %>%
                    # summarize total catch within year
                    dplyr::summarize(obsCat = sum(Obs),
                                     expCat = sum(Exp)) %>%
                    mutate(iter = i))
  
  unfished <- omOut$derived_quants %>% filter(Label == "SmryBio_unfished")
  B0 <- c(B0, unfished)

}

# Fishery closure cutoff
cutoff <- 150000
# biomass at which maximum catch of 200000 reached when Fmsy = 0.05
maxcat <- 4150000

tsBio <- tsBio %>% mutate(closure = Bio_Smry.1 < cutoff,
                          bonanza = Bio_Smry.1 > maxcat)

smryBio <- tsBio %>% filter(Yr > 2019) %>%
              group_by(iter) %>%
              summarize(yrsN = n(),
                        closuresN = sum(closure),
                        bonanzaN = sum(bonanza),
                        meanB1plus = mean(Bio_Smry.1))

smryCat <- tsCat %>% filter(Yr > 2019) %>%
              group_by(iter) %>%
              summarize(meanCat = mean(obsCat),
                        sdCat = sd(obsCat))

metrics <- data.frame(closuresN = smryBio$closuresN,
                      closureFreq = smryBio$closuresN/smryBio$yrsN,
                      meanB1plus = smryBio$meanB1plus,
                      meanCat = smryCat$meanCat,
                      sdCat = smryCat$sdCat)

save(tsBio, tsCat, B0, metrics,
     file = file.path(mseOutputPath, "resRandRecHCR1.RData"))
load(file = file.path(mseOutputPath, "resRandRecHCR1.RData"))
