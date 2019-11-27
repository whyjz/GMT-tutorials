# ==== Set Color ====
# mexico, panama, brazil
color1='#CD5C5C'
colorgroup1='MX,BR,PA'
# guatemala, venezuela, jamaica
color2='coral'
colorgroup2='GT,JM,VE'
# united states, puerto rico, salvador
color3='240/230/140'
colorgroup3='US,PR,SV'
# belize, french guiana, haiti, trinidad and tobago
color4='0/36/74/4'
colorgroup4='BZ,GF,HT,TT'
# honduras, colombia, cuba
color5='97-0.52-0.94'
colorgroup5='CO,CU,HN'
# nicaragua, guyana, bahamas
color6='250/138/255'
colorgroup6='BS,GY,NI'
# costa rica, suriname, dominican
color7='#8DC740'
colorgroup7='CR,DO,SR'
# other countries
color0='169'

# ==== Codes ====
gmt begin central_america_gmt6 png
# gmt makecpt -C../coloring_topography/mby.cpt -T-8000/5100/50 -Z
# gmt makecpt -Cgeo
# gmt grdimage @earth_relief_01m -JB-80.27/8.58/-8/24/6i -R-100/1/-50/34r -C
# gmt grdimage @earth_relief_01m -JB-80.27/8.58/-8/24/6i -R-100/1/-50/34r
gmt grdimage @earth_relief_01m -JM6i -RNG
# gmt coast -Bafg -G${color0}
# gmt coast -E${colorgroup1}+g${color1}
# gmt coast -E${colorgroup2}+g${color2}
# gmt coast -E${colorgroup3}+g${color3}
# gmt coast -E${colorgroup4}+g${color4}
# gmt coast -E${colorgroup5}+g${color5}
# gmt coast -E${colorgroup6}+g${color6}
# gmt coast -E${colorgroup7}+g${color7}
gmt coast -W1/thinner -N1/thinner -Bf
gmt end