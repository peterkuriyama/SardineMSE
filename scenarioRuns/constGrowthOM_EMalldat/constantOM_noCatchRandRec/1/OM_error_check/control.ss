#V3.30
#C file created using the SS_writectl function in the R package r4ss
#C file write time: 2021-11-17 10:06:54
#
0 # 0 means do not read wtatage.ss; 1 means read and usewtatage.ss and also read and use growth parameters
1 #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern
4 # recr_dist_method for parameters
1 # not yet implemented; Future usage:Spawner-Recruitment; 1=global; 2=by area
1 # number of recruitment settlement assignments 
0 # unused option
# for each settlement assignment:
#_GPattern	month	area	age
1	1	1	0	#_recr_dist_pattern1
#
#_Cond 0 # N_movement_definitions goes here if N_areas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
7 #_Nblock_Patterns
1 8 16 8 1 37 14 #_blocks_per_pattern
#_begin and end years of blocks
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
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
#_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr;5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
0.5 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0 #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
0 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env_var&link	dev_link	dev_minyr	dev_maxyr	dev_PH	Block	Block_Fxn
 1.99e-01	 0.936000	 5.85000e-01	0.0	99.0	0	 -2	0	0	0	0	0	0	0	#_NatM_p_1_Fem_GP_1        
 3.00e+00	30.000000	 9.83064e+00	0.0	99.0	0	  3	0	0	0	0	0	0	0	#_L_at_Amin_Fem_GP_1       
 1.50e+01	40.000000	 2.26560e+01	0.0	99.0	0	  3	0	0	0	0	0	0	0	#_L_at_Amax_Fem_GP_1       
 5.00e-02	 0.990000	 5.72948e-01	0.0	99.0	0	  3	0	0	0	0	0	0	0	#_VonBert_K_Fem_GP_1       
 5.00e-02	 0.500000	 1.92832e-01	0.0	99.0	0	  3	0	0	0	0	0	0	0	#_CV_young_Fem_GP_1        
 1.00e-02	 0.100000	 5.87026e-02	0.0	99.0	0	  3	0	0	0	0	0	0	0	#_CV_old_Fem_GP_1          
-3.00e+00	 3.000000	 7.52420e-06	0.0	99.0	0	 -3	0	0	0	0	0	0	0	#_Wtlen_1_Fem_GP_1         
-3.00e+00	 5.000000	 3.23320e+00	0.0	99.0	0	 -3	0	0	0	0	0	0	0	#_Wtlen_2_Fem_GP_1         
 9.00e+00	19.000000	 1.54400e+01	0.0	99.0	0	 -3	0	0	0	0	0	0	0	#_Mat50%_Fem_GP_1          
-2.00e+01	 3.000000	-8.92520e-01	0.0	99.0	0	 -3	0	0	0	0	0	0	0	#_Mat_slope_Fem_GP_1       
 0.00e+00	10.000000	 1.00000e+00	0.0	99.0	0	 -3	0	0	0	0	0	0	0	#_Eggs/kg_inter_Fem_GP_1   
-1.00e+00	 5.000000	 0.00000e+00	0.0	99.0	0	 -3	0	0	0	0	0	0	0	#_Eggs/kg_slope_wt_Fem_GP_1
 1.00e-01	10.000000	 1.00000e+00	1.0	 1.0	6	 -1	0	0	0	0	0	0	0	#_CohortGrowDev            
 1.00e-06	 0.999999	 5.00000e-01	0.5	 0.5	0	-99	0	0	0	0	0	0	0	#_FracFemale_GP_1          
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; 2=Ricker; 3=std_B-H; 4=SCAA;5=Hockey; 6=B-H_flattop; 7=survival_3Parm;8=Shepard_3Parm
0 # 0/1 to use steepness in initial equ recruitment calculation
0 # future feature: 0/1 to make realized sigmaR a function of SR curvature
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn # parm_name
  3.0	25	15.3811	0	99	0	 1	0	0	0	0	0	0	0	#_SR_LN(R0)  
  0.2	 1	 1.0000	0	99	0	-5	0	0	0	0	0	0	0	#_SR_BH_steep
  0.0	 2	 1.0000	0	99	0	-3	0	0	0	0	0	0	0	#_SR_sigmaR  
