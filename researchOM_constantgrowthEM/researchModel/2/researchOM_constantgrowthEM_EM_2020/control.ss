#V3.30.15.09-safe;_2020_07_06;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.0
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
#_data_and_control_files: data.ss // control.ss
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS)
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Platoon_within/between_stdev_ratio (no read if N_platoons=1)
#_Cond  1 #vector_platoon_dist_(-1_in_first_val_gives_normal_approx)
#
4 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity; 4=none (only when N_GP*Nsettle*pop==1)
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
7 #_Nblock_Patterns
 1 8 16 8 1 37 14  #_blocks_per_pattern 
# begin and end years of blocks
 
 #SR Regime
 1980 1980

 #AT Survey selectivities
 2012 2012 
 2013 2013
 2014 2014 
 2015 2015 
 2016 2016 
 2017 2017 
 2018 2018 
 2019 2019

 #MexCal S1 selectivities
 1983  1984
 1985  1986
 1987  1988
 1989  1990
 1991  1992
 1993  1994
 1995  1996
 1997  1998
 1999  2000
 2001  2002
 2003  2004
 2005  2006
 2007  2008
 2009  2010
 2011  2012
 2013  2014


 #PNW selectivities
 1999  2000
 2001  2002
 2003  2004
 2005  2006
 2007  2008
 2009  2010
 2011  2012
 2013  2014

 #Split Q years (aerial) 
 2015 2019
 
 #Time-varying growth parameters
 1983  1983
 1984  1984
 1985  1985
 1986  1986
 1987  1987
 1988  1988
 1989  1989
 1990  1990
 1991  1991
 1992  1992
 1993  1993
 1994  1994
 1995  1995
 1996  1996
 1997  1997
 1998  1998
 1999  1999
 2000  2000
 2001  2001
 2002  2002
 2003  2003
 2004  2004
 2005  2005
 2006  2006
 2007  2007
 2008  2008
 2009  2009
 2010  2010
 2011  2011
 2012  2012
 2013  2013
 2014  2014
 2015  2015
 2016  2016
 2017  2017
 2018  2018
 2019  2019

#MexCal S2 selectivities
 1987  1988
 1989  1990
 1991  1992
 1993  1994
 1995  1996
 1997  1998
 1999  2000
 2001  2002
 2003  2004
 2005  2006
 2007  2008
 2009  2010
 2011  2012
 2013  2014

#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#
# AUTOGEN
 1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen time-varying parms of this category; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
#_Available timevary codes
#_Block types: 0: P_block=P_base*exp(TVP); 1: P_block=P_base+TVP; 2: P_block=TVP; 3: P_block=P_block(-1) + TVP
#_Block_trends: -1: trend bounded by base parm min-max and parms in transformed units (beware); -2: endtrend and infl_year direct values; -3: end and infl as fraction of base range
#_EnvLinks:  1: P(y)=P_base*exp(TVP*env(y));  2: P(y)=P_base+TVP*env(y);  3: P(y)=f(TVP,env_Zscore) w/ logit to stay in min-max;  4: P(y)=2.0/(1.0+exp(-TVP1*env(y) - TVP2))
#_DevLinks:  1: P(y)*=exp(dev(y)*dev_se;  2: P(y)+=dev(y)*dev_se;  3: random walk;  4: zero-reverting random walk with rho;  5: like 4 with logit transform to stay in base min-max
#_DevLinks(more):  21-25 keep last dev for rest of years
#
#_Prior_codes:  0=none; 6=normal; 1=symmetric beta; 2=CASALs beta; 3=lognormal; 4=lognormal with biascorr; 5=gamma
#
# setup for M, growth, wt-len, maturity, fecundity, (hermaphro), recr_distr, cohort_grow, (movement), (age error), (catch_mult), sex ratio 
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
0.5 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
0 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.199 0.936 0.585 0 99 0 -2 0 0 0 0 0 0 0 # NatM_p_1_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 3 30 8.73147 0 99 0 3 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 15 40 22.6869 0 99 0 3 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.05 0.99 0.655485 0 99 0 3 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.05 0.5 0.193887 0 99 0 3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.1 0.0420629 0 99 0 3 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 -3 3 7.5242e-006 0 99 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 -3 5 3.2332 0 99 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 9 19 15.44 0 99 0 -3 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -20 3 -0.89252 0 99 0 -3 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 0 10 1 0 99 0 -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem_GP_1
 -1 5 0 0 99 0 -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Hermaphroditism
