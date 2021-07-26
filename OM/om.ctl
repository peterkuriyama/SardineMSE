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
7 #_Nblock_Patterns
 1 8 16 8 1 37 14 #_blocks_per_pattern 
# begin and end years of blocks
 1980 1980
 2012 2012 2013 2013 2014 2014 2015 2015 2016 2016 2017 2017 2018 2018 2019 2019
 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014
 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014
 2015 2019
 1983 1983 1984 1984 1985 1985 1986 1986 1987 1987 1988 1988 1989 1989 1990 1990 1991 1991 1992 1992 1993 1993 1994 1994 1995 1995 1996 1996 1997 1997 1998 1998 1999 1999 2000 2000 2001 2001 2002 2002 2003 2003 2004 2004 2005 2005 2006 2006 2007 2007 2008 2008 2009 2009 2010 2010 2011 2011 2012 2012 2013 2013 2014 2014 2015 2015 2016 2016 2017 2017 2018 2018 2019 2019
 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014
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
 #0.199 0.936 0.585 0 99 0 -2 101 0 0 0 0 0 0 # NatM_p_1_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 3 30 10.005 0 99 0 3 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 15 40 23.037 0 99 0  -3 301 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.05 0.99 0.686 0 99 0 3 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.05 0.5 0.188209 0 99 0 3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.1 0.042    0 99 0 3 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
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
 #0.1 10 1 1 1 6 -1 0 1 1982 2019 5 0 0 # CohortGrowDev
 0.1 10 1 1 1 6 -1 302 0 0 0 0 0 0 # CohortGrowDev #Maybe keep this with 200
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 1e-006 0.999999 0.5 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#
# timevary MG parameters 
#_ LO HI INIT PRIOR PR_SD PR_type  PHASE
 -10 10 0 1 0.5 6 4 # L_at_Amax_Fem_GP_1_ENV_add_constr
 -10 10 0 1 0.5 6 4 # CohortGrowDev_ENV_add_constr
 #0.0001 2 0.01 0.5 0.5 6 -5 # L_at_Amax_Fem_GP_1_dev_se
 #-0.99 0.99 0 0 0.5 6 -6 # L_at_Amax_Fem_GP_1_dev_autocorr
 #0.0001 2 0.11 0.5 0.5 6 -5 # CohortGrowDev_dev_se
 #-0.99 0.99 0 0 0.5 6 -6 # CohortGrowDev_dev_autocorr
# info on dev vectors created for MGparms are reported with other devs after tag parameter section 


#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; Options: 1=NA; 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
             3            25        16.211             0            99             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1            .5             0            99             0         -5          0          0          0          0          0          0          0 # SR_BH_steep
             0             2             1             0            99             0         -3          0          0          0          0          0          0          0 # SR_sigmaR
           -15            15             0             0            99             0         -1          0          0          0          0          0          1          2 # SR_regime
             0             0             0             0            99             0         -3          0          0          0          0          0          0          0 # SR_autocorr
# timevary SR parameters
 -15 15 -4.629 0 99 0 4 # SR_regime_BLK1repl_1980
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1983 # first year of main recr_devs; early devs can preceed this era
2018 # last year of main recr_devs; forecast devs start in following year
-1 #_recdev phase 
1 # (0/1) to read 13 advanced options
 -6 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
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
 38 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
1981	0.5481
1982	1.02296
1983	0.771308
1984	-0.254371
1985	0.354554
1986	0.837462
1987	0.511786
1988	-0.250111
1989	-0.22083
1990	0.89412
1991	0.651331
1992	1.54829
1993	2.03452
1994	1.11447
1995	0.778593
1996	1.16822
1997	1.16763
1998	-0.372482
1999	-0.552662
2000	0.0129498
2001	-1.47161
2002	1.85626
2003	1.57814
2004	1.44281
2005	0.291012
2006	0.135088
2007	-0.66631
2008	-0.0869211
2009	0.159307
2010	-2.18569
2011	-3.75458
2012	-2.92197
2013	-1.22535
2014	-0.383922
2015	-1.05991
2016	-0.715118
2017	-1.20797
2018	0.0219561


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
#.1 1 104
# N iterations for tuning F in hybrid method (recommend 3 to 7)