-15.0	15	 0.0000	0	99	0	-1	0	0	0	0	0	1	2	#_SR_regime  
  0.0	 0	 0.0000	0	99	0	-3	0	0	0	0	0	0	0	#_SR_autocorr
# timevary SR parameters
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE
-15	15	-4.16801	0	99	0	4	#_SR_regime_BLK1repl_1980
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
0.9365 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
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
#Fishing Mortality info
0.1 # F ballpark
-2006 # F ballpark year (neg value to disable)
2 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
#_overall start F value; overall phase; N detailed inputs to read
0.05 1 0 #_F_setup
#
#_initial_F_parms
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE
0	50	42.8431	0	99	0	1	#_InitF_seas_2_flt_2MexCal_S2
#
#_Q_setup for fleets with cpue or survey data
#_fleet	link	link_info	extra_se	biasadj	float  #  fleetname
    4	1	0	0	0	0	#_AT_Survey 
    5	1	0	0	0	0	#_DEPM      
    6	1	0	0	0	0	#_TEP_all   
-9999	0	0	0	0	0	#_terminator
#_Q_parms(if_any);Qunits_are_ln(q)
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn  #  parm_name
-3	3	 0.00	0	99	0	-2	0	0	0	0	0	5	2	#_LnQ_base_AT_Survey(4)
-3	3	-1.83	0	99	0	-2	0	0	0	0	0	0	0	#_LnQ_base_DEPM(5)     
-3	3	-0.59	0	99	0	-2	0	0	0	0	0	0	0	#_LnQ_base_TEP_all(6)  
# timevary Q parameters
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE
0	3	-0.311	0	99	0	-1	#_LnQ_base_AT_Survey(4)_BLK5repl_2015
# info on dev vectors created for Q parms are reported with other devs after tag parameter section
#
#_size_selex_patterns
#_Pattern	Discard	Male	Special
 1	0	0	0	#_1 MexCal_S1
15	0	0	1	#_2 MexCal_S2
15	0	0	1	#_3 PNW      
 0	0	0	0	#_4 AT_Survey
30	0	0	0	#_5 DEPM     
30	0	0	0	#_6 TEP_all  
#
#_age_selex_patterns
#_Pattern	Discard	Male	Special
17	0	0	8	#_1 MexCal_S1
17	0	0	8	#_2 MexCal_S2
12	0	0	0	#_3 PNW      
17	0	0	1	#_4 AT_Survey
 0	0	0	0	#_5 DEPM     
 0	0	0	0	#_6 TEP_all  