#  Recruitment Distribution  
#  Cohort growth dev base
 0.1 10 1 1 1 6 -1 0 0 0 0 0 0 0 # CohortGrowDev
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 1e-006 0.999999 0.5 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#
# timevary MG parameters 
#_ LO HI INIT PRIOR PR_SD PR_type  PHASE
 #0.0001 2 0.01 0.5 0.5 6 -5 # L_at_Amax_Fem_GP_1_dev_se
 #-0.99 0.99 0 0 0.5 6 -6 # L_at_Amax_Fem_GP_1_dev_autocorr
 #0.0001 2 0.11 0.5 0.5 6 -5 # VonBert_K_Fem_GP_1_dev_se
 #-0.99 0.99 0 0 0.5 6 -6 # VonBert_K_Fem_GP_1_dev_autocorr
# info on dev vectors created for MGparms are reported with other devs after tag parameter section 
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; Options: 1=NA; 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
             3            25       15.3543             0            99             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1             1             0            99             0         -5          0          0          0          0          0          0          0 # SR_BH_steep
             0             2             1             0            99             0         -3          0          0          0          0          0          0          0 # SR_sigmaR
           -15            15             0             0            99             0         -1          0          0          0          0          0          1          2 # SR_regime
             0             0             0             0            99             0         -3          0          0          0          0          0          0          0 # SR_autocorr
# timevary SR parameters
 -15 15 -1.81471 0 99 0 4 # SR_regime_BLK1repl_1981
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1983 # first year of main recr_devs; early devs can preceed this era
2018 # last year of main recr_devs; forecast devs start in following year
1 #_recdev phase 
1 # (0/1) to read 13 advanced options
 -6 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 2 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1976.1 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1984.2 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2016.9 #_last_yr_fullbias_adj_in_MPD
 2017.4 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.9365 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -5 #min rec_dev
 5 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1977E 1978E 1979E 1980E 1981E 1982E 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018R 2019F 2020F
#  -0.0566315 0.159888 -0.186107 -1.65284 -9.2358e-008 -0.613167 -1.33881 -1.08388 -0.156361 -0.330418 -0.828097 -0.541203 -0.273923 0.0290923 0.658478 1.34867 1.37689 1.01787 1.7327 1.70869 1.73064 0.273792 0.214979 1.09227 -0.3715 2.20091 1.58114 2.15241 1.09468 0.921453 0.165771 0.854558 0.577481 -1.93985 -2.63589 -2.77962 -1.45486 -1.23305 -1.87691 -1.08799 -2.12456 -0.675568 0 0
# implementation error by year in forecast:  0
#
#Fishing Mortality info 
0.1 # F ballpark value in units of annual_F
-2006 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
10  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 1
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
 0 50 2.55509 0 99 0 1 # InitF_seas_2_flt_2MexCal_S2
