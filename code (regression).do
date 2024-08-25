desctable lnCO2 lnPM25 lnO3 lnNO2 lt_les st_les lt_po st_po lt_re st_re  lngdp rule Cor ins tem, ///
 filename("descriptivesEX2") stats(mean freq sd min max iqr median)
 
encode id,gen(id1)
xtset id1 year
gen lnO3=ln(O3)
gen lngdp=ln(gdp)
gen lngdp2=lngdp*lngdp
gen lnCO2=ln(CO2)
gen lnPM25=ln(PM25)
gen lnNO2=ln(NO2)
xtreg lnCO2 lt_law st_law  lngdp lngdp2 rule Cor ins tem i.year, fe
 outreg2  using test1tobit3.xls.xls,  bdec(4) sdec(4) 
xtreg lnPM25 lt_law st_law  lngdp lngdp2 rule Cor ins tem i.year, fe
 outreg2  using test1tobit3.xls.xls,  bdec(4) sdec(4) 
xtreg lnNO2 lt_law st_law  lngdp lngdp2 rule Cor ins tem i.year, fe
 outreg2  using test1tobit3.xls.xls,  bdec(4) sdec(4) 
xtreg lnO3 lt_law st_law  lngdp lngdp2 rule Cor ins tem i.year, fe
 outreg2  using test1tobit3.xls.xls,  bdec(4) sdec(4) 

xtreg lnO3 lt_law st_law  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bO3_lt= _b[lt_law]*(lt_law) 
gen O3_coun=(O3*exp(-bO3_lt))

xtreg lnCO2 lt_law st_law  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bCO2_lt= _b[lt_law]*(lt_law) 
gen CO2_coun=(CO2*exp(-bCO2_lt))

xtreg lnPM25 lt_law st_law  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bPM_lt= _b[lt_law]*(lt_law) 
gen bPM_st= _b[st_law]*(st_law) 
gen PM25_coun1=(PM25*exp(-bPM_lt-bPM_st))

xtreg lnNO2 lt_law st_law  lngdp lngdp2 rule Cor ins tem i.year, fe
gen bNO2_lt= _b[lt_law]*(lt_law) 
gen bNO2_st= _b[st_law]*(st_law) 
gen NO2_coun=(NO2*exp(-bNO2_lt-bNO2_st))

xtreg lnCO2 lt_les st_les  lngdp lngdp2 rule Cor ins tem i.year, fe
 outreg2  using test1tobit2.xls.xls,  bdec(4) sdec(4) 
xtreg lnPM25 lt_les st_les  lngdp lngdp2 rule Cor ins tem i.year, fe
 outreg2  using test1tobit2.xls.xls,  bdec(4) sdec(4) 
xtreg lnNO2 lt_les st_les  lngdp lngdp2 rule Cor ins tem i.year, fe
 outreg2  using test1tobit2.xls.xls,  bdec(4) sdec(4) 
xtreg lnO3 lt_les st_les  lngdp lngdp2 rule Cor ins tem i.year, fe
 outreg2  using test1tobit2.xls.xls,  bdec(4) sdec(4) 
 
xtreg lnCO2 lt_po st_po  lngdp lngdp2 rule Cor ins tem i.year, fe
 outreg2  using test1tobit2.xls.xls,  bdec(4) sdec(4) 
xtreg lnPM25 lt_po st_po  lngdp lngdp2 rule Cor ins tem i.year, fe
 outreg2  using test1tobit2.xls.xls,  bdec(4) sdec(4) 
xtreg lnNO2 lt_po st_po  lngdp lngdp2 rule Cor ins tem i.year, fe
 outreg2  using test1tobit2.xls.xls,  bdec(4) sdec(4) 
xtreg lnO3 lt_po st_po  lngdp lngdp2 rule Cor ins tem i.year, fe
 outreg2  using test1tobit2.xls.xls,  bdec(4) sdec(4) 

xtreg lnCO2 lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
 outreg2  using test1tobit2.xls.xls,  bdec(4) sdec(4) 
xtreg lnPM25 lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
 outreg2  using test1tobit2.xls.xls,  bdec(4) sdec(4) 
xtreg lnNO2 lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
 outreg2  using test1tobit2.xls.xls,  bdec(4) sdec(4) 
xtreg lnO3 lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
 outreg2  using test1tobit2.xls.xls,  bdec(4) sdec(4) 
 
xtreg lnCO2 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
xtreg lnPM25 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
xtreg lnNO2 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
xtreg lnO3 lt_les st_les lt_po st_po lt_re st_re  lngdp lngdp2 rule Cor ins tem i.year, fe
 outreg2  using test1tobit3.xls.xls,  bdec(4) sdec(4) 
 