#
#_SizeSelex
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn  #  parm_name
0	30	13.30440	0	99	0	3	0	0	0	0	0	0	0	#_SizeSel_P_1_MexCal_S1(1)
0	10	 2.01244	0	99	0	3	0	0	0	0	0	0	0	#_SizeSel_P_2_MexCal_S1(1)
#_AgeSelex
-10	11	 0.498967	-1	99	0	 3	0	0	0	0	0	0	0	#_AgeSel_P_1_MexCal_S1(1)
-10	11	 0.601905	-1	99	0	 3	0	0	0	0	0	3	2	#_AgeSel_P_2_MexCal_S1(1)
-10	11	 8.531100	-1	99	0	 3	0	0	0	0	0	3	2	#_AgeSel_P_3_MexCal_S1(1)
-10	11	 1.549780	-1	99	0	 3	0	0	0	0	0	3	2	#_AgeSel_P_4_MexCal_S1(1)
-10	11	 1.862770	-1	99	0	 3	0	0	0	0	0	3	2	#_AgeSel_P_5_MexCal_S1(1)
-10	11	 0.152510	-1	99	0	 3	0	0	0	0	0	0	0	#_AgeSel_P_6_MexCal_S1(1)
-10	11	-0.240608	-1	99	0	 3	0	0	0	0	0	0	0	#_AgeSel_P_7_MexCal_S1(1)
-10	11	-1.400660	-1	99	0	 3	0	0	0	0	0	0	0	#_AgeSel_P_8_MexCal_S1(1)
-10	11	-4.975390	-1	99	0	 3	0	0	0	0	0	0	0	#_AgeSel_P_9_MexCal_S1(1)
-10	11	 1.999990	-1	99	0	-3	0	0	0	0	0	0	0	#_AgeSel_P_1_MexCal_S2(2)
-10	15	13.864400	-1	99	0	 3	0	0	0	0	0	7	2	#_AgeSel_P_2_MexCal_S2(2)
-10	11	 1.255320	-1	99	0	 3	0	0	0	0	0	7	2	#_AgeSel_P_3_MexCal_S2(2)
-10	11	 2.062120	-1	99	0	 3	0	0	0	0	0	7	2	#_AgeSel_P_4_MexCal_S2(2)
-10	11	-1.829420	-1	99	0	 3	0	0	0	0	0	0	0	#_AgeSel_P_5_MexCal_S2(2)
-10	11	 1.565140	-1	99	0	 3	0	0	0	0	0	0	0	#_AgeSel_P_6_MexCal_S2(2)
-10	11	-1.543490	-1	99	0	 3	0	0	0	0	0	0	0	#_AgeSel_P_7_MexCal_S2(2)
-10	11	 1.319910	-1	99	0	 3	0	0	0	0	0	0	0	#_AgeSel_P_8_MexCal_S2(2)
-10	11	-2.566660	-1	99	0	 3	0	0	0	0	0	0	0	#_AgeSel_P_9_MexCal_S2(2)
  0	10	 9.514340	 0	99	0	 4	0	0	0	0	0	4	2	#_AgeSel_P_1_PNW(3)      
 -5	15	 1.196080	 0	99	0	 4	0	0	0	0	0	0	0	#_AgeSel_P_2_PNW(3)      
  0	 9	 0.000000	-1	99	0	-3	0	0	0	0	0	0	0	#_AgeSel_P_1_AT_Survey(4)
  0	 9	 2.282580	-1	99	0	 4	0	0	0	0	0	2	2	#_AgeSel_P_2_AT_Survey(4)