#2020 2160
# F rates by fleet
# Yr:  1981 1981 1982 1982 1983 1983 1984 1984 1985 1985 1986 1986 1987 1987 1988 1988 1989 1989 1990 1990 1991 1991 1992 1992 1993 1993 1994 1994 1995 1995 1996 1996 1997 1997 1998 1998 1999 1999 2000 2000 2001 2001 2002 2002 2003 2003 2004 2004 2005 2005 2006 2006 2007 2007 2008 2008 2009 2009 2010 2010 2011 2011 2012 2012 2013 2013 2014 2014 2015 2015 2016 2016 2017 2017 2018 2018 2019 2019 2020 2020
# seas:  1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2
# MexCal_S1 0.000823286 0 0.00404027 0 0.00326313 0 0.00364059 0 0.0276697 0 0.023585 0 0.0763595 0 0.0928523 0 0.208279 0 0.239844 0 1.02115 0 4.00002 0 0.049424 0 0.268616 0 0.110273 0 0.058048 0 0.0670086 0 0.429505 0 0.339446 0 3.20997 0 2.66942 0 3.68827 0 2.14114 0 0.309314 0 0.224514 0 0.337407 0 0.750529 0 0.965407 0 0.63216 0 0.172701 0 0.263311 0 0.135417 0 0.167893 0 0.123621 0 0.000903314 0 0.169845 0 0.0353517 0 0.00506117 0 0.0117885 0 0.01475 0
# MexCal_S2 0 0.00254829 0 0.0166567 0 0.00262578 0 0.0642382 0 0.0267529 0 0.0618301 0 0.118246 0 0.0457067 0 0.14928 0 0.417505 0 0.396974 0 0.733167 0 0.126718 0 0.391759 0 0.221857 0 0.150408 0 0.157525 0 1.21158 0 1.29289 0 1.96532 0 2.0412 0 0.937383 0 0.438536 0 0.313524 0 0.482457 0 0.76085 0 1.46293 0 1.87447 0 2.21595 0 2.41981 0 3.28601 0 0.20289 0 0.235027 0 0.237275 0 0.0208421 0 0.849396 0 0.468754 0 4.00001 0 2.73484 0 1.95
# PNW 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.000562293 3.5498e-005 0 0 0 0 0.000636631 0 0 0.0281315 0.00821046 0.000328461 0.0016848 0.00031108 0.00211027 0.00149123 0.0511935 0.00956868 0.0763471 0.0135666 0.174665 0.00395191 0.262006 0.0251873 0.301161 0.00816479 0.17529 0.00039043 0.315904 0 0.297395 0 0.32134 0 0.311674 0.0133408 0.495878 1.15557e-006 0.535581 0.11493 1.09998 0.030479 1.09121 0.029834 0.872053 0.220558 0.0072735 0.000186322 0.245529 9.90818e-005 0.00199665 0.00500354 0.00599925 0.00257625 0.00868236 0.00379314 0.0015 0
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         4         1         0         0         0         0  #  AT_Survey
         5         1         0         0         0         0  #  DEPM
         6         1         0         0         0         0  #  TEP_all
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
            -3             3             0             0            99             0         -2          0          0          0          0          0          5          2  #  LnQ_base_AT_Survey(4)
            -3             3         -1.83             0            99             0         -2          0          0          0          0          0          0          0  #  LnQ_base_DEPM(5)
            -3             3         -0.59             0            99             0         -2          0          0          0          0          0          0          0  #  LnQ_base_TEP_all(6)
# timevary Q parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type     PHASE  #  parm_name
             0             3        -0.311             0            99             0      -1  # LnQ_base_AT_Survey(4)_BLK4repl_2015
# info on dev vectors created for Q parms are reported with other devs after tag parameter section 
#
#_size_selex_patterns
#Pattern:_0;  parm=0; selex=1.0 for all sizes
#Pattern:_1;  parm=2; logistic; with 95% width specification
#Pattern:_5;  parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_11; parm=2; selex=1.0  for specified min-max population length bin range
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6;  parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
#Pattern:_8;  parm=8; double_logistic with smooth transitions and constant above Linf option
#Pattern:_9;  parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_25; parm=3; exponential-logistic in size
#Pattern:_27; parm=3+special; cubic spline 
#Pattern:_42; parm=2+special+3; // like 27, with 2 additional param for scaling (average over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
 1 0 0 0 # 1 MexCal_S1
 15 0 0 1 # 2 MexCal_S2
 15 0 0 1 # 3 PNW
 0 0 0 0 # 4 AT_Survey
 30 0 0 0 # 5 DEPM
 30 0 0 0 # 6 TEP_all
