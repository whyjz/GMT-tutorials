# ==== Set variables ====
zzh='zzh.txt'
suao='suao.txt'
out_ps='windspeed_vs_temperature.ps'

psbasemap -R-1/23/0/7 -JX15c/10c -P -K -BWS+t"January 2016" -Bxaf+l"Temperature (\260C)" -Bya2f+l"Wind Speed (m s@+-1@+)" --PS_CHAR_ENCODING=ISOLatin1+ > $out_ps
psbasemap  -R -J -O -K -Bne -Bxaf -Bya2f >> $out_ps
psxy $zzh  -R -J -O -K -Sc0.35c -G#58C73A -W0.03c,black >> $out_ps
psxy $suao -R -J -O -K -Sd0.35c -G#3A6BC7 -W0.03c,black >> $out_ps
psxy       -R -J -O -K -W0.03c,100,-- >> $out_ps << LINEEND
0 0
0 7
LINEEND
psxy       -R -J -O -K -W0.05c,black -G#E6F4F2 >> $out_ps << BOXEND
16 5
22 5
22 6.5
16 6.5
BOXEND
echo "17 6.05" | psxy -R -J -O -K -Sc0.35c -G#58C73A -W0.03c,black >> $out_ps
echo "17 5.45" | psxy -R -J -O -K -Sd0.35c -G#3A6BC7 -W0.03c,black >> $out_ps
echo "18 6.05 Zhuzihu" | pstext -R -J -O -K -F+f14p+jML >> $out_ps
echo "18 5.45 Su'ao" | pstext -R -J -O -K -F+f14p+jML >> $out_ps
psxy -R -J -O -T >> $out_ps