# timevary selex parameters 
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE
-10	11	 4.7623500	-1	99	0	 3	#_AgeSel_P_2_MexCal_S1(1)_BLK3repl_1983
-10	11	 5.2454400	-1	99	0	 3	#_AgeSel_P_2_MexCal_S1(1)_BLK3repl_1985
-10	11	 6.0989100	-1	99	0	 3	#_AgeSel_P_2_MexCal_S1(1)_BLK3repl_1987
-10	11	 4.5559900	-1	99	0	 3	#_AgeSel_P_2_MexCal_S1(1)_BLK3repl_1989
-10	11	 0.9032840	-1	99	0	 3	#_AgeSel_P_2_MexCal_S1(1)_BLK3repl_1991
-10	11	 6.2866700	-1	99	0	 3	#_AgeSel_P_2_MexCal_S1(1)_BLK3repl_1993
-10	11	-2.5798700	-1	99	0	 3	#_AgeSel_P_2_MexCal_S1(1)_BLK3repl_1995
-10	11	-0.7877680	-1	99	0	 3	#_AgeSel_P_2_MexCal_S1(1)_BLK3repl_1997
-10	11	-3.9993500	-1	99	0	 3	#_AgeSel_P_2_MexCal_S1(1)_BLK3repl_1999
-10	11	-3.4321800	-1	99	0	 3	#_AgeSel_P_2_MexCal_S1(1)_BLK3repl_2001
-10	11	-1.1154200	-1	99	0	 3	#_AgeSel_P_2_MexCal_S1(1)_BLK3repl_2003
-10	11	-2.1016600	-1	99	0	 3	#_AgeSel_P_2_MexCal_S1(1)_BLK3repl_2005
-10	11	-2.7501300	-1	99	0	 3	#_AgeSel_P_2_MexCal_S1(1)_BLK3repl_2007
-10	11	 6.7148900	-1	99	0	 3	#_AgeSel_P_2_MexCal_S1(1)_BLK3repl_2009
-10	11	 3.6093500	-1	99	0	 3	#_AgeSel_P_2_MexCal_S1(1)_BLK3repl_2011
-10	11	-3.8747600	-1	99	0	 3	#_AgeSel_P_2_MexCal_S1(1)_BLK3repl_2013
-10	11	 1.5618600	-1	99	0	 3	#_AgeSel_P_3_MexCal_S1(1)_BLK3repl_1983
-10	11	 1.1094300	-1	99	0	 3	#_AgeSel_P_3_MexCal_S1(1)_BLK3repl_1985
-10	11	-0.4745590	-1	99	0	 3	#_AgeSel_P_3_MexCal_S1(1)_BLK3repl_1987
-10	11	-0.3518710	-1	99	0	 3	#_AgeSel_P_3_MexCal_S1(1)_BLK3repl_1989
-10	15	 6.7938000	-1	99	0	 3	#_AgeSel_P_3_MexCal_S1(1)_BLK3repl_1991
-10	11	 0.5655350	-1	99	0	 3	#_AgeSel_P_3_MexCal_S1(1)_BLK3repl_1993
-10	11	 2.1315300	-1	99	0	 3	#_AgeSel_P_3_MexCal_S1(1)_BLK3repl_1995
-10	11	 0.1415180	-1	99	0	 3	#_AgeSel_P_3_MexCal_S1(1)_BLK3repl_1997
-10	11	 0.2644690	-1	99	0	 3	#_AgeSel_P_3_MexCal_S1(1)_BLK3repl_1999
-10	11	-0.2342240	-1	99	0	 3	#_AgeSel_P_3_MexCal_S1(1)_BLK3repl_2001
-10	11	-2.7468500	-1	99	0	 3	#_AgeSel_P_3_MexCal_S1(1)_BLK3repl_2003
-10	11	-0.3989510	-1	99	0	 3	#_AgeSel_P_3_MexCal_S1(1)_BLK3repl_2005
-10	11	 1.0611700	-1	99	0	 3	#_AgeSel_P_3_MexCal_S1(1)_BLK3repl_2007
-10	11	 0.6872020	-1	99	0	 3	#_AgeSel_P_3_MexCal_S1(1)_BLK3repl_2009
-10	11	 0.8451010	-1	99	0	 3	#_AgeSel_P_3_MexCal_S1(1)_BLK3repl_2011
-10	11	 0.7124420	-1	99	0	 3	#_AgeSel_P_3_MexCal_S1(1)_BLK3repl_2013
-10	11	-6.8630100	-1	99	0	 3	#_AgeSel_P_4_MexCal_S1(1)_BLK3repl_1983
-10	11	-2.1215300	-1	99	0	 3	#_AgeSel_P_4_MexCal_S1(1)_BLK3repl_1985
-10	11	 1.4578600	-1	99	0	 3	#_AgeSel_P_4_MexCal_S1(1)_BLK3repl_1987
-10	11	 2.9396900	-1	99	0	 3	#_AgeSel_P_4_MexCal_S1(1)_BLK3repl_1989
-10	11	 2.0891800	-1	99	0	 3	#_AgeSel_P_4_MexCal_S1(1)_BLK3repl_1991
-10	11	 1.5850200	-1	99	0	 3	#_AgeSel_P_4_MexCal_S1(1)_BLK3repl_1993
-10	11	 1.3214200	-1	99	0	 3	#_AgeSel_P_4_MexCal_S1(1)_BLK3repl_1995
-10	11	-1.2735800	-1	99	0	 3	#_AgeSel_P_4_MexCal_S1(1)_BLK3repl_1997
-10	11	-1.2701300	-1	99	0	 3	#_AgeSel_P_4_MexCal_S1(1)_BLK3repl_1999
-10	11	-0.3176810	-1	99	0	 3	#_AgeSel_P_4_MexCal_S1(1)_BLK3repl_2001
-10	11	 0.3642040	-1	99	0	 3	#_AgeSel_P_4_MexCal_S1(1)_BLK3repl_2003
-10	11	-1.6851300	-1	99	0	 3	#_AgeSel_P_4_MexCal_S1(1)_BLK3repl_2005
-10	11	-2.9302100	-1	99	0	 3	#_AgeSel_P_4_MexCal_S1(1)_BLK3repl_2007
-10	11	-2.0769200	-1	99	0	 3	#_AgeSel_P_4_MexCal_S1(1)_BLK3repl_2009
-10	11	 0.3991700	-1	99	0	 3	#_AgeSel_P_4_MexCal_S1(1)_BLK3repl_2011
-10	11	-0.9150030	-1	99	0	 3	#_AgeSel_P_4_MexCal_S1(1)_BLK3repl_2013
-10	11	-0.9491190	-1	99	0	 3	#_AgeSel_P_5_MexCal_S1(1)_BLK3repl_1983
-10	11	-4.7886300	-1	99	0	 3	#_AgeSel_P_5_MexCal_S1(1)_BLK3repl_1985
-10	11	-1.3631600	-1	99	0	 3	#_AgeSel_P_5_MexCal_S1(1)_BLK3repl_1987
-10	11	-2.1085400	-1	99	0	 3	#_AgeSel_P_5_MexCal_S1(1)_BLK3repl_1989
-10	11	-1.5721900	-1	99	0	 3	#_AgeSel_P_5_MexCal_S1(1)_BLK3repl_1991
-10	11	-8.5046700	-1	99	0	 3	#_AgeSel_P_5_MexCal_S1(1)_BLK3repl_1993
-10	11	-2.5046100	-1	99	0	 3	#_AgeSel_P_5_MexCal_S1(1)_BLK3repl_1995
-10	11	-0.6446140	-1	99	0	 3	#_AgeSel_P_5_MexCal_S1(1)_BLK3repl_1997
-10	11	-0.6698220	-1	99	0	 3	#_AgeSel_P_5_MexCal_S1(1)_BLK3repl_1999
-10	11	-1.8794900	-1	99	0	 3	#_AgeSel_P_5_MexCal_S1(1)_BLK3repl_2001
-10	11	-1.4959900	-1	99	0	 3	#_AgeSel_P_5_MexCal_S1(1)_BLK3repl_2003
-10	11	 1.6780600	-1	99	0	 3	#_AgeSel_P_5_MexCal_S1(1)_BLK3repl_2005
-10	11	-0.7752920	-1	99	0	 3	#_AgeSel_P_5_MexCal_S1(1)_BLK3repl_2007
-10	11	-8.7527200	-1	99	0	 3	#_AgeSel_P_5_MexCal_S1(1)_BLK3repl_2009
-10	11	-1.9234600	-1	99	0	 3	#_AgeSel_P_5_MexCal_S1(1)_BLK3repl_2011
-10	11	 1.8529400	-1	99	0	 3	#_AgeSel_P_5_MexCal_S1(1)_BLK3repl_2013
-10	15	 3.6742100	-1	99	0	 3	#_AgeSel_P_2_MexCal_S2(2)_BLK7repl_1987
-10	11	 1.7257200	-1	99	0	 3	#_AgeSel_P_2_MexCal_S2(2)_BLK7repl_1989
-10	11	 0.7212420	-1	99	0	 3	#_AgeSel_P_2_MexCal_S2(2)_BLK7repl_1991
-10	11	 1.5777800	-1	99	0	 3	#_AgeSel_P_2_MexCal_S2(2)_BLK7repl_1993
-10	11	-0.3734360	-1	99	0	 3	#_AgeSel_P_2_MexCal_S2(2)_BLK7repl_1995
-10	11	-0.0213933	-1	99	0	 3	#_AgeSel_P_2_MexCal_S2(2)_BLK7repl_1997
-10	11	-0.8391010	-1	99	0	 3	#_AgeSel_P_2_MexCal_S2(2)_BLK7repl_1999
-10	11	-1.6737300	-1	99	0	 3	#_AgeSel_P_2_MexCal_S2(2)_BLK7repl_2001
-10	11	 0.9974680	-1	99	0	 3	#_AgeSel_P_2_MexCal_S2(2)_BLK7repl_2003
-10	11	-0.9576290	-1	99	0	 3	#_AgeSel_P_2_MexCal_S2(2)_BLK7repl_2005
-10	11	-0.4941920	-1	99	0	 3	#_AgeSel_P_2_MexCal_S2(2)_BLK7repl_2007
-10	11	-0.5102170	-1	99	0	 3	#_AgeSel_P_2_MexCal_S2(2)_BLK7repl_2009
-10	11	-3.2994600	-1	99	0	 3	#_AgeSel_P_2_MexCal_S2(2)_BLK7repl_2011
-10	11	 1.3237400	-1	99	0	 3	#_AgeSel_P_2_MexCal_S2(2)_BLK7repl_2013
-10	11	 1.0523800	-1	99	0	 3	#_AgeSel_P_3_MexCal_S2(2)_BLK7repl_1987
-10	11	-0.6829020	-1	99	0	 3	#_AgeSel_P_3_MexCal_S2(2)_BLK7repl_1989
-10	11	-0.7090180	-1	99	0	 3	#_AgeSel_P_3_MexCal_S2(2)_BLK7repl_1991
-10	11	-0.8531750	-1	99	0	 3	#_AgeSel_P_3_MexCal_S2(2)_BLK7repl_1993
-10	11	 0.1061190	-1	99	0	 3	#_AgeSel_P_3_MexCal_S2(2)_BLK7repl_1995
-10	11	-0.3556880	-1	99	0	 3	#_AgeSel_P_3_MexCal_S2(2)_BLK7repl_1997
-10	11	-1.1918200	-1	99	0	 3	#_AgeSel_P_3_MexCal_S2(2)_BLK7repl_1999
-10	11	-0.1681000	-1	99	0	 3	#_AgeSel_P_3_MexCal_S2(2)_BLK7repl_2001
-10	11	-2.0741100	-1	99	0	 3	#_AgeSel_P_3_MexCal_S2(2)_BLK7repl_2003
-10	11	-0.9879530	-1	99	0	 3	#_AgeSel_P_3_MexCal_S2(2)_BLK7repl_2005
-10	11	-1.8716200	-1	99	0	 3	#_AgeSel_P_3_MexCal_S2(2)_BLK7repl_2007
-10	11	-7.6901300	-1	99	0	 3	#_AgeSel_P_3_MexCal_S2(2)_BLK7repl_2009
-10	11	 0.4697610	-1	99	0	 3	#_AgeSel_P_3_MexCal_S2(2)_BLK7repl_2011
-10	11	 0.1789820	-1	99	0	 3	#_AgeSel_P_3_MexCal_S2(2)_BLK7repl_2013
-10	11	 1.1874300	-1	99	0	 3	#_AgeSel_P_4_MexCal_S2(2)_BLK7repl_1987
-10	11	 2.7032000	-1	99	0	 3	#_AgeSel_P_4_MexCal_S2(2)_BLK7repl_1989
-10	11	 3.0715200	-1	99	0	 3	#_AgeSel_P_4_MexCal_S2(2)_BLK7repl_1991
-10	11	-0.2745520	-1	99	0	 3	#_AgeSel_P_4_MexCal_S2(2)_BLK7repl_1993
-10	11	-0.3762330	-1	99	0	 3	#_AgeSel_P_4_MexCal_S2(2)_BLK7repl_1995
-10	11	 0.2466190	-1	99	0	 3	#_AgeSel_P_4_MexCal_S2(2)_BLK7repl_1997
-10	11	-1.5208200	-1	99	0	 3	#_AgeSel_P_4_MexCal_S2(2)_BLK7repl_1999
-10	11	-1.7639300	-1	99	0	 3	#_AgeSel_P_4_MexCal_S2(2)_BLK7repl_2001
-10	11	 0.5671380	-1	99	0	 3	#_AgeSel_P_4_MexCal_S2(2)_BLK7repl_2003
-10	11	-0.4271580	-1	99	0	 3	#_AgeSel_P_4_MexCal_S2(2)_BLK7repl_2005
-10	11	-0.2760650	-1	99	0	 3	#_AgeSel_P_4_MexCal_S2(2)_BLK7repl_2007
-10	11	 6.2036000	-1	99	0	 3	#_AgeSel_P_4_MexCal_S2(2)_BLK7repl_2009
-10	11	 0.6661070	-1	99	0	 3	#_AgeSel_P_4_MexCal_S2(2)_BLK7repl_2011
-10	11	-0.8134270	-1	99	0	 3	#_AgeSel_P_4_MexCal_S2(2)_BLK7repl_2013
  0	10	 2.7979700	 0	99	0	 4	#_AgeSel_P_1_PNW(3)_BLK4repl_1999      
  0	10	 2.7964200	 0	99	0	 4	#_AgeSel_P_1_PNW(3)_BLK4repl_2001      
  0	10	 2.0945500	 0	99	0	 4	#_AgeSel_P_1_PNW(3)_BLK4repl_2003      
  0	10	 2.7498900	 0	99	0	 4	#_AgeSel_P_1_PNW(3)_BLK4repl_2005      
  0	10	 3.4980800	 0	99	0	 4	#_AgeSel_P_1_PNW(3)_BLK4repl_2007      
  0	10	 3.8813400	 0	99	0	 4	#_AgeSel_P_1_PNW(3)_BLK4repl_2009      
  0	10	 2.7983800	 0	99	0	 4	#_AgeSel_P_1_PNW(3)_BLK4repl_2011      
  0	10	 3.0251300	 0	99	0	 4	#_AgeSel_P_1_PNW(3)_BLK4repl_2013      
  0	 9	 6.9364800	-1	99	0	 4	#_AgeSel_P_2_AT_Survey(4)_BLK2repl_2012
  0	 9	 7.6297400	-1	99	0	 4	#_AgeSel_P_2_AT_Survey(4)_BLK2repl_2013
  0	 9	 2.7511500	-1	99	0	 4	#_AgeSel_P_2_AT_Survey(4)_BLK2repl_2014
  0	 9	 0.0000000	-1	99	0	-4	#_AgeSel_P_2_AT_Survey(4)_BLK2repl_2015
  0	 9	 7.9816700	-1	99	0	 4	#_AgeSel_P_2_AT_Survey(4)_BLK2repl_2016
  0	 9	 0.0000000	-1	99	0	-4	#_AgeSel_P_2_AT_Survey(4)_BLK2repl_2017
  0	 9	 1.8830200	-1	99	0	 4	#_AgeSel_P_2_AT_Survey(4)_BLK2repl_2018
  0	11	10.3459000	-1	99	0	 4	#_AgeSel_P_2_AT_Survey(4)_BLK2repl_2019
