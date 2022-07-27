gmt begin tangram_gmt6 png
	gmt makecpt -Cwysiwyg -T0/20/1 -A70
	gmt basemap -R0/4/0/4 -JX15c -Bnews
	gmt plot pieces.txt -L -C
	gmt plot lines.txt
gmt end