#
#_age_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
#Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
#Pattern:_11; parm=2; selex=1.0  for specified min-max age
#Pattern:_12; parm=2; age logistic
#Pattern:_13; parm=8; age double logistic
#Pattern:_14; parm=nages+1; age empirical
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_16; parm=2; Coleraine - Gaussian
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (average over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age
#Pattern:_42; parm=2+special+3; // cubic spline; with 2 additional param for scaling (average over bin range)
#Age patterns entered with value >100 create Min_selage from first digit and pattern from remainder
#_Pattern Discard Male Special
 17 0 0 8 # 1 MexCal_S1
 17 0 0 8 # 2 MexCal_S2
 12 0 0 0 # 3 PNW
 17 0 0 1 # 4 AT_Survey
 0 0 0 0 # 5 DEPM
 0 0 0 0 # 6 TEP_all
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   MexCal_S1 LenSelex
             0            30       13.9153             0            99             0          3          0          0          0          0          0          0          0  #  Size_inflection_MexCal_S1(1)
             0            10       1.98372             0            99             0          3          0          0          0          0          0          0          0  #  Size_95%width_MexCal_S1(1)
# 2   MexCal_S2 LenSelex
# 3   PNW LenSelex
# 4   AT_Survey LenSelex
# 5   DEPM LenSelex
# 6   TEP_all LenSelex
# 1   MexCal_S1 AgeSelex
            -10             11       1.00001            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P1_MexCal_S1(1)
            -10             11      0.553868            -1            99             0          3          0          0          0          0          0          3          2  #  AgeSel_P2_MexCal_S1(1)
            -10             11      -2.15529            -1            99             0          3          0          0          0          0          0          3          2  #  AgeSel_P3_MexCal_S1(1)
            -10             11     -0.373871            -1            99             0          3          0          0          0          0          0          3          2  #  AgeSel_P4_MexCal_S1(1)
            -10             11       0.57045            -1            99             0          3          0          0          0          0          0          3          2  #  AgeSel_P5_MexCal_S1(1)
            -10             11   -0.00308964            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P6_MexCal_S1(1)
            -10             11     -0.703334            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P7_MexCal_S1(1)
            -10             11      -2.81785            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P8_MexCal_S1(1)
            -10             11      -1.43501            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P9_MexCal_S1(1)
# 2   MexCal_S2 AgeSelex
            -10             11       1.99999            -1            99             0         -3          0          0          0          0          0          0          0  #  AgeSel_P1_MexCal_S2(2)
            -10             15       1.00045            -1            99             0          3          0          0          0          0          0          7          2  #  AgeSel_P2_MexCal_S2(2)
            -10             11     -0.292322            -1            99             0          3          0          0          0          0          0          7          2  #  AgeSel_P3_MexCal_S2(2)
            -10             11     0.0743511            -1            99             0          3          0          0          0          0          0          7          2  #  AgeSel_P4_MexCal_S2(2)
            -10             11      -1.09848            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P5_MexCal_S2(2)
            -10             11      0.498746            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P6_MexCal_S2(2)
            -10             11      -2.16671            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P7_MexCal_S2(2)
            -10             11       1.45286            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P8_MexCal_S2(2)
            -10             11      -6.84027            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P9_MexCal_S2(2)
# 3   PNW AgeSelex
             0            10       5.00027             0            99             0          4          0          0          0          0          0          4          2  #  Age_inflection_PNW(3)
            -5            15      0.673735             0            99             0          4          0          0          0          0          0          0          0  #  Age_95%width_PNW(3)
# 4   AT_Survey AgeSelex
             0             9             0            -1            99             0         -3          0          0          0          0          0          0          0  #  AgeSel_P1_AT_Survey(4)
             0             9      0.279769            -1            99             0          4          0          0          0          0          0          2          2  #  AgeSel_P2_AT_Survey(4)
# 5   DEPM AgeSelex
# 6   TEP_all AgeSelex
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            -10             11      0.837451            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1983
            -10             11      0.837451            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1985
            -10             11      0.837451            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1987
            -10             11      0.837451            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1989
            -10             11      0.837451            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1991
            -10             11      0.837451            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1993
            -10             11      0.837451            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1995
            -10             11      0.837451            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1997
            -10             11      0.837451            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1999
            -10             11      0.837451            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_2001
            -10             11      0.837451            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_2003
            -10             11      0.837451            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_2005
            -10             11      0.837451            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_2007
            -10             11      0.837451            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_2009
            -10             11      0.837451            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_2011
            -10             11      0.837451            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_2013
            -10             11     -0.884887            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1983
            -10             11     -0.884887            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1985
            -10             11     -0.884887            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1987
            -10             11     -0.884887            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1989
            -10             15     -0.884887            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1991 #<-----------
            -10             11     -0.884887            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1993
            -10             11     -0.884887            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1995
            -10             11     -0.884887            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1997
            -10             11     -0.884887            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1999
            -10             11     -0.884887            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_2001
            -10             11     -0.884887            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_2003
            -10             11     -0.884887            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_2005
            -10             11     -0.884887            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_2007
            -10             11     -0.884887            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_2009
            -10             11     -0.884887            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_2011
            -10             11     -0.884887            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_2013
            -10             11     -0.635305            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1983
            -10             11     -0.635305            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1985
            -10             11     -0.635305            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1987
            -10             11     -0.635305            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1989
            -10             11     -0.635305            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1991
            -10             11     -0.635305            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1993
            -10             11     -0.635305            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1995
            -10             11     -0.635305            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1997
            -10             11     -0.635305            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1999
            -10             11     -0.635305            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_2001
            -10             11     -0.635305            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_2003
            -10             11     -0.635305            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_2005
            -10             11     -0.635305            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_2007
            -10             11     -0.635305            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_2009
            -10             11     -0.635305            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_2011
            -10             11     -0.635305            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_2013
            -10             11       0.91816            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1983
            -10             11       0.91816            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1985
            -10             11       0.91816            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1987
            -10             11       0.91816            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1989
            -10             11       0.91816            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1991
            -10             11       0.91816            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1993
            -10             11       0.91816            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1995
            -10             11       0.91816            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1997
            -10             11       0.91816            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1999
            -10             11       0.91816            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_2001
            -10             11       0.91816            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_2003
            -10             11       0.91816            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_2005
            -10             11       0.91816            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_2007
            -10             11       0.91816            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_2009
            -10             11       0.91816            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_2011
            -10             11       0.91816            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_2013

#            -10             11      0.769735            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK3repl_1983 #<-----------
#            -10             11      0.769735            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK3repl_1985
            -10             15      0.769735            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK3repl_1987 #<-----------
            -10             11      0.769735            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK3repl_1989
            -10             11      0.769735            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK3repl_1991
            -10             11      0.769735            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK3repl_1993
            -10             11      0.769735            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK3repl_1995
            -10             11      0.769735            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK3repl_1997
            -10             11      0.769735            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK3repl_1999
            -10             11      0.769735            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK3repl_2001
            -10             11      0.769735            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK3repl_2003
            -10             11      0.769735            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK3repl_2005
            -10             11      0.769735            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK3repl_2007
            -10             11      0.769735            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK3repl_2009
            -10             11      0.769735            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK3repl_2011
            -10             11      0.769735            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK3repl_2013
            #-10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_1983
            #-10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_1985
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_1987
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_1989
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_1991
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_1993
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_1995
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_1997
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_1999
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_2001
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_2003
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_2005
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_2007
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_2009
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_2011
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_2013
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_1987
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_1989
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_1991
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_1993
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_1995
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_1997
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_1999
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_2001
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_2003
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_2005
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_2007
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_2009
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_2011
            -10             11      0.135819            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK3repl_2013

             0            10       5.00095             0            99             0      4  # Age_inflection_PNW(3)_BLK4repl_1999
             0            10       5.00095             0            99             0      4  # Age_inflection_PNW(3)_BLK4repl_2001
             0            10       5.00095             0            99             0      4  # Age_inflection_PNW(3)_BLK4repl_2003
             0            10       5.00095             0            99             0      4  # Age_inflection_PNW(3)_BLK4repl_2005
             0            10       5.00095             0            99             0      4  # Age_inflection_PNW(3)_BLK4repl_2007
             0            10       5.00095             0            99             0      4  # Age_inflection_PNW(3)_BLK4repl_2009
             0            10       5.00095             0            99             0      4  # Age_inflection_PNW(3)_BLK4repl_2011
             0            10       5.00095             0            99             0      4  # Age_inflection_PNW(3)_BLK4repl_2013

             0             9   0.000433815            -1            99             0      4  # AgeSel_P2_AT_Survey(4)_BLK2repl_2012
             0             9   0.000433815            -1            99             0      4  # AgeSel_P2_AT_Survey(4)_BLK2repl_2013
             0             9   0.000433815            -1            99             0      4  # AgeSel_P2_AT_Survey(4)_BLK2repl_2014
             0             9             0            -1            99             0     -4  # AgeSel_P2_AT_Survey(4)_BLK2repl_2015
             0             9   0.000433815            -1            99             0      4  # AgeSel_P2_AT_Survey(4)_BLK2repl_2016
             0             9             0            -1            99             0     -4  # AgeSel_P2_AT_Survey(4)_BLK2repl_2017
             0             9   0.000433815            -1            99             0      4  # AgeSel_P2_AT_Survey(4)_BLK2repl_2018
             0            11   0.000433815            -1            99             0      4  # AgeSel_P2_AT_Survey(4)_BLK2repl_2019 #<-----------
# info on dev vectors created for selex parms are reported with other devs after tag parameter section 
#
0   #  use 2D_AR1 selectivity(0/1)
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read and autogen if tag data exist; 1=read
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      1     3     1     0     0     0     0     1     1  1982  2019     4 2.18726 0.454854 2.4609 3.96258 3.27686 5.75251 2.69767 3.31067 1.43882 1.29279 -0.902698 -0.858762 -2.35187 -2.04959 -1.20989 -0.653466 -2.78628 -0.918194 1.08327 2.37005 2.47965 2.33083 -2.91396 -5.29341 -7.46734 -6.71443 -7.07217 -6.62207 -3.00872 0.647068 1.81639 2.44878 0.668606 0.623624 2.92373 3.66796 1.29691 0.344035
#      1     4     3     0     0     0     0     2     1  1982  2019     4 0.679897 0.0987858 0.867391 1.09097 0.660051 1.81092 0.632179 1.18798 0.35452 0.250062 -0.386883 -0.175341 -0.559503 -0.424694 -0.30315 -0.32516 -1.34389 -0.853573 -0.222656 -0.436097 0.246424 -0.212812 -1.24977 -1.84335 -1.83049 -1.5527 -0.52275 -0.946259 -0.407982 0.927864 0.649764 0.300995 -0.0643306 0.153827 1.03095 1.00896 0.209379 0.179167
#      2     4     5     1     2     0     0     0     0     0     0     0
#      3     1     6     4     2     0     0     0     0     0     0     0
#      5     4     7     3     2     0     0     0     0     0     0     0
#      5     5    26     3     2     0     0     0     0     0     0     0
#      5     6    45     3     2     0     0     0     0     0     0     0
#      5     7    64     3     2     0     0     0     0     0     0     0
#      5    13    83     3     2     0     0     0     0     0     0     0
#      5    14   102     3     2     0     0     0     0     0     0     0
#      5    21   121     3     2     0     0     0     0     0     0     0
#      5    24   140     2     2     0     0     0     0     0     0     0
     #
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_Factor  Fleet  Value
 -9999   1    0  # terminator
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 18 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 1 4 1 1 1
 1 5 1 1 1
 1 6 1 1 1
 4 1 1 1 1
 4 2 1 1 1
 4 3 1 1 1
 4 4 1 1 1
 5 1 1 1 1
 5 2 1 1 1
 5 3 1 1 1
 5 4 1 1 1
 9 1 1 0 1
 9 2 1 0 1
 9 3 1 0 1
 18 1 1 0 1
 18 2 1 0 1
 18 3 1 0 1
 18 4 1 0 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  0 #_CPUE/survey:_2
#  0 #_CPUE/survey:_3
#  1 #_CPUE/survey:_4
#  1 #_CPUE/survey:_5
#  1 #_CPUE/survey:_6
#  1 #_lencomp:_1
#  1 #_lencomp:_2
#  1 #_lencomp:_3
#  1 #_lencomp:_4
#  0 #_lencomp:_5
#  0 #_lencomp:_6
#  1 #_agecomp:_1
#  1 #_agecomp:_2
#  1 #_agecomp:_3
#  1 #_agecomp:_4
#  0 #_agecomp:_5
#  0 #_agecomp:_6
#  0 #_init_equ_catch1
#  0 #_init_equ_catch2
#  0 #_init_equ_catch3
#  1 #_init_equ_catch4
#  1 #_init_equ_catch5
#  1 #_init_equ_catch6
#  1 #_recruitments
#  1 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
#  0 # F_ballpark_lambda
0 # (0/1/2) read specs for more stddev reporting: 0 = skip, 1 = read specs for reporting stdev for selectivity, size, and numbers, 2 = add options for M and Dyn Bzero
 # 0 2 0 0 # Selectivity: (1) fleet, (2) 1=len/2=age/3=both, (3) year, (4) N selex bins
 # 0 0 # Growth: (1) growth pattern, (2) growth ages
 # 0 0 0 # Numbers-at-age: (1) area(-1 for all), (2) year, (3) N ages
 # -1 # list of bin #'s for selex std (-1 in first bin to self-generate)
 # -1 # list of ages for growth std (-1 in first bin to self-generate)
 # -1 # list of ages for NatAge std (-1 in first bin to self-generate)
999

