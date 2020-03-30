# ==== parameter ====
input_xy="coord.txt"
xy_ulaanbaatar="47:55:0N, 106:55:0E"
xy_seattle="47:36:35N, 122:19:59W"
land_color="#CEB9A0"
rl_color="#FF0073"
gc_color="#0044FF"
echo $xy_ulaanbaatar > $input_xy
echo $xy_seattle    >> $input_xy

# ==== Set ====
gmt set FONT_ANNOT_PRIMARY          12p,20,#0D057A \
        FONT_TITLE                  30,Bookman-Demi,#0D057A \
        FORMAT_GEO_MAP              dddF \
        MAP_ANNOT_OBLIQUE           32 \
        MAP_FRAME_TYPE              plain \
        MAP_GRID_CROSS_SIZE_PRIMARY 8p \
        MAP_GRID_PEN_PRIMARY        thinner,#ED99F0 \
        MAP_TICK_PEN_PRIMARY        thicker,black \
        MAP_TITLE_OFFSET            0.5c \
        PS_PAGE_COLOR               ivory 

gmt begin ulaanbaatar_seattle_gmt6 png

	# ==== Lower Mercator ====
	gmt basemap -R70/270/30S/70N -JM13c -B+tMercator
	gmt coast -Dl -A1000 -G$land_color -N1/thick,60 -Ba40f20g20 --MAP_GRID_PEN_PRIMARY=thicker
	gmt plot $input_xy -: -A -W1p,$rl_color
	gmt plot $input_xy -:    -W1p,$gc_color
	gmt plot $input_xy -:    -Sa0.4c -Gblack
	echo "174 41 Rhumb Line"    | gmt text -F+f,18,$rl_color
	echo "174 61 Great Circle"  | gmt text -F+f,18,$gc_color

	# ==== Upper Lambert ====
	gmt basemap -Rg -JA106:55/47:55/13c -Yh+3c -B+tLambert --MAP_TITLE_OFFSET=0c
	gmt coast -Dl -A1000 -G$land_color -N1/thick,60 -Bxg60 -Byg30 --MAP_GRID_CROSS_SIZE_PRIMARY=0p
	gmt plot $input_xy -: -Ap -W1p,$rl_color
	gmt plot $input_xy -:     -W1p,$gc_color
	gmt plot $input_xy -: -Sa0.4c -Gblack
	gmt text -F+a   << ANNOTEND
106.92 -30 0   30@.S
106.92 30  0   30@.N
60     15  70  60@.E
180    15  305 180@.
ANNOTEND
	gmt text -F+a+f << LABELEND
180    40  58  ,Bookman-DemiItalic,$rl_color   Rhumb Line
180    80  58  ,Bookman-DemiItalic,$gc_color   Great Circle
LABELEND

gmt end

# rm -rf gmt.conf
