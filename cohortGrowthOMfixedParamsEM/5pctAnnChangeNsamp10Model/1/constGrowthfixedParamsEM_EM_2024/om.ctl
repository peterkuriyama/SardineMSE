#V3.30.15.09-safe;_2020_07_06;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.0
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
#_data_and_control_files: om.dat // om.ctl
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
4 #_Nblock_Patterns
 1 8 8 1  #_blocks_per_pattern 
# begin and end years of blocks
 2000 2000
 2012 2012 2013 2013 2014 2014 2015 2015 2016 2016 2017 2017 2018 2018 2019 2019
 #1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014
 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014
 2015 2019
 #1983 1983 1984 1984 1985 1985 1986 1986 1987 1987 1988 1988 1989 1989 1990 1990 1991 1991 1992 1992 1993 1993 1994 1994 1995 1995 1996 1996 1997 1997 1998 1998 1999 1999 2000 2000 2001 2001 2002 2002 2003 2003 2004 2004 2005 2005 2006 2006 2007 2007 2008 2008 2009 2009 2010 2010 2011 2011 2012 2012 2013 2013 2014 2014 2015 2015 2016 2016 2017 2017 2018 2018 2019 2019
 #1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014
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
#_Prior_codes:  0=none; 6=normal; 1=symmetric beta; 2=CASAL's beta; 3=lognormal; 4=lognormal with biascorr; 5=gamma
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
 3 30 10.0176 0 99 0 3 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 #15 40 23.046 0 99 0 3 0 1 1982 2019 4 0 0 # L_at_Amax_Fem_GP_1
 15 40 23.046 0 99 0 3 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.05 0.99 0.81811 0 99 0 3 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.05 0.5 0.188209 0 99 0 3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.1 0.0418271 0 99 0 3 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
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
 #0.0001 2 0.11 0.5 0.5 6 -5 # CohortGrowDev_dev_se
 #-0.99 0.99 0 0 0.5 6 -6 # CohortGrowDev_dev_autocorr
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
             3            25       15.3071             0            99             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1            .5             0            99             0         -5          0          0          0          0          0          0          0 # SR_BH_steep
             0             2             1             0            99             0         -3          0          0          0          0          0          0          0 # SR_sigmaR
           -15            15             0             0            99             0         -1          0          0          0          0          0          1          2 # SR_regime
             0             0             0             0            99             0         -3          0          0          0          0          0          0          0 # SR_autocorr
# timevary SR parameters
 -15 15 -4.10952 0 99 0 4 # SR_regime_BLK1repl_1980
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
2000 # first year of main recr_devs; early devs can preceed this era
2018 # last year of main recr_devs; forecast devs start in following year
1 #_recdev phase 
1 # (0/1) to read 13 advanced options
 -6 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 2 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1990.4 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1996.3 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2017.9 #_last_yr_fullbias_adj_in_MPD
 2019 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.929 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -5 #min rec_dev
 5 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#_Yr Input_value # Final_value
 
#
# all recruitment deviations
#  1977E 1978E 1979E 1980E 1981E 1982E 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018R 2019F 2020F
#  4.90287e-008 0.000125204 -0.00147172 -0.466668 -2.79734 -1.96131 -1.81013 -2.04831 -1.06207 -0.453783 -0.264475 -0.807849 -0.701955 0.700718 0.318268 1.19943 2.12676 1.61942 1.56583 2.03856 2.07109 0.403093 0.225103 0.740899 -1.01469 2.5072 2.14049 2.24455 1.43298 1.06844 0.202113 0.723699 0.696607 -1.24481 -3.18645 -2.77772 -1.6116 -1.29314 -2.2125 -1.46736 -1.93473 -0.133677 0 0
# implementation error by year in forecast:  0
#
#Fishing Mortality info 
0.1 # F ballpark value in units of annual_F
-2006 # F ballpark year (neg value to disable)
2 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
 0.1 1 1 # overall start F value; overall phase; N detailed inputs to read