# if Fmethod=3; read N iterations for tuning for Fmethod 3
# 0.1 1 1 # overall start F value; overall phase; N detailed inputs to read
0 1 104
#Fleet Yr Seas F_value se phase (for detailed setup of F_Method=2; -Yr to fill remaining years)
#1 1980 1 0.5 0.05 1
1 1981  1   0.31674900  0.005  1
1 1982  1   0.94634000  0.005  1
1 1983  1   0.09309730  0.005  1
1 1984  1   0.01565230  0.005  1
1 1985  1   0.10999000  0.005  1
1 1986  1   0.04561510  0.005  1
1 1987  1   0.36165600  0.005  1
1 1988  1   0.18010200  0.005  1
1 1989  1   0.39291800  0.005  1
1 1990  1   0.23842500  0.005  1
1 1991  1   1.11842000  0.005  1
1 1992  1   3.79685000  0.005  1
1 1993  1   0.01874110  0.005  1
1 1994  1   0.12090100  0.005  1
1 1995  1   0.09818120  0.005  1
1 1996  1   0.08269190   0.005  1
1 1997  1   0.10245900  0.005  1
1 1998  1   0.14146800  0.005  1
1 1999  1   1.91662000  0.005  1
1 2000  1   3.67528000  0.005  1
1 2001  1   2.03678000   0.005  1
1 2002  1   3.79703000  0.005  1
1 2003  1   1.66028000  0.005  1
1 2004  1   0.51843600  0.005  1
1 2005  1   0.26143100    0.005  1
1 2006  1   0.43951900  0.005  1
1 2007  1   1.59729000  0.005  1
1 2008  1   2.21621000  0.005  1
1 2009  1   0.20059000  0.005  1
1 2010  1   0.25097200  0.005  1
1 2011  1   0.51508600  0.005  1
1 2012  1   0.02578290  0.005  1
1 2013  1   0.35532400   0.005  1
1 2014  1   0.61685700  0.005  1
1 2015  1   0.00059606  0.005  1
1 2016  1   0.06469970  0.005  1
1 2017  1   0.06752840  0.005  1
1 2018  1   0.00982104  0.005  1
1 2019  1   0.03812370  0.005  1

2 1981  2  0.2173590  0.005  1
2 1982  2  0.6174400  0.005  1
2 1983  2  0.1235030  0.005  1
2 1984  2  1.8633400  0.005  1
2 1985  2  0.2619930  0.005  1
2 1986  2  0.3542310  0.005  1
2 1987  2  0.3380990  0.005  1
2 1988  2  0.1270520  0.005  1
2 1989  2  0.4240740  0.005  1
2 1990  2  0.6965160  0.005  1
2 1991  2  0.7399500  0.005  1
2 1992  2  4.0000100  0.005  1
2 1993  2  0.1535230  0.005  1
2 1994  2  0.3032080  0.005  1
2 1995  2  0.1270840  0.005  1
2 1996  2  0.0799369  0.005  1
2 1997  2  0.0857725  0.005  1
2 1998  2  0.2097430  0.005  1
2 1999  2  0.6115340  0.005  1
2 2000  2  0.8782420  0.005  1
2 2001  2  1.0119500  0.005  1
2 2002  2  1.1159100 0.005  1
2 2003  2  0.2127070  0.005  1
2 2004  2  0.0762312  0.005  1
2 2005  2  0.2667750  0.005  1
2 2006  2  0.4469910  0.005  1
2 2007  2  0.7518730 0.005  1
2 2008  2  1.0280000  0.005  1
2 2009  2  1.0269900 0.005  1
2 2010  2  0.4792300  0.005  1
2 2011  2  1.5909600  0.005  1
2 2012  2  1.2256400 0.005  1
2 2013  2  0.3646640  0.005  1
2 2014  2  0.1264300  0.005  1
2 2015  2  0.0237516  0.005  1
2 2016  2  0.9085560  0.005  1
2 2017  2  0.5664800  0.005  1
2 2018  2  1.4004400  0.005  1
2 2019  2  1.8498600  0.005  1

3 1992  1 0.049676  0.005  1

