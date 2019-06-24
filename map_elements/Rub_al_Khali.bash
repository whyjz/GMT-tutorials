#!/bin/bash


# in_tif_r="LC81600452017098LGN00_B4.TIF"
# in_tif_g="LC81600452017098LGN00_B3.TIF"
# in_tif_b="LC81600452017098LGN00_B2.TIF"
# for i in $in_tif_r $in_tif_g $in_tif_b; do
#   gdal_translate -projwin 190000 2460000 250000 2410000 $i ${i/.TIF/_s.TIF}
#   vmin=$(grdhisteq ${i/.TIF/_s.TIF} -D -C50 | head -n 1 | cut -f 2)
#   vmax=$(grdhisteq ${i/.TIF/_s.TIF} -D -C50 | tail -n 1 | cut -f 1)
#   gdal_translate -of NetCDF -scale $vmin $vmax ${i/.TIF/_s.TIF} ${i/.TIF/_s.grd}
# done

out_ps="Rub_al_Khali.ps"

# in_grd_r="LC81600452017098LGN00_B4_s.grd"
# in_grd_g="LC81600452017098LGN00_B3_s.grd"
# in_grd_b="LC81600452017098LGN00_B2_s.grd"

in_grd_r="LC08_L1TP_160045_20170408_20170414_01_T1_B4_s.grd"
in_grd_g="LC08_L1TP_160045_20170408_20170414_01_T1_B3_s.grd"
in_grd_b="LC08_L1TP_160045_20170408_20170414_01_T1_B2_s.grd"


gmtset MAP_FRAME_TYPE=plain

R=$(grdinfo $in_grd_r -Ir)
grdimage $in_grd_r $in_grd_g $in_grd_b $R -JX15c/0 -P -K > $out_ps
psbasemap -R -J -O -K -B0 >> $out_ps
# GMT 5.2
psbasemap -R -JU40Q/15c -O -K -TdjRT+w2c+f+l\ ,\ ,\ ,N+o1c/1.8c -F+c0.2c/0.2c/0.2c/1c+gwhite@50+r0.5c --FONT=15p >> $out_ps
# GMT 5.4
# psbasemap -R -JU40Q/15c -O -K -TdjRT+w2c+f+l,,,N+o1c/1.8c -F+c0.2c/0.2c/0.2c/1c+gwhite@50+r0.5c --FONT=15p >> $out_ps
psbasemap -R -J         -O -K -LjRB+c22+w10k+f+o2c/2c+u -F+gwhite@50  >> $out_ps


pscoast -R-700000/1100000/1920000/3180000 -JU40Q/5c -O -K -Di -Wthinner -Gwhite -Sgray -B0 -N1/thinnest >> $out_ps

psbasemap -R -JX5c/0 -O -K -D${R#*-R} -F >> $out_ps

echo -300000 2300000 Saudi Arabia | pstext -R -J -O -K -F+f8p+jMC >> $out_ps


psxy -R -J -O -T >> $out_ps

psconvert $out_ps -A -P -Tg