#Fleet Yr Seas F_value se phase (for detailed setup of F_Method=2; -Yr to fill remaining years)
 1 2000 1 0.5 0.05 1
#
#_initial_F_parms; count = 1
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
 0 15 14.4425 0 99 0 1 # InitF_seas_1_flt_2MexCal_S2
#2020 2070
# F rates by fleet
# Yr:  1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# MexCal_S1 0.230665 0.282745 0.0769295 0.0101707 0.0401588 0.0179417 0.0935663 0.0487545 0.105021 0.0782135 0.666 4 0.00682774 0.0758788 0.030127 0.0240586 0.0227878 0.0332121 0.113397 0.241296 0.306345 0.586103 0.128816 0.0386835 0.0288301 0.0504734 0.164161 0.200716 0.0991329 0.133845 0.155054 0.00873387 0.0307717 0.0619115 0.00318739 0.0748234 0.0160884 0.00254324 0.0264354 0.0264354
# MexCal_S2 0.139754 0.348227 0.0535273 0.474178 0.0626084 0.095777 0.130901 0.0508525 0.138415 0.233967 0.176956 0.687541 0.0825431 0.185724 0.295579 0.17742 0.201962 0.528813 1.73359 2.31517 3.80641 4 0.410455 0.134962 0.48742 0.722951 1.74329 2.43493 2.56908 1.48528 3.99997 3.01977 0.376928 0.116316 0.0122403 0.336354 0.194701 0.473575 0.638837 0.638837
# PNW 0 0 0 0 0 0 0 0 0 0 0 0.0146129 0 0 0.0462628 0.07315 0.0486074 3.92147 0.00215165 0.028975 0.0378625 0.0757751 0.104725 0.186689 0.295476 0.100094 0.112983 0.0964842 0.128732 0.17743 0.222444 0.683291 0.891642 0.433975 0.0387957 0.141708 0.00413076 0.0121619 0.00746771 0.00746771
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
            -3             3             0             0            99             0         -2          0          0          0          0          0          4          2  #  LnQ_base_AT_Survey(4)
            -3             3         -1.83             0            99             0         -2          0          0          0          0          0          0          0  #  LnQ_base_DEPM(5)
            -3             3         -0.59             0            99             0         -2          0          0          0          0          0          0          0  #  LnQ_base_TEP_all(6)
# timevary Q parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type     PHASE  #  parm_name
             0             3        -0.311             0            99             0      -1  # LnQ_base_AT_Survey(4)_BLK5repl_2015
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
             0            30       14.4331             0            99             0          3          0          0          0          0          0          0          0  #  Size_inflection_MexCal_S1(1)
             0            10        2.1814             0            99             0          3          0          0          0          0          0          0          0  #  Size_95%width_MexCal_S1(1)
# 2   MexCal_S2 LenSelex
# 3   PNW LenSelex
# 4   AT_Survey LenSelex
# 5   DEPM LenSelex
# 6   TEP_all LenSelex
# 1   MexCal_S1 AgeSelex
           -10            11      0.500064            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P1_MexCal_S1(1)
           -10            11       0.51357            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P2_MexCal_S1(1)
           -10            15       10.0568            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P3_MexCal_S1(1)
           -10            11       2.74978            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P4_MexCal_S1(1)
           -10            11      -5.49827            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P5_MexCal_S1(1)
           -10            11    -0.0329302            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P6_MexCal_S1(1)
           -10            11     -0.629045            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P7_MexCal_S1(1)
           -10            11      -1.71773            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P8_MexCal_S1(1)
           -10            11      -5.01239            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P9_MexCal_S1(1)
# 2   MexCal_S2 AgeSelex
           -10            11       1.99999            -1            99             0         -3          0          0          0          0          0          0          0  #  AgeSel_P1_MexCal_S2(2)
           -10            15       5.52812            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P2_MexCal_S2(2)
           -10            11       1.78177            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P3_MexCal_S2(2)
           -10            11      0.352013            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P4_MexCal_S2(2)
           -10            11      -1.02817            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P5_MexCal_S2(2)
           -10            11      0.403833            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P6_MexCal_S2(2)
           -10            11      -1.01793            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P7_MexCal_S2(2)
           -10            11     -0.682861            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P8_MexCal_S2(2)
           -10            11       -4.4861            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P9_MexCal_S2(2)