3 1995  1 0.24516000  0.005  1
3 1996  1 0.00000000  0.005  1
3 1997  1 0.27027700  0.005  1
3 1998  1 3.37723000  0.005  1
3 1999  1 0.00282566  0.005  1
3 2000  1 0.05229150  0.005  1
3 2001  1 0.07001510  0.005  1
3 2002  1 0.14427300  0.005  1
3 2003  1 0.18823900  0.005  1
3 2004  1 0.32937400  0.005  1
3 2005  1 0.52442300  0.005  1
3 2006  1 0.18175800  0.005  1
3 2007  1 0.28931400  0.005  1
3 2008  1 0.20944700  0.005  1
3 2009  1 0.31688800  0.005  1
3 2010  1 0.51550400  0.005  1
3 2011  1 0.39369600  0.005  1
3 2012  1 1.38080000  0.005  1
3 2013  1 1.47606000  0.005  1
3 2014  1 0.61429300  0.005  1
3 2015  1 0.08060060  0.005  1
3 2016  1 0.29059500  0.005  1
3 2017  1 0.00267822  0.005  1
3 2018  1 0.01560230  0.005  1
3 2019  1 0.01036910  0.005  1



#
#_initial_F_parms; count = 1
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
 0 15 10.4284 0 99 0 -1 # InitF_seas_1_flt_2MexCal_S2
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
            #-3             3             0             0            99             0         -2          0          0          0          0          0          0          0  #  LnQ_base_AT_Survey(4)
            -3             3             0             0            99             0         -2          0          0          0          0          0          5          2  #  LnQ_base_AT_Survey(4)
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
             0            30       13.8423             0            99             0          3          0          0          0          0          0          0          0  #  Size_inflection_MexCal_S1(1)
             0            10         2.326             0            99             0          3          0          0          0          0          0          0          0  #  Size_95%width_MexCal_S1(1)
# 2   MexCal_S2 LenSelex
# 3   PNW LenSelex
# 4   AT_Survey LenSelex
# 5   DEPM LenSelex
# 6   TEP_all LenSelex
# 1   MexCal_S1 AgeSelex
           -10            11       0.500033          -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P1_MexCal_S1(1)
           -10            11       0.501553          -1            99             0          3          0          0          0          0          0          3          2  #  AgeSel_P2_MexCal_S1(1)
           -10            15       9.49373           -1            99             0          3          0          0          0          0          0          3          2  #  AgeSel_P3_MexCal_S1(1)
           -10            11       1.73389           -1            99             0          3          0          0          0          0          0          3          2  #  AgeSel_P4_MexCal_S1(1)
           -10            11       1.20376           -1            99             0          3          0          0          0          0          0          3          2  #  AgeSel_P5_MexCal_S1(1)
           -10            11       0.52895           -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P6_MexCal_S1(1)
           -10            11       -0.747812         -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P7_MexCal_S1(1)
           -10            11       -1.5772           -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P8_MexCal_S1(1)
           -10            11       -4.69897          -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P9_MexCal_S1(1)
# 2   MexCal_S2 AgeSelex
           -10            11      1.99999            -1            99             0         -3          0          0          0          0          0          0          0  #  AgeSel_P1_MexCal_S2(2)
           -10            15      6.97111            -1            99             0          3          0          0          0          0          0          7          1  #  AgeSel_P2_MexCal_S2(2)
           -10            11      1.70485            -1            99             0          3          0          0          0          0          0          7          1  #  AgeSel_P3_MexCal_S2(2)
           -10            11      0.626742            -1            99             0          3          0          0          0          0          0          7          1  #  AgeSel_P4_MexCal_S2(2)
           -10            11      -1.36681           -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P5_MexCal_S2(2)
           -10            11      1.06544             -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P6_MexCal_S2(2)
           -10            11      -1.43196           -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P7_MexCal_S2(2)
           -10            11      0.451877            -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P8_MexCal_S2(2)
           -10            11      -4.08677          -1            99             0          3          0          0          0          0          0          0          0  #  AgeSel_P9_MexCal_S2(2)
