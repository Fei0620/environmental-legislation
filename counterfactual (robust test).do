encode id,gen(id1)
xtset id1 year
gen lnO3=ln(O3)
gen lngdp=ln(gdp)
gen lngdp2=lngdp*lngdp
gen lnCO2=ln(CO2)
gen lnPM25=ln(PM25)
gen lnNO2=ln(NO2)

*replace
xtreg lnCO2 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bCO2_ltl= _b[lt_les]*(lt_les) 
gen bCO2_ltr= _b[lt_re]*(lt_re)
gen bCO2_str= _b[st_re]*(st_re)
gen CO2_coun=(CO2*exp(-bCO2_ltl-bCO2_ltr-bCO2_str))

xtreg lnPM25 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bPM_ltl= _b[lt_les]*(lt_les) 
gen bPM_stl= _b[st_les]*(st_les) 
gen bPM_stp= _b[st_po]*(st_po) 
gen PM25_coun=(PM25*exp(-bPM_ltl-bPM_stl-bPM_stp))

xtreg lnO3 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bO3_ltl= _b[lt_les]*(lt_les) 
gen bO3_stl= _b[st_les]*(st_les)
gen bO3_ltp= _b[lt_po]*(lt_po) 
gen bO3_ltr= _b[lt_re]*(lt_re) 
gen bO3_str= _b[st_re]*(st_re) 
gen O3_coun=(O3*exp(-bO3_ltl-bO3_stl-bO3_ltp-bO3_ltr-bO3_str))

xtreg lnNO2 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bNO2_ltl= _b[lt_les]*(lt_les) 
gen bNO2_ltp= _b[lt_po]*(lt_po) 
gen bNO2_stp= _b[st_po]*(st_po) 
gen bNO2_ltr= _b[lt_re]*(lt_re)  
gen NO2_coun=(NO2*exp(-bNO2_ltl-bNO2_ltp-bNO2_stp-bNO2_ltr))


*delect
xtreg lnCO2 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bCO2_ltl= _b[lt_les]*(lt_les) 
gen bCO2_stl= _b[st_les]*(st_les)
gen bCO2_ltr= _b[lt_re]*(lt_re)
gen bCO2_str= _b[st_re]*(st_re)
gen CO2_coun=(CO2*exp(-bCO2_ltl-bCO2_stl-bCO2_ltr-bCO2_str))

xtreg lnPM25 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bPM_ltl= _b[lt_les]*(lt_les) 
gen bPM_stl= _b[st_les]*(st_les) 
gen bPM_stp= _b[st_po]*(st_po) 
gen PM25_coun=(PM25*exp(-bPM_ltl-bPM_stl-bPM_stp))

xtreg lnO3 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bO3_ltl= _b[lt_les]*(lt_les) 
gen bO3_stl= _b[st_les]*(st_les)
gen bO3_ltr= _b[lt_re]*(lt_re) 
gen bO3_str= _b[st_re]*(st_re) 
gen O3_coun=(O3*exp(-bO3_ltl-bO3_stl-bO3_ltr-bO3_str))

xtreg lnNO2 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bNO2_ltl= _b[lt_les]*(lt_les) 
gen bNO2_ltp= _b[lt_po]*(lt_po) 
gen bNO2_stp= _b[st_po]*(st_po) 
gen bNO2_ltr= _b[lt_re]*(lt_re)  
gen NO2_coun=(NO2*exp(-bNO2_ltl-bNO2_ltp-bNO2_stp-bNO2_ltr))


