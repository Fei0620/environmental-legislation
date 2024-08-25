use PM25.dta, clear
*PM25_death_now calculate
gen z1= ((PM25_now-lower_PM25_now)/(upper_PM25_now-lower_PM25_now))*(upper_PM25_now_RR-lower_PM25_now_RR)+lower_PM25_now_RR
gen z2= (z1-1)/z1
gen PM25_death_now=z2*Number
*PM25_death_now CI calculate
gen z3= ((PM25_now-lower_PM25_now)/(upper_PM25_now-lower_PM25_now))*(CI_95_upper_now_RR-CI_95_lower_now_RR)+CI_95_lower_now_RR
gen z4= (z3-1)/z3
gen PM25_death_now_95=z4*Number

gen z5= ((PM25_now-lower_PM25_now)/(upper_PM25_now-lower_PM25_now))*(CI_5_upper_now_RR-CI_5_lower_now_RR)+CI_5_lower_now_RR
gen z6= (z5-1)/z5
gen PM25_death_now_5=z6*Number

*PM25_death_counterfactual lt calculate
gen z7= ((PM25_lt_les-lower_PM25_ltcoun)/(upper_PM25_ltcoun-lower_PM25_ltcoun))*(upper_PM25_ltcoun_RR-lower_PM25_ltcoun_RR)+lower_PM25_ltcoun_RR
gen z8= (z7-1)/z7
gen PM25_death_ltcoun_1=z8*Number
gen PM25_death_ltcoun=z8*(Number-PM25_death_now+PM25_death_ltcoun_1)
*PM25_death_counterfactual CI calculate
gen z9= ((PM25_lt_les-lower_PM25_ltcoun)/(upper_PM25_ltcoun-lower_PM25_ltcoun))*(CI_95_upper_ltcoun_RR-CI_95_lower_ltcoun_RR)+CI_95_lower_ltcoun_RR
gen z10= (z9-1)/z9
gen PM25_death_ltcoun_95_1=z10*Number
gen PM25_death_ltcoun_95=z10*(Number-PM25_death_now_95+PM25_death_ltcoun_95_1)
gen z11= ((PM25_lt_les-lower_PM25_ltcoun)/(upper_PM25_ltcoun-lower_PM25_ltcoun))*(CI_5_upper_ltcoun_RR-CI_5_lower_ltcoun_RR)+CI_5_lower_ltcoun_RR
gen z12= (z11-1)/z11
gen PM25_death_ltcoun_5_1=z12*Number
gen PM25_death_ltcoun_5=z12*(Number-PM25_death_now_5+PM25_death_ltcoun_5_1)

*PM25_death_counterfactual lt calculate
gen z13= ((PM25_st_les-lower_PM25_stcoun)/(upper_PM25_stcoun-lower_PM25_stcoun))*(upper_PM25_stcoun_RR-lower_PM25_stcoun_RR)+lower_PM25_stcoun_RR
gen z14= (z13-1)/z13
gen PM25_death_stcoun_1=z14*Number
gen PM25_death_stcoun=z14*(Number-PM25_death_now+PM25_death_stcoun_1)
*PM25_death_counterfactual CI calculate
gen z15= ((PM25_st_les-lower_PM25_stcoun)/(upper_PM25_stcoun-lower_PM25_stcoun))*(CI_95_upper_stcoun_RR-CI_95_lower_stcoun_RR)+CI_95_lower_stcoun_RR
gen z16= (z15-1)/z15
gen PM25_death_stcoun_95_1=z16*Number
gen PM25_death_stcoun_95=z16*(Number-PM25_death_now_95+PM25_death_stcoun_95_1)
gen z17= ((PM25_st_les-lower_PM25_stcoun)/(upper_PM25_stcoun-lower_PM25_stcoun))*(CI_5_upper_stcoun_RR-CI_5_lower_stcoun_RR)+CI_5_lower_stcoun_RR
gen z18= (z17-1)/z17
gen PM25_death_stcoun_5_1=z18*Number
gen PM25_death_stcoun_5=z18*(Number-PM25_death_now_5+PM25_death_stcoun_5_1)

*NO2 calculate
cd E:\5.论文写作\环境立法\3.25初稿数据\
use NO2.dta, clear
gen N1=RR^(NO2_now/10)
gen N2=(N1-1)/N1
gen NO2_death_now=N2*Number
*NO2_death_now CI calculate
gen N3=RR_low^(NO2_now/10)
gen N4=(N3-1)/N3
gen NO2_death_now_5=N4*Number

