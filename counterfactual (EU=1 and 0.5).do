encode id,gen(id1)
xtset id1 year
gen lnO3=ln(O3)
gen lngdp=ln(gdp)
gen lngdp2=lngdp*lngdp
gen lnCO2=ln(CO2)
gen lnPM25=ln(PM25)
gen lnNO2=ln(NO2)

*EU=1
xtreg lnCO2 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bCO2_ltl= _b[lt_les]*(lt_les) 
gen bCO2_stl= _b[st_les]*(st_les)
gen bCO2_ltr= _b[lt_re]*(lt_re)
gen bCO2_str= _b[st_re]*(st_re)
gen CO2_coun=(CO2*exp(-bCO2_ltl-bCO2_stl-bCO2_ltr-bCO2_str))
gen CO2_les=(CO2*exp(-bCO2_ltl-bCO2_stl))-CO2
gen CO2_lt_les=(CO2*exp(-bCO2_ltl))-CO2
gen CO2_st_les=(CO2*exp(-bCO2_ltl-bCO2_stl))-(CO2*exp(-bCO2_ltl))
gen CO2_re=CO2_coun-(CO2*exp(-bCO2_ltl-bCO2_stl))
gen CO2_lt_re=(CO2*exp(-bCO2_ltl-bCO2_stl-bCO2_ltr))-(CO2*exp(-bCO2_ltl-bCO2_stl))
gen CO2_st_re=(CO2*exp(-bCO2_ltl-bCO2_stl-bCO2_ltr-bCO2_str))-(CO2*exp(-bCO2_ltl-bCO2_stl-bCO2_ltr))

 outreg2  using test1tobit4.xls.xls,  bdec(4) sdec(4) 
 
xtreg lnPM25 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bPM_ltl= _b[lt_les]*(lt_les) 
gen bPM_stl= _b[st_les]*(st_les) 
gen bPM_ltr= _b[lt_re]*(lt_re) 
gen PM25_coun=(PM25*exp(-bPM_ltl-bPM_stl))
gen PM25_les=(PM25*exp(-bPM_ltl-bPM_stl))-PM25
gen PM25_lt_les=(PM25*exp(-bPM_ltl))-PM25
gen PM25_st_les=(PM25*exp(-bPM_ltl-bPM_stl))-(PM25*exp(-bPM_ltl))


xtreg lnO3 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bO3_ltl= _b[lt_les]*(lt_les) 
gen bO3_ltp= _b[lt_po]*(lt_po) 
gen bO3_stp= _b[st_po]*(st_po) 
gen bO3_ltr= _b[lt_re]*(lt_re) 
gen O3_coun=(O3*exp(-bO3_ltl-bO3_ltp-bO3_stp-bO3_ltr))
gen O3_les=(O3*exp(-bO3_ltl))-O3
gen O3_po=(O3*exp(-bO3_ltl-bO3_ltp-bO3_stp))-(O3*exp(-bO3_ltl))
gen O3_lt_po=(O3*exp(-bO3_ltl-bO3_ltp))-(O3*exp(-bO3_ltl))
gen O3_st_po=(O3*exp(-bO3_ltl-bO3_ltp-bO3_stp))-(O3*exp(-bO3_ltl-bO3_ltp))
gen O3_re=(O3*exp(-bO3_ltl-bO3_ltp-bO3_stp-bO3_ltr))-(O3*exp(-bO3_ltl-bO3_ltp-bO3_stp))

xtreg lnNO2 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bNO2_ltl= _b[lt_les]*(lt_les) 
gen bNO2_stl= _b[st_les]*(st_les) 
gen bNO2_ltr= _b[lt_re]*(lt_re) 
gen bNO2_str= _b[st_re]*(st_re) 
gen NO2_coun=(NO2*exp(-bNO2_ltl-bNO2_stl-bNO2_ltr-bNO2_str))
gen NO2_les=(NO2*exp(-bNO2_ltl-bNO2_stl))-NO2
gen NO2_lt_les=(NO2*exp(-bNO2_ltl))-NO2
gen NO2_st_les=(NO2*exp(-bNO2_ltl-bNO2_stl))-(NO2*exp(-bNO2_ltl))
gen NO2_re=(NO2*exp(-bNO2_ltl-bNO2_stl-bNO2_ltr-bNO2_str))-(NO2*exp(-bNO2_ltl-bNO2_stl))
gen NO2_lt_re=(NO2*exp(-bNO2_ltl-bNO2_stl-bNO2_ltr))-(NO2*exp(-bNO2_ltl-bNO2_stl))
gen NO2_st_re=(NO2*exp(-bNO2_ltl-bNO2_stl-bNO2_ltr-bNO2_str))-(NO2*exp(-bNO2_ltl-bNO2_stl-bNO2_ltr))
*EU=0.5
xtreg lnCO2 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bCO2_ltl= _b[lt_les]*(lt_les) 
gen bCO2_stl= _b[st_les]*(st_les)
gen bCO2_ltr= _b[lt_re]*(lt_re)
gen bCO2_str= _b[st_re]*(st_re)
gen CO2_coun=(CO2*exp(-bCO2_ltl-bCO2_stl-bCO2_ltr-bCO2_str))
gen CO2_les=(CO2*exp(-bCO2_ltl-bCO2_stl))-CO2
gen CO2_re=CO2_coun-CO2_les
 outreg2  using test1tobit4.xls.xls,  bdec(4) sdec(4) 
 
xtreg lnPM25 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bPM_ltl= _b[lt_les]*(lt_les) 
gen bPM_stl= _b[st_les]*(st_les) 
gen PM25_coun=(PM25*exp(-bPM_ltl-bPM_stl))
gen PM25_les=(PM25*exp(-bPM_ltl-bPM_stl))-PM25


xtreg lnO3 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bO3_ltl= _b[lt_les]*(lt_les) 
gen bO3_ltp= _b[lt_po]*(lt_po) 
gen bO3_stp= _b[st_po]*(st_po) 
gen bO3_ltr= _b[lt_re]*(lt_re) 
gen O3_coun=(O3*exp(-bO3_ltl-bO3_ltp-bO3_stp-bO3_ltr))
gen O3_les=(O3*exp(-bO3_ltl))-O3
gen O3_po=(O3*exp(-bO3_ltl-bO3_ltp-bO3_stp))-(O3*exp(-bO3_ltl))
gen O3_re=(O3*exp(-bO3_ltl-bO3_ltp-bO3_stp-bO3_ltr))-(O3*exp(-bO3_ltl-bO3_ltp-bO3_stp))

xtreg lnNO2 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bNO2_ltl= _b[lt_les]*(lt_les) 
gen bNO2_stl= _b[st_les]*(st_les) 
gen bNO2_stp= _b[st_po]*(st_po) 
gen bNO2_ltr= _b[lt_re]*(lt_re) 
gen bNO2_str= _b[st_re]*(st_re) 
gen NO2_coun=(NO2*exp(-bNO2_ltl-bNO2_stl-bNO2_stp-bNO2_ltr-bNO2_str))
gen NO2_les=(NO2*exp(-bNO2_ltl-bNO2_stl))-NO2
gen NO2_po=(NO2*exp(-bNO2_ltl-bNO2_stl-bNO2_stp))-(NO2*exp(-bNO2_ltl-bNO2_stl))
gen NO2_re=(NO2*exp(-bNO2_ltl-bNO2_stl-bNO2_stp-bNO2_ltr-bNO2_str))-(NO2*exp(-bNO2_ltl-bNO2_stl-bNO2_stp))