# 3   PNW AgeSelex
             0            10       8.701042             0            99             0          4          0          0          0          0          0          4          2  #  Age_inflection_PNW(3)
            -5            15       1.00011            0            99             0          4          0          0          0          0          0          0          0  #  Age_95%width_PNW(3)
# 4   AT_Survey AgeSelex
             0             9             0            -1            99             0         -3          0          0          0          0          0          0          0  #  AgeSel_P1_AT_Survey(4)
             0            11       1.92127            -1            99             0          4          0          0          0          0          0          2          2  #  AgeSel_P2_AT_Survey(4)
# 5   DEPM AgeSelex
# 6   TEP_all AgeSelex
# timevary selex parameters 
#_    LO        HI  INIT            PRIOR  PR_SD  PR_type  PHASE  #  parm_name
    -10    11        4.44289        -1     99     0        3      #  AgeSel_P2_MexCal_S1(1)_BLK3repl_1983
    -10    11        3.99655        -1     99     0        3      #  AgeSel_P2_MexCal_S1(1)_BLK3repl_1985
    -10    11        5.38648        -1     99     0        3      #  AgeSel_P2_MexCal_S1(1)_BLK3repl_1987
    -10    11        3.85456        -1     99     0        3      #  AgeSel_P2_MexCal_S1(1)_BLK3repl_1989
    -10    11        0.501215       -1     99     0        3      #  AgeSel_P2_MexCal_S1(1)_BLK3repl_1991
    -10    11        5.93185        -1     99     0        3      #  AgeSel_P2_MexCal_S1(1)_BLK3repl_1993
    -10    11        -2.87535       -1     99     0        3      #  AgeSel_P2_MexCal_S1(1)_BLK3repl_1995
    -10    11        -0.774578      -1     99     0        3      #  AgeSel_P2_MexCal_S1(1)_BLK3repl_1997
    -10    11        -4.02705       -1     99     0        3      #  AgeSel_P2_MexCal_S1(1)_BLK3repl_1999
    -10    11        -3.23504       -1     99     0        3      #  AgeSel_P2_MexCal_S1(1)_BLK3repl_2001
    -10    11        -1.79432       -1     99     0        3      #  AgeSel_P2_MexCal_S1(1)_BLK3repl_2003
    -10    11        -1.5229        -1     99     0        3      #  AgeSel_P2_MexCal_S1(1)_BLK3repl_2005
    -10    11        -2.81967       -1     99     0        3      #  AgeSel_P2_MexCal_S1(1)_BLK3repl_2007
    -10    11        6.5357         -1     99     0        3      #  AgeSel_P2_MexCal_S1(1)_BLK3repl_2009
    -10    11        3.25772        -1     99     0        3      #  AgeSel_P2_MexCal_S1(1)_BLK3repl_2011
    -10    11        -4.7907        -1     99     0        3      #  AgeSel_P2_MexCal_S1(1)_BLK3repl_2013
    -10    11        0.510499       -1     99     0        3      #  AgeSel_P3_MexCal_S1(1)_BLK3repl_1983
    -10    11        1.29085        -1     99     0        3      #  AgeSel_P3_MexCal_S1(1)_BLK3repl_1985
    -10    11        0.871085       -1     99     0        3      #  AgeSel_P3_MexCal_S1(1)_BLK3repl_1987
    -10    11        1.0964         -1     99     0        3      #  AgeSel_P3_MexCal_S1(1)_BLK3repl_1989
    -10    15        12.6854        -1     99     0        3      #  AgeSel_P3_MexCal_S1(1)_BLK3repl_1991
    -10    11        1.03274        -1     99     0        3      #  AgeSel_P3_MexCal_S1(1)_BLK3repl_1993
    -10    11        2.20249        -1     99     0        3      #  AgeSel_P3_MexCal_S1(1)_BLK3repl_1995
    -10    11        0.00704549     -1     99     0        3      #  AgeSel_P3_MexCal_S1(1)_BLK3repl_1997
    -10    11        0.280664       -1     99     0        3      #  AgeSel_P3_MexCal_S1(1)_BLK3repl_1999
    -10    11        -0.149067      -1     99     0        3      #  AgeSel_P3_MexCal_S1(1)_BLK3repl_2001
    -10    11        -1.46322       -1     99     0        3      #  AgeSel_P3_MexCal_S1(1)_BLK3repl_2003
    -10    11        -0.771139      -1     99     0        3      #  AgeSel_P3_MexCal_S1(1)_BLK3repl_2005
    -10    11        0.826242       -1     99     0        3      #  AgeSel_P3_MexCal_S1(1)_BLK3repl_2007
    -10    11        0.5716         -1     99     0        3      #  AgeSel_P3_MexCal_S1(1)_BLK3repl_2009
    -10    11        0.830329       -1     99     0        3      #  AgeSel_P3_MexCal_S1(1)_BLK3repl_2011
    -10    11        1.62362        -1     99     0        3      #  AgeSel_P3_MexCal_S1(1)_BLK3repl_2013
    -10    11        -6.93434       -1     99     0        3      #  AgeSel_P4_MexCal_S1(1)_BLK3repl_1983
    -10    11        -5.90746       -1     99     0        3      #  AgeSel_P4_MexCal_S1(1)_BLK3repl_1985
    -10    11        -1.60952       -1     99     0        3      #  AgeSel_P4_MexCal_S1(1)_BLK3repl_1987
    -10    11        1.30822        -1     99     0        3      #  AgeSel_P4_MexCal_S1(1)_BLK3repl_1989
    -10    11        1.65056        -1     99     0        3      #  AgeSel_P4_MexCal_S1(1)_BLK3repl_1991
    -10    11        0.611332       -1     99     0        3      #  AgeSel_P4_MexCal_S1(1)_BLK3repl_1993
    -10    11        1.24275        -1     99     0        3      #  AgeSel_P4_MexCal_S1(1)_BLK3repl_1995
    -10    11        -1.44151       -1     99     0        3      #  AgeSel_P4_MexCal_S1(1)_BLK3repl_1997
    -10    11        -1.96276       -1     99     0        3      #  AgeSel_P4_MexCal_S1(1)_BLK3repl_1999
    -10    11        -0.781195      -1     99     0        3      #  AgeSel_P4_MexCal_S1(1)_BLK3repl_2001
    -10    11        -0.588095      -1     99     0        3      #  AgeSel_P4_MexCal_S1(1)_BLK3repl_2003
    -10    11        -1.23587       -1     99     0        3      #  AgeSel_P4_MexCal_S1(1)_BLK3repl_2005
    -10    11        -1.65662       -1     99     0        3      #  AgeSel_P4_MexCal_S1(1)_BLK3repl_2007
    -10    11        -1.89805       -1     99     0        3      #  AgeSel_P4_MexCal_S1(1)_BLK3repl_2009
    -10    11        0.857451       -1     99     0        3      #  AgeSel_P4_MexCal_S1(1)_BLK3repl_2011
    -10    11        -0.825433      -1     99     0        3      #  AgeSel_P4_MexCal_S1(1)_BLK3repl_2013
    -10    11        -1.46738       -1     99     0        3      #  AgeSel_P5_MexCal_S1(1)_BLK3repl_1983
    -10    11        -1.73536       -1     99     0        3      #  AgeSel_P5_MexCal_S1(1)_BLK3repl_1985
    -10    11        1.99357        -1     99     0        3      #  AgeSel_P5_MexCal_S1(1)_BLK3repl_1987
    -10    11        -6.60371       -1     99     0        3      #  AgeSel_P5_MexCal_S1(1)_BLK3repl_1989
    -10    11        -1.16193       -1     99     0        3      #  AgeSel_P5_MexCal_S1(1)_BLK3repl_1991
    -10    11        -8.25446       -1     99     0        3      #  AgeSel_P5_MexCal_S1(1)_BLK3repl_1993
    -10    11        -3.61304       -1     99     0        3      #  AgeSel_P5_MexCal_S1(1)_BLK3repl_1995
    -10    11        -1.00033       -1     99     0        3      #  AgeSel_P5_MexCal_S1(1)_BLK3repl_1997
    -10    11        -0.719833      -1     99     0        3      #  AgeSel_P5_MexCal_S1(1)_BLK3repl_1999
    -10    11        -1.72685       -1     99     0        3      #  AgeSel_P5_MexCal_S1(1)_BLK3repl_2001
    -10    11        -1.19002       -1     99     0        3      #  AgeSel_P5_MexCal_S1(1)_BLK3repl_2003
    -10    11        -0.593533      -1     99     0        3      #  AgeSel_P5_MexCal_S1(1)_BLK3repl_2005
    -10    11        -6.70495       -1     99     0        3      #  AgeSel_P5_MexCal_S1(1)_BLK3repl_2007
    -10    11        -9.09065       -1     99     0        3      #  AgeSel_P5_MexCal_S1(1)_BLK3repl_2009
    -10    11        -2.65157       -1     99     0        3      #  AgeSel_P5_MexCal_S1(1)_BLK3repl_2011
    -10    11        1.90531        -1     99     0        3      #  AgeSel_P5_MexCal_S1(1)_BLK3repl_2013
    
    -10    15       -4.61064        -1     99     0        3      #  AgeSel_P2_MexCal_S2(2)_BLK7add_1987
    -10    11       -5.46374        -1     99     0        3      #  AgeSel_P2_MexCal_S2(2)_BLK7add_1989
    -10    11       -6.15898        -1     99     0        3      #  AgeSel_P2_MexCal_S2(2)_BLK7add_1991
    -10    11       -5.68187        -1     99     0        3      #  AgeSel_P2_MexCal_S2(2)_BLK7add_1993
    -10    11       -7.5824         -1     99     0        3      #  AgeSel_P2_MexCal_S2(2)_BLK7add_1995
    -10    11       -7.18453        -1     99     0        3      #  AgeSel_P2_MexCal_S2(2)_BLK7add_1997
    -10    11       -8.06382        -1     99     0        3      #  AgeSel_P2_MexCal_S2(2)_BLK7add_1999
    -10    11       -8.1806         -1     99     0        3      #  AgeSel_P2_MexCal_S2(2)_BLK7add_2001
    -10    11       -6.73746        -1     99     0        3      #  AgeSel_P2_MexCal_S2(2)_BLK7add_2003
    -10    11       -8.0591         -1     99     0        3      #  AgeSel_P2_MexCal_S2(2)_BLK7add_2005
    -10    11       -7.80532        -1     99     0        3      #  AgeSel_P2_MexCal_S2(2)_BLK7add_2007
    -10    11       -7.31133        -1     99     0        3      #  AgeSel_P2_MexCal_S2(2)_BLK7add_2009
    -10    11       -9.99909        -1     99     0        3      #  AgeSel_P2_MexCal_S2(2)_BLK7add_2011
    -10    11       -5.55363        -1     99     0        3      #  AgeSel_P2_MexCal_S2(2)_BLK7add_2013
    -10    11       0.0464144       -1     99     0        3      #  AgeSel_P3_MexCal_S2(2)_BLK7add_1987
    -10    11       -1.54417        -1     99     0        3      #  AgeSel_P3_MexCal_S2(2)_BLK7add_1989
    -10    11       -1.34263        -1     99     0        3      #  AgeSel_P3_MexCal_S2(2)_BLK7add_1991
    -10    11       -2.30871        -1     99     0        3      #  AgeSel_P3_MexCal_S2(2)_BLK7add_1993
    -10    11       -1.67646        -1     99     0        3      #  AgeSel_P3_MexCal_S2(2)_BLK7add_1995
    -10    11       -2.29186        -1     99     0        3      #  AgeSel_P3_MexCal_S2(2)_BLK7add_1997
    -10    11       -3.17471        -1     99     0        3      #  AgeSel_P3_MexCal_S2(2)_BLK7add_1999
    -10    11       -1.94895        -1     99     0        3      #  AgeSel_P3_MexCal_S2(2)_BLK7add_2001
    -10    11       -2.7525         -1     99     0        3      #  AgeSel_P3_MexCal_S2(2)_BLK7add_2003
    -10    11       -2.967          -1     99     0        3      #  AgeSel_P3_MexCal_S2(2)_BLK7add_2005
    -10    11       -3.31772        -1     99     0        3      #  AgeSel_P3_MexCal_S2(2)_BLK7add_2007
    -10    11       -6.92883        -1     99     0        3      #  AgeSel_P3_MexCal_S2(2)_BLK7add_2009
    -10    11       -0.899765       -1     99     0        3      #  AgeSel_P3_MexCal_S2(2)_BLK7add_2011
    -10    11       -2.2937         -1     99     0        3      #  AgeSel_P3_MexCal_S2(2)_BLK7add_2013
    -10    11       -0.671829       -1     99     0        3      #  AgeSel_P4_MexCal_S2(2)_BLK7add_1987
    -10    11       0.857174        -1     99     0        3      #  AgeSel_P4_MexCal_S2(2)_BLK7add_1989
    -10    11       1.4884          -1     99     0        3      #  AgeSel_P4_MexCal_S2(2)_BLK7add_1991
    -10    11       -1.37573        -1     99     0        3      #  AgeSel_P4_MexCal_S2(2)_BLK7add_1993
    -10    11       -1.53136        -1     99     0        3      #  AgeSel_P4_MexCal_S2(2)_BLK7add_1995
    -10    11       -0.486081       -1     99     0        3      #  AgeSel_P4_MexCal_S2(2)_BLK7add_1997
    -10    11       -2.35078        -1     99     0        3      #  AgeSel_P4_MexCal_S2(2)_BLK7add_1999
    -10    11       -2.97867        -1     99     0        3      #  AgeSel_P4_MexCal_S2(2)_BLK7add_2001
    -10    11       -0.682306       -1     99     0        3      #  AgeSel_P4_MexCal_S2(2)_BLK7add_2003
    -10    11       -1.5933         -1     99     0        3      #  AgeSel_P4_MexCal_S2(2)_BLK7add_2005
    -10    11       -1.72667        -1     99     0        3      #  AgeSel_P4_MexCal_S2(2)_BLK7add_2007
    -10    11       2.29719         -1     99     0        3      #  AgeSel_P4_MexCal_S2(2)_BLK7add_2009
    -10    11       -0.00537792     -1     99     0        3      #  AgeSel_P4_MexCal_S2(2)_BLK7add_2011
    -10    11       -0.998172       -1     99     0        3      #  AgeSel_P4_MexCal_S2(2)_BLK7add_2013
    
    0      10      2.67796      0      99     0        4      #  Age_inflection_PNW(3)_BLK4repl_1999
    0      10      2.67732      0      99     0        4      #  Age_inflection_PNW(3)_BLK4repl_2001
    0      10      1.91486      0      99     0        4      #  Age_inflection_PNW(3)_BLK4repl_2003
    0      10      2.68313      0      99     0        4      #  Age_inflection_PNW(3)_BLK4repl_2005
    0      10      3.5039      0      99     0        4      #  Age_inflection_PNW(3)_BLK4repl_2007
    0      10      3.95524      0      99     0        4      #  Age_inflection_PNW(3)_BLK4repl_2009
    0      10      2.57091      0      99     0        4      #  Age_inflection_PNW(3)_BLK4repl_2011
    0      10      3.00045      0      99     0        4      #  Age_inflection_PNW(3)_BLK4repl_2013
    
    0      9        6.67699     -1     99     0        4      #  AgeSel_P2_AT_Survey(4)_BLK2repl_2012
    0      9        7.46904     -1     99     0        4      #  AgeSel_P2_AT_Survey(4)_BLK2repl_2013
    0      9        2.95114     -1     99     0        4      #  AgeSel_P2_AT_Survey(4)_BLK2repl_2014
    0      9        0           -1     99     0        -4     #  AgeSel_P2_AT_Survey(4)_BLK2repl_2015
    0      9        3.08035     -1     99     0        4      #  AgeSel_P2_AT_Survey(4)_BLK2repl_2016
    0      9        0           -1     99     0        -4     #  AgeSel_P2_AT_Survey(4)_BLK2repl_2017
    0      9        1.8517      -1     99     0        4      #  AgeSel_P2_AT_Survey(4)_BLK2repl_2018
    0      11       10.0594     -1     99     0        4      #  AgeSel_P2_AT_Survey(4)_BLK2repl_2019

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

