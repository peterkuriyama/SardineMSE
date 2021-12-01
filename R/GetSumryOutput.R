# Function to extract output for all OM and EM SSMSE iterations
# Created: 11/30/2021; Robert Wildermuth

GetSumryOutput <- function(dir, # SSMSE directory (character)
                           scenario, # scenario name (character)
                           termYr # terminal year of MSE run
){
  
  # read in SSMSE results summary derived quantities, scalars, and time series
  dqSumry <- read.csv(file.path(dir, scenario, paste0("results_dq_", scenario, ".csv")))
  dqSumry <- dqSumry[, c("Value.Recr", "Value.SSB", "year", "model_run", "iteration", "scenario")]
  sclSumry <- read.csv(file.path(dir, scenario, paste0("results_scalar_", scenario, ".csv")))
  sclSumry <- sclSumry[, c("F_MSY", "model_run", "iteration", "scenario")]
  # RW: same as Value.SSB in results_dq table
  #tsSumry <- read.csv(file.path(dir, scenario, paste0("results_ts_", scenario, ".csv")))
  #tsSumry <- tsSumry[, c("SpawnBio", "year", "model_run", "iteration", "scenario")]
  
  # get the iterations
  iters <- list.dirs(file.path(dir, scenario), recursive = FALSE, full.names = FALSE)
  
  # # get the OM, init, and terminal year model directory names
  omName <- grep("_OM", list.dirs(file.path(dir, scenario, iters[1]),
                                  recursive = FALSE,
                                  full.names = FALSE), value = TRUE)
  initName <- grep("_init", list.dirs(file.path(dir, scenario, iters[1]),
                                      recursive = FALSE,
                                      full.names = FALSE), value = TRUE)
  
  termNames <- list.dirs(file.path(dir, scenario, iters[1]),
                         recursive = FALSE,
                         full.names = FALSE)
  termNames <- termNames[which(!termNames %in% c(omName, initName))]
  
  # Extract terminal summary stats for OM and EM by iteration
  smrySPRseries <- data.frame()
  smryCatch <- data.frame()
  smryDQs <- data.frame()
  smryNatlen <- data.frame()
  smryNatage <- data.frame()
  smryBatlen <- data.frame()
  smryBatage <- data.frame()
  obsCPUE <- data.frame()
  obsCatch <- data.frame()
  obsAgecomp <- data.frame()
  obsLencomp <- data.frame()
  for(i in iters){
    
    initOutputSS <- SS_output(dir = file.path(dir, scenario, i, initName),
                              dir.mcmc = NULL,
                              repfile = "Report.sso",
                              compfile = "CompReport.sso", verbose = FALSE, printstats = FALSE)
    
    # Get EM estimated bio, catch, and comps
    smryEMspr <- initOutputSS[["sprseries"]] %>% select(Yr, Era, Bio_Smry.1, SSB, Recruits, Num_Smry) %>%
      mutate(model_run = paste0(scenario, "_EM_term"),
             iteration = as.integer(i))
    smryEMcat <- initOutputSS[["catch"]] %>% select(Yr, Obs, Exp) %>%
      mutate(model_run = paste0(scenario, "_EM_term"),
             iteration = as.integer(i))
    smryEMdq <- initOutputSS[["derived_quants"]] %>% select(Label, Value) %>%
      mutate(model_run = paste0(scenario, "_EM_term"),
             iteration = as.integer(i),
             Yr = max(smryEMspr$Yr))
    smryEMlenN <- initOutputSS[["natlen"]] %>% select(Yr, Seas, `Beg/Mid`, 
                                                      c("6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", 
                                                        "11", "11.5", "12", "12.5", "13", "13.5", "14", "14.5", "15", "15.5",
                                                        "16", "16.5", "17", "17.5", "18", "18.5", "19", "19.5", "20", "20.5",
                                                        "21", "21.5", "22", "22.5", "23", "23.5", "24", "24.5", "25", "25.5",
                                                        "26", "26.5", "27", "27.5", "28", "28.5", "29", "29.5", "30")) %>%
      mutate(model_run = paste0(scenario, "_EM_term"),
             iteration = as.integer(i))
    smryEMageN <- initOutputSS[["natage"]] %>% select(Yr, Seas, `Beg/Mid`, 
                                                      c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10")) %>%
      mutate(model_run = paste0(scenario, "_EM_term"),
             iteration = as.integer(i))
    smryEMlenB <- initOutputSS[["batlen"]] %>% select(Yr, Seas, `Beg/Mid`, 
                                                      c("6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", 
                                                        "11", "11.5", "12", "12.5", "13", "13.5", "14", "14.5", "15", "15.5",
                                                        "16", "16.5", "17", "17.5", "18", "18.5", "19", "19.5", "20", "20.5",
                                                        "21", "21.5", "22", "22.5", "23", "23.5", "24", "24.5", "25", "25.5",
                                                        "26", "26.5", "27", "27.5", "28", "28.5", "29", "29.5", "30")) %>%
      mutate(model_run = paste0(scenario, "_EM_term"),
             iteration = as.integer(i))
    smryEMageB <- initOutputSS[["batage"]] %>% select(Yr, Seas, `Beg/Mid`, 
                                                      c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10")) %>%
      mutate(model_run = paste0(scenario, "_EM_term"),
             iteration = as.integer(i))
    
    # Get EM observed data for CPUE, catch, and comps
    initDatSS <- SS_readdat(file = file.path(dir, scenario, i, initName, "data.ss_new"),
                            version = "3.30")
    
    
    datEMcpue <- initDatSS[["CPUE"]] %>% select(year, seas, index, obs) %>%
      mutate(model_run = paste0(scenario, "_EM_term"),
             iteration = as.integer(i))
    datEMcat <- initDatSS[["catch"]] %>% select(year, catch) %>%
      mutate(model_run = paste0(scenario, "_EM_term"),
             iteration = as.integer(i))
    datEMage <- initDatSS[["agecomp"]] %>% select(FltSvy, Yr) %>%
      mutate(model_run = paste0(scenario, "_EM_term"),
             iteration = as.integer(i))
    datEMlen <- initDatSS[["lencomp"]] %>% select(FltSvy, Yr) %>%
      mutate(model_run = paste0(scenario, "_EM_term"),
             iteration = as.integer(i))
    
    # Next get the forecast values for each projected EM year
    for(y in max(smryEMspr$Yr):termYr){
      EMoutputSS <- SS_output(dir = file.path(dir, scenario, i, 
                                            grep(y, termNames, value = TRUE)),
                            dir.mcmc = NULL,
                            repfile = "Report.sso",
                            compfile = "CompReport.sso", verbose = FALSE, printstats = FALSE)
      
      nxtYrSPR <- EMoutputSS[["sprseries"]] %>% select(Yr, Era, Bio_Smry.1, SSB, Recruits, Num_Smry) %>%
        mutate(model_run = paste0(scenario, "_EM_term"),
               iteration = as.integer(i)) %>%
        filter(Yr == y+1)
      nxtYrcat <- EMoutputSS[["catch"]] %>% select(Yr, Obs, Exp) %>%
        mutate(model_run = paste0(scenario, "_EM_term"),
               iteration = as.integer(i))%>%
        filter(Yr == y+1)
      nxtYrdq <- EMoutputSS[["derived_quants"]] %>% select(Label, Value) %>%
        mutate(model_run = paste0(scenario, "_EM_term"),
               iteration = as.integer(i),
               Yr = y+1)
      nxtYrlenN <- EMoutputSS[["natlen"]] %>% select(Yr, Seas, `Beg/Mid`, 
                                                        c("6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", 
                                                          "11", "11.5", "12", "12.5", "13", "13.5", "14", "14.5", "15", "15.5",
                                                          "16", "16.5", "17", "17.5", "18", "18.5", "19", "19.5", "20", "20.5",
                                                          "21", "21.5", "22", "22.5", "23", "23.5", "24", "24.5", "25", "25.5",
                                                          "26", "26.5", "27", "27.5", "28", "28.5", "29", "29.5", "30")) %>%
        mutate(model_run = paste0(scenario, "_EM_term"),
               iteration = as.integer(i))%>%
        filter(Yr == y+1)
      nxtYrageN <- EMoutputSS[["natage"]] %>% select(Yr, Seas, `Beg/Mid`, 
                                                        c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10")) %>%
        mutate(model_run = paste0(scenario, "_EM_term"),
               iteration = as.integer(i))%>%
        filter(Yr == y+1)
      nxtYrlenB <- EMoutputSS[["batlen"]] %>% select(Yr, Seas, `Beg/Mid`, 
                                                        c("6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", 
                                                          "11", "11.5", "12", "12.5", "13", "13.5", "14", "14.5", "15", "15.5",
                                                          "16", "16.5", "17", "17.5", "18", "18.5", "19", "19.5", "20", "20.5",
                                                          "21", "21.5", "22", "22.5", "23", "23.5", "24", "24.5", "25", "25.5",
                                                          "26", "26.5", "27", "27.5", "28", "28.5", "29", "29.5", "30")) %>%
        mutate(model_run = paste0(scenario, "_EM_term"),
               iteration = as.integer(i))%>%
        filter(Yr == y+1)
      nxtYrageB <- EMoutputSS[["batage"]] %>% select(Yr, Seas, `Beg/Mid`, 
                                                        c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10")) %>%
        mutate(model_run = paste0(scenario, "_EM_term"),
               iteration = as.integer(i))%>%
        filter(Yr == y+1)
      
      # Get EM observed data for CPUE, catch, and comps
      EMDatSS <- SS_readdat(file = file.path(dir, scenario, i, 
                                            grep(y, termNames, value = TRUE), 
                                            "data.ss_new"),
                              version = "3.30")
      
      
      nxtDatcpue <- EMDatSS[["CPUE"]] %>% select(year, seas, index, obs) %>%
        mutate(model_run = paste0(scenario, "_EM_term"),
               iteration = as.integer(i))%>%
        filter(year == y+1)
      nxtDatcat <- EMDatSS[["catch"]] %>% select(year, catch) %>%
        mutate(model_run = paste0(scenario, "_EM_term"),
               iteration = as.integer(i))%>%
        filter(year == y+1)
      nxtDatage <- EMDatSS[["agecomp"]] %>% select(FltSvy, Yr) %>%
        mutate(model_run = paste0(scenario, "_EM_term"),
               iteration = as.integer(i))%>%
        filter(Yr == y+1)
      nxtDatlen <- EMDatSS[["lencomp"]] %>% select(FltSvy, Yr) %>%
        mutate(model_run = paste0(scenario, "_EM_term"),
               iteration = as.integer(i))%>%
        filter(Yr == y+1)
      
      # add this to the EM time series
      smryEMspr <- rbind(smryEMspr, nxtYrSPR)
      smryEMcat <- rbind(smryEMcat, nxtYrcat)
      smryEMdq <- rbind(smryEMdq, nxtYrdq)
      smryEMageB <- rbind(smryEMageB, nxtYrageB)
      smryEMageN <- rbind(smryEMageN, nxtYrageN)
      smryEMlenB <- rbind(smryEMlenB, nxtYrlenB)
      smryEMlenN <- rbind(smryEMlenN, nxtYrlenN)
      datEMcpue <- rbind(datEMcpue, nxtDatcpue)
      datEMcat <- rbind(datEMcat, nxtDatcat)
      datEMage <- rbind(datEMage, nxtDatage)
      datEMlen <- rbind(datEMlen, nxtDatlen)
    } # end 'termYr' for-loop
    
    OMoutputSS <- SS_output(dir = file.path(dir, scenario, i, omName),
                            dir.mcmc = NULL,
                            repfile = "Report.sso",
                            compfile = "CompReport.sso", verbose = FALSE, printstats = FALSE)
    
    # Get OM bio, catch, and comps
    smryOMspr <- OMoutputSS[["sprseries"]] %>% select(Yr, Era, Bio_Smry.1, SSB, Recruits, Num_Smry) %>%
      filter(Era == "TIME") %>% 
      mutate(model_run = omName,
             iteration = as.integer(i))
    smryOMcat <- OMoutputSS[["catch"]] %>% select(Yr, Obs, Exp) %>%
      mutate(model_run = paste0(scenario, omName),
             iteration = as.integer(i))
    smryOMdq <- OMoutputSS[["derived_quants"]] %>% select(Label, Value) %>%
      mutate(model_run = paste0(scenario, omName),
             iteration = as.integer(i),
             Yr = termYr)
    smryOMlenN <- OMoutputSS[["natlen"]] %>% select(Yr, Seas, `Beg/Mid`, 
                                                      c("6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", 
                                                        "11", "11.5", "12", "12.5", "13", "13.5", "14", "14.5", "15", "15.5",
                                                        "16", "16.5", "17", "17.5", "18", "18.5", "19", "19.5", "20", "20.5",
                                                        "21", "21.5", "22", "22.5", "23", "23.5", "24", "24.5", "25", "25.5",
                                                        "26", "26.5", "27", "27.5", "28", "28.5", "29", "29.5", "30")) %>%
      mutate(model_run = paste0(scenario, omName),
             iteration = as.integer(i))
    smryOMageN <- OMoutputSS[["natage"]] %>% select(Yr, Seas, `Beg/Mid`, 
                                                      c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10")) %>%
      mutate(model_run = paste0(scenario, omName),
             iteration = as.integer(i))
    smryOMlenB <- OMoutputSS[["batlen"]] %>% select(Yr, Seas, `Beg/Mid`, 
                                                      c("6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", 
                                                        "11", "11.5", "12", "12.5", "13", "13.5", "14", "14.5", "15", "15.5",
                                                        "16", "16.5", "17", "17.5", "18", "18.5", "19", "19.5", "20", "20.5",
                                                        "21", "21.5", "22", "22.5", "23", "23.5", "24", "24.5", "25", "25.5",
                                                        "26", "26.5", "27", "27.5", "28", "28.5", "29", "29.5", "30")) %>%
      mutate(model_run = paste0(scenario, omName),
             iteration = as.integer(i))
    smryOMageB <- OMoutputSS[["batage"]] %>% select(Yr, Seas, `Beg/Mid`, 
                                                      c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10")) %>%
      mutate(model_run = paste0(scenario, omName),
             iteration = as.integer(i))
    
    smrySPRseries <- rbind(smrySPRseries, smryEMspr, smryOMspr)
    smryCatch <- rbind(smryCatch, smryEMcat, smryOMcat)
    smryDQs <- rbind(smryDQs, smryEMdq, smryOMdq)
    smryNatlen <- rbind(smryNatlen, smryEMlenN, smryOMlenN)
    smryNatage <- rbind(smryNatage, smryEMageN, smryOMageN)
    smryBatlen <- rbind(smryBatlen, smryEMlenB, smryOMlenB)
    smryBatage <- rbind(smryBatage, smryEMageB, smryOMageB)
    obsCPUE <- rbind(obsCPUE, datEMcpue)
    obsCatch <- rbind(obsCatch, datEMcat)
    obsAgecomp <- rbind(obsAgecomp, datEMage)
    obsLencomp <- rbind(obsLencomp, datEMlen)
  } # end 'iter' for-loop
  
  
  list(scenario, smrySPRseries, smryCatch, smryDQs, smryNatage, smryNatlen, 
       smryBatage, smryBatlen,
       obsCPUE, obsCatch, obsAgecomp, obsLencomp)
}