# info on dev vectors created for selex parms are reported with other devs after tag parameter section
#
0 #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
# Tag loss and Tag reporting parameters go next
0 # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# Input variance adjustments factors: 
#_Factor Fleet Value
-9999 1 0 # terminator
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 18 changes to default Lambdas (default value is 1.0)
#_like_comp	fleet	phase	value	sizefreq_method
    1	4	1	1	1	#_Surv_AT_Survey_Phz1                    
    1	5	1	1	1	#_Surv_DEPM_Phz1                         
    1	6	1	1	1	#_Surv_TEP_all_Phz1                      
    4	1	1	1	1	#_length_MexCal_S1_sizefreq_method_1_Phz1
    4	2	1	1	1	#_length_MexCal_S2_sizefreq_method_1_Phz1
    4	3	1	1	1	#_length_PNW_sizefreq_method_1_Phz1      
    4	4	1	1	1	#_length_AT_Survey_sizefreq_method_1_Phz1
    5	1	1	1	1	#_age_MexCal_S1_Phz1                     
    5	2	1	1	1	#_age_MexCal_S2_Phz1                     
    5	3	1	1	1	#_age_PNW_Phz1                           
    5	4	1	1	1	#_age_AT_Survey_Phz1                     
    9	1	1	0	1	#_init_equ_catch_MexCal_S1_Phz1          
    9	2	1	0	1	#_init_equ_catch_MexCal_S2_Phz1          
    9	3	1	0	1	#_init_equ_catch_PNW_Phz1                
   18	1	1	0	1	#_Regime-shift_MexCal_S1_Phz1            
   18	2	1	0	1	#_Regime-shift_MexCal_S2_Phz1            
   18	3	1	0	1	#_Regime-shift_PNW_Phz1                  
   18	4	1	0	1	#_Regime-shift_AT_Survey_Phz1            
-9999	0	0	0	0	#_terminator                             
#
0 # 0/1 read specs for more stddev reporting
#
999
