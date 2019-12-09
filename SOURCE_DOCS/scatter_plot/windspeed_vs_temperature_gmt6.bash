# ==== Set variables ====
zzh='zzh.txt'
suao='suao.txt'

# gmt gmtinfo zzh.txt suao.txt
# ==== begin to plot ====
gmt begin windszzh.txtpeed_vs_temperature_gmt6 png
	gmt basemap -R-1/23/0/7 -JX15c/10c -BWSne+t"January 2016" -Bxaf+l"Temperature (@.C)" -Bya2f+l"Wind Speed (m s@+-1@+)" 
	gmt plot $zzh  -Sc0.35c -G#58C73A -W0.03c,black
	gmt plot $suao -Sd0.35c -G#3A6BC7 -W0.03c,black
	gmt plot -W0.03c,100,-- <<- LINEEND
	0 0
	0 7
	LINEEND

	gmt plot -W0.05c,black -G#E6F4F2 <<- BOXEND
	16 5
	22 5
	22 6.5
	16 6.5
	BOXEND

	echo "17 6.05" | gmt plot -Sc0.35c -G#58C73A -W0.03c,black
	echo "17 5.45" | gmt plot -Sd0.35c -G#3A6BC7 -W0.03c,black
	echo "18 6.05 Zhuzihu" | gmt text -F+f14p+jML
	echo "18 5.45 Su'ao" | gmt text -F+f14p+jML
gmt end