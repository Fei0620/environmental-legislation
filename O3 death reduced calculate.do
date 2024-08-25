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

*O3 counterfactual les calculate
gen o7=RR^(O3_les/10)
gen o8=(o7-1)/o7
gen O3_death_lescoun_1=o8*Number
gen O3_death_lescoun=o8*(Number-O3_death_now+O3_death_lescoun_1)
*O3_death_counterfactual les CI calculate
gen o9=RR_low^(O3_les/10)
gen o10=(o9-1)/o9
gen O3_death_lescoun_5_1=o10*Number
gen O3_death_lescoun_5=o10*(Number-O3_death_now_5+O3_death_lescoun_5_1)

gen o11=RR_upper^(O3_les/10)
gen o12=(o11-1)/o11
gen O3_death_lescoun_95_1=o12*Number
gen O3_death_lescoun_95=o12*(Number-O3_death_now_95+O3_death_lescoun_95_1)

*O3 counterfactual ltpo calculate
gen o13=RR^(O3_lt_po/10)
gen o14=(o13-1)/o13
gen O3_death_ltpocoun_1=o14*Number
gen O3_death_ltpocoun=o14*(Number-O3_death_now+O3_death_ltpocoun_1)
*O3_death_counterfactual ltpo CI calculate
gen o15=RR_low^(O3_lt_po/10)
gen o16=(o15-1)/o15
gen O3_death_ltpocoun_5_1=o16*Number
gen O3_death_ltpocoun_5=o16*(Number-O3_death_now_5+O3_death_ltpocoun_5_1)

gen o17=RR_upper^(O3_lt_po/10)
gen o18=(o17-1)/o17
gen O3_death_ltpocoun_95_1=o18*Number
gen O3_death_ltpocoun_95=o18*(Number-O3_death_now_95+O3_death_ltpocoun_95_1)

*O3 counterfactual stpo calculate
gen o19=RR^(O3_st_po/10)
gen o20=(o19-1)/o19
gen O3_death_stpocoun_1=o20*Number
gen O3_death_stpocoun=o20*(Number-O3_death_now+O3_death_stpocoun_1)
*O3_death_counterfactual ltpo CI calculate
gen o21=RR_low^(O3_st_po/10)
gen o22=(o21-1)/o21
gen O3_death_stpocoun_5_1=o22*Number
gen O3_death_stpocoun_5=o22*(Number-O3_death_now_5+O3_death_stpocoun_5_1)

gen o23=RR_upper^(O3_st_po/10)
gen o24=(o23-1)/o23
gen O3_death_stpocoun_95_1=o24*Number
gen O3_death_stpocoun_95=o24*(Number-O3_death_now_95+O3_death_stpocoun_95_1)

*O3 counterfactual ltre calculate
gen o25=RR^(O3_lt_re/10)
gen o26=(o25-1)/o25
gen O3_death_ltrecoun_1=o26*Number
gen O3_death_ltrecoun=o26*(Number-O3_death_now+O3_death_ltrecoun_1)
*O3_death_counterfactual ltre CI calculate
gen o27=RR_low^(O3_lt_re/10)
gen o28=(o27-1)/o27
gen O3_death_ltrecoun_5_1=o28*Number
gen O3_death_ltrecoun_5=o28*(Number-O3_death_now_5+O3_death_ltrecoun_5_1)

gen o29=RR_upper^(O3_lt_re/10)
gen o30=(o29-1)/o29
gen O3_death_ltrecoun_95_1=o30*Number
gen O3_death_ltrecoun_95=o30*(Number-O3_death_now_95+O3_death_ltrecoun_95_1)