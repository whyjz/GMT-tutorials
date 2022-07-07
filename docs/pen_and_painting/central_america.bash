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
makecpt -Cmby.cpt -T-8000/5100/50 -Z > ocean_new.cpt
grdimage ETOPO1_Bed_g_gmt4.grd -JB-80.27/8.58/-8/24/6i -R-100/1/-50/34r -P -Cocean_new.cpt -K > central_america.ps
pscoast -R -J -O -K -Dh -Bafg -G${color0} >> central_america.ps
pscoast -R -J -O -K -F${colorgroup1}+g${color1} >> central_america.ps
pscoast -R -J -O -K -F${colorgroup2}+g${color2} >> central_america.ps
pscoast -R -J -O -K -F${colorgroup3}+g${color3} >> central_america.ps
pscoast -R -J -O -K -F${colorgroup4}+g${color4} >> central_america.ps
pscoast -R -J -O -K -F${colorgroup5}+g${color5} >> central_america.ps
pscoast -R -J -O -K -F${colorgroup6}+g${color6} >> central_america.ps 
pscoast -R -J -O -K -F${colorgroup7}+g${color7} >> central_america.ps
pscoast -R -J -O -D -W1/thinner -N1/thinner -Bf >> central_america.ps