# 3   PNW AgeSelex
             0            10       8.50358             0            99             0          4          0          0          0          0          0          0          0 #  Age_inflection_PNW(3)
            -5            15       0.58919             0            99             0          4          0          0          0          0          0          0          0  #  Age_95%width_PNW(3)
# 4   AT_Survey AgeSelex
             0             9             0            -1            99             0         -3          0          0          0          0          0          0          0  #  AgeSel_P1_AT_Survey(4)
             0            11       1.34889            -1            99             0          4          0          0          0          0          0          2          2  #  AgeSel_P2_AT_Survey(4)
# 5   DEPM AgeSelex
# 6   TEP_all AgeSelex
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
           # -10            11       5.64735            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1983
           # -10            11       6.25268            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1985
           # -10            11       7.66343            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1987
           # -10            11       7.59405            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1989
           # -10            11       6.60084            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1991
           # -10            11       7.73973            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1993
           # -10            11   -0.00100507            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1995
           # -10            11        1.4458            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1997
           # -10            11      -1.78549            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_1999
           # -10            11      -1.92597            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_2001
           # -10            11      0.233888            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_2003
           # -10            11     -0.127051            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_2005
           # -10            11      -1.29938            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_2007
           # -10            11       8.48205            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_2009
           # -10            11       0.48875            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_2011
           # -10            11     -0.250415            -1            99             0      3  # AgeSel_P2_MexCal_S1(1)_BLK3repl_2013
           # -10            11       2.42543            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1983
           # -10            11       1.30359            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1985
           # -10            11      0.909915            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1987
           # -10            11      0.841708            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1989
           # -10            15       8.37132            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1991
           # -10            11       1.75888            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1993
           # -10            11       2.67752            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1995
           # -10            11     0.0157358            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1997
           # -10            11      0.139431            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_1999
           # -10            11     -0.244235            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_2001
           # -10            11      -1.23482            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_2003
           # -10            11     -0.554787            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_2005
           # -10            11      0.935186            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_2007
           # -10            11      0.635849            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_2009
           # -10            11       1.23229            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_2011
           # -10            11       1.25029            -1            99             0      3  # AgeSel_P3_MexCal_S1(1)_BLK3repl_2013
           # -10            11      -6.77802            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1983
           # -10            11      -7.16921            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1985
           # -10            11      -1.91601            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1987
           # -10            11      0.568457            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1989
           # -10            11       1.68828            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1991
           # -10            11      -1.55229            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1993
           # -10            11      0.308195            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1995
           # -10            11       -1.7697            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1997
           # -10            11      -8.41661            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_1999
           # -10            11     -0.834893            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_2001
           # -10            11     -0.634385            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_2003
           # -10            11      -1.82358            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_2005
           # -10            11      -2.08236            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_2007
           # -10            11      -2.87436            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_2009
           # -10            11 -5.31275e-005            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_2011
           # -10            11    0.00274106            -1            99             0      3  # AgeSel_P4_MexCal_S1(1)_BLK3repl_2013
           # -10            11      -0.73313            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1983
           # -10            11     -0.950603            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1985
           # -10            11       2.35479            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1987
           # -10            11      -1.92434            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1989
           # -10            11      -2.27062            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1991
           # -10            11      -6.90691            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1993
           # -10            11      -3.03596            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1995
           # -10            11     -0.424093            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1997
           # -10            11       6.08333            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_1999
           # -10            11      -1.60909            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_2001
           # -10            11     -0.818625            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_2003
           # -10            11      0.698711            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_2005
           # -10            11      -6.01177            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_2007
           # -10            11       -8.2228            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_2009
           # -10            11      -1.54906            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_2011
           # -10            11       1.97415            -1            99             0      3  # AgeSel_P5_MexCal_S1(1)_BLK3repl_2013
           # -10            15       9.52874            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK7add_1987
           # -10            11      -6.19699            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK7add_1989
           # -10            11      -5.93231            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK7add_1991
           # -10            11      -5.64258            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK7add_1993
           # -10            11      -7.53331            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK7add_1995
           # -10            11      -7.15479            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK7add_1997
           # -10            11      -8.17294            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK7add_1999
           # -10            11      -8.46831            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK7add_2001
           # -10            11      -6.46019            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK7add_2003
           # -10            11      -7.55939            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK7add_2005
           # -10            11      -7.97353            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK7add_2007
           # -10            11      -7.37083            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK7add_2009
           # -10            11      -9.99578            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK7add_2011
           # -10            11       -6.3094            -1            99             0      3  # AgeSel_P2_MexCal_S2(2)_BLK7add_2013
           # -10            11     -0.118102            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK7add_1987
           # -10            11      -1.73984            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK7add_1989
           # -10            11      -1.37833            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK7add_1991
           # -10            11      -2.09922            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK7add_1993
           # -10            11      -1.85045            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK7add_1995
           # -10            11      -2.53393            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK7add_1997
           # -10            11      -3.22778            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK7add_1999
           # -10            11      -2.08856            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK7add_2001
           # -10            11      -2.97415            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK7add_2003
           # -10            11      -3.31111            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK7add_2005
           # -10            11      -3.32338            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK7add_2007
           # -10            11      -5.26311            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK7add_2009
           # -10            11      -1.27349            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK7add_2011
           # -10            11      -2.81977            -1            99             0      3  # AgeSel_P3_MexCal_S2(2)_BLK7add_2013
           # -10            11     -0.670926            -1            99             0      3  # AgeSel_P4_MexCal_S2(2)_BLK7add_1987
           # -10            11       0.94876            -1            99             0      3  # AgeSel_P4_MexCal_S2(2)_BLK7add_1989
           # -10            11      0.647755            -1            99             0      3  # AgeSel_P4_MexCal_S2(2)_BLK7add_1991
           # -10            11      -2.10815            -1            99             0      3  # AgeSel_P4_MexCal_S2(2)_BLK7add_1993
           # -10            11       -1.7147            -1            99             0      3  # AgeSel_P4_MexCal_S2(2)_BLK7add_1995
           # -10            11     -0.328899            -1            99             0      3  # AgeSel_P4_MexCal_S2(2)_BLK7add_1997
           # -10            11      -2.65383            -1            99             0      3  # AgeSel_P4_MexCal_S2(2)_BLK7add_1999
           # -10            11      -3.06478            -1            99             0      3  # AgeSel_P4_MexCal_S2(2)_BLK7add_2001
           # -10            11     -0.799193            -1            99             0      3  # AgeSel_P4_MexCal_S2(2)_BLK7add_2003
           # -10            11        -0.811            -1            99             0      3  # AgeSel_P4_MexCal_S2(2)_BLK7add_2005
           # -10            11      -1.11588            -1            99             0      3  # AgeSel_P4_MexCal_S2(2)_BLK7add_2007
           # -10            11      0.594888            -1            99             0      3  # AgeSel_P4_MexCal_S2(2)_BLK7add_2009
           # -10            11      0.219571            -1            99             0      3  # AgeSel_P4_MexCal_S2(2)_BLK7add_2011
           # -10            11     -0.491949            -1            99             0      3  # AgeSel_P4_MexCal_S2(2)_BLK7add_2013
           #   0            10       2.32874             0            99             0      4  # Age_inflection_PNW(3)_BLK4repl_1999
           #   0            10       2.29766             0            99             0      4  # Age_inflection_PNW(3)_BLK4repl_2001
           #   0            10       1.47992             0            99             0      4  # Age_inflection_PNW(3)_BLK4repl_2003
           #   0            10       2.34942             0            99             0      4  # Age_inflection_PNW(3)_BLK4repl_2005
           #   0            10       2.42766             0            99             0      4  # Age_inflection_PNW(3)_BLK4repl_2007
           #   0            10       2.34374             0            99             0      4  # Age_inflection_PNW(3)_BLK4repl_2009
           #   0            10       2.25414             0            99             0      4  # Age_inflection_PNW(3)_BLK4repl_2011
           #   0            10       2.95244             0            99             0      4  # Age_inflection_PNW(3)_BLK4repl_2013
             0             9       6.69304            -1            99             0      4  # AgeSel_P2_AT_Survey(4)_BLK2repl_2012
             0             9       7.37134            -1            99             0      4  # AgeSel_P2_AT_Survey(4)_BLK2repl_2013
             0             9       5.02362            -1            99             0      4  # AgeSel_P2_AT_Survey(4)_BLK2repl_2014
             0             9             0            -1            99             0      -4  # AgeSel_P2_AT_Survey(4)_BLK2repl_2015
             0             9       2.84393            -1            99             0      4  # AgeSel_P2_AT_Survey(4)_BLK2repl_2016
             0             9             0            -1            99             0      -4  # AgeSel_P2_AT_Survey(4)_BLK2repl_2017
             0             9       1.69874            -1            99             0      4  # AgeSel_P2_AT_Survey(4)_BLK2repl_2018
             0            11       10.3705            -1            99             0      4  # AgeSel_P2_AT_Survey(4)_BLK2repl_2019
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
      #1     3     1     0     0     0     0     1     1  1982  2019     4 1.11173 0.0944435 0.135578 0.389412 0.226817 0.856733 0.103363 -0.359691 -1.48202 -0.278921 -0.366551 -0.570168 -0.22367 -1.25303 -0.931673 -0.157324 -1.99008 -0.269609  1.938 3.52326 3.08203 1.39447 2.41065 -0.7346 0.145877 -1.96864 -3.76639 -3.69407 -1.6164 0.0672479 -0.755547 -0.18352 0.556263 0.274177 0.996706 2.06624 0.492732 0.173065
      #1    13     3     0     0     0     0     2     1  1982  2019     5 0.521773 0.854272 1.36374 0.47868 1.1124 0.0453077 1.19681 -0.474291 -0.705055 -1.98694 -1.95888 -2.01922 -1.8959 -2.09052 -2.41476 -2.97439 -2.31453 -1.90072 -2.808 -1.54209 -2.07627 -3.52087 -4.08882 -4.01552 -3.33522 -2.14856 -2.97227 -2.30637 -0.921625 1.68106 -1.82892 -0.691962 -0.128827 1.41477 1.87328 -1.15177 1.37438      0
# 1.11173 0.0944435 0.135578 0.389412 0.226817 0.856733 0.103363 -0.359691 -1.48202 -0.278921 -0.366551 -0.570168 -0.22367 -1.25303 -0.931673 -0.157324 -1.99008 -0.269609  1.938 3.52326 3.08203 1.39447 2.41065 -0.7346 0.145877 -1.96864 -3.76639 -3.69407 -1.6164 0.0672479 -0.755547 -0.18352 0.556263 0.274177 0.996706 2.06624 0.492732 0.173065
#      2     4     5     1     2     0     0     0     0     0     0     0
#      3     1     6     5     2     0     0     0     0     0     0     0
#      5     4     7     3     2     0     0     0     0     0     0     0
#      5     5    23     3     2     0     0     0     0     0     0     0
#      5     6    39     3     2     0     0     0     0     0     0     0
#      5     7    55     3     2     0     0     0     0     0     0     0
#      5    13    71     7     1     0     0     0     0     0     0     0
#      5    14    85     7     1     0     0     0     0     0     0     0
#      5    15    99     7     1     0     0     0     0     0     0     0
#      5    21   113     4     2     0     0     0     0     0     0     0
#      5    24   121     2     2     0     0     0     0     0     0     0
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