gen N5=RR_upper^(NO2_now/10)
gen N6=(N5-1)/N5
gen NO2_death_now_95=N6*Number
*NO2 counterfactual ltles calculate
gen N7=RR^(NO2_lt_les/10)
gen N8=(N7-1)/N7
gen NO2_death_ltlescoun_1=N8*Number
gen NO2_death_ltlescoun=N8*(Number-NO2_death_now+NO2_death_ltlescoun_1)
*NO2_death_counterfactual ltles CI calculate
gen N9=RR_low^(NO2_lt_les/10)
gen N10=(N9-1)/N9
gen NO2_death_ltlescoun_5_1=N10*Number
gen NO2_death_ltlescoun_5=N10*(Number-NO2_death_now_5+NO2_death_ltlescoun_5_1)

gen N11=RR_upper^(NO2_lt_les/10)
gen N12=(N11-1)/N11
gen NO2_death_ltlescoun_95_1=N12*Number
gen NO2_death_ltlescoun_95=N12*(Number-NO2_death_now_95+NO2_death_ltlescoun_95_1)

*NO2 counterfactual stles calculate
gen N13=RR^(NO2_st_les/10)
gen N14=(N13-1)/N13
gen NO2_death_stlescoun_1=N14*Number
gen NO2_death_stlescoun=N14*(Number-NO2_death_now+NO2_death_stlescoun_1)
*NO2_death_counterfactual stles CI calculate
gen N15=RR_low^(NO2_st_les/10)
gen N16=(N15-1)/N15
gen NO2_death_stlescoun_5_1=N16*Number
gen NO2_death_stlescoun_5=N16*(Number-NO2_death_now_5+NO2_death_stlescoun_5_1)

gen N17=RR_upper^(NO2_st_les/10)
gen N18=(N17-1)/N17
gen NO2_death_stlescoun_95_1=N18*Number
gen NO2_death_stlescoun_95=N12*(Number-NO2_death_now_95+NO2_death_stlescoun_95_1)

*NO2 counterfactual ltre calculate
gen N19=RR^(NO2_lt_re/10)
gen N20=(N19-1)/N19
gen NO2_death_ltrecoun_1=N20*Number
gen NO2_death_ltrecoun=N20*(Number-NO2_death_now+NO2_death_ltrecoun_1)
*NO2_death_counterfactual stles CI calculate
gen N21=RR_low^(NO2_lt_re/10)
gen N22=(N21-1)/N21
gen NO2_death_ltrecoun_5_1=N22*Number
gen NO2_death_ltrecoun_5=N22*(Number-NO2_death_now_5+NO2_death_ltrecoun_5_1)

gen N23=RR_upper^(NO2_lt_re/10)
gen N24=(N23-1)/N23
gen NO2_death_ltrecoun_95_1=N24*Number
gen NO2_death_ltrecoun_95=N24*(Number-NO2_death_now_95+NO2_death_ltrecoun_95_1)


*NO2 counterfactual ltre calculate
gen N25=RR^(NO2_st_re/10)
gen N26=(N25-1)/N25
gen NO2_death_strecoun_1=N26*Number
gen NO2_death_strecoun=N26*(Number-NO2_death_now+NO2_death_strecoun_1)
*NO2_death_counterfactual stles CI calculate
gen N27=RR_low^(NO2_st_re/10)
gen N28=(N27-1)/N27
gen NO2_death_strecoun_5_1=N28*Number
gen NO2_death_strecoun_5=N28*(Number-NO2_death_now_5+NO2_death_strecoun_5_1)

gen N29=RR_upper^(NO2_st_re/10)
gen N30=(N29-1)/N29
gen NO2_death_strecoun_95_1=N30*Number
gen NO2_death_strecoun_95=N30*(Number-NO2_death_now_95+NO2_death_strecoun_95_1)

*O3 calculate
use O3.dta, clear
gen o1=RR^(O3_now/10)
gen o2=(o1-1)/o1
gen O3_death_now=o2*Number
*O3_death_now CI calculate
gen o3=RR_low^(O3_now/10)
gen o4=(o3-1)/o3
gen O3_death_now_5=o4*Number

gen o5=RR_upper^(O3_now/10)
gen o6=(o5-1)/o5
gen O3_death_now_95=o6*Number
*O3 counterfactual calculate
gen o7=RR^(O3_coun/10)
gen o8=(o7-1)/o7
gen O3_death_coun_1=o8*Number
gen O3_death_coun=o8*(Number-O3_death_now+O3_death_coun_1)
*O3_death_counterfactual CI calculate
gen o9=RR_low^(O3_coun/10)
gen o10=(o9-1)/o9
gen O3_death_coun_5_1=o10*Number
gen O3_death_coun_5=o10*(Number-O3_death_now_5+O3_death_coun_5_1)

gen o11=RR_upper^(O3_coun/10)
gen o12=(o11-1)/o11
gen O3_death_coun_95_1=o12*Number
gen O3_death_coun_95=o12*(Number-O3_death_now_95+O3_death_coun_95_1)