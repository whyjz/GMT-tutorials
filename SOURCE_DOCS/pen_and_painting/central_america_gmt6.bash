# ==== Set Color ====
# mexico, brazil, costa rica, dominican
color1='#CD5C5C'
colorgroup1='MX,BR,CR,DO'
# guatemala, venezuela, jamaica, french guiana, bahamas
color2='pink'
colorgroup2='GT,JM,VE,GF,BS'
# united states, puerto rico, nicaragua, guyana
color3='240/230/140'
colorgroup3='US,PR,NI,GY'
# belize, haiti, trinidad and tobago, panama, salvador
color4='0/36/74/4'
colorgroup4='BZ,HT,TT,PA,SV'
# colombia, cuba, honduras, suriname
color5='97-0.52-0.94'
colorgroup5='CO,CU,HN,SR'
# other countries
color0='169'

# ==== Codes ====

# gmt grdinfo @earth_relief_01m -R-100/1/-50/34r

gmt begin central_america_gmt6 png
    gmt grdimage @earth_relief_01m -JB-80.27/8.58/-8/24/15c -R-100/1/-50/34r -Cgeo
    gmt coast -G${color0} \
              -E${colorgroup1}+g${color1} \
              -E${colorgroup2}+g${color2} \
              -E${colorgroup3}+g${color3} \
              -E${colorgroup4}+g${color4} \
              -E${colorgroup5}+g${color5}
    gmt coast -W1/thinner -N1/thinner -Di -Bafg 
    gmt colorbar -DjRM+w3c -G-8434/0 -Bx3000 -By+lm -F+gwhite@50
gmt end
