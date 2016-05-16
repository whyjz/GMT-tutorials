# ==== parameter ====
out_ps="ulaanbaatar_seattle.ps"
input_xy="coord.txt"
xy_ulaanbaatar="47:55:0N, 106:55:0E"
xy_seattle="47:36:35N, 122:19:59W"
land_color="#CEB9A0"
rl_color="#FF0073"
gc_color="#0044FF"
echo $xy_ulaanbaatar > $input_xy
echo $xy_seattle    >> $input_xy

# ==== Set ====
gmtset FONT_TITLE=30,Bookman-Demi,#0D057A \
       FONT_ANNOT_PRIMARY=12p,20,#0D057A \
       FORMAT_GEO_MAP=dddF \
       MAP_FRAME_TYPE=plain \
       MAP_GRID_CROSS_SIZE_PRIMARY=8p \
       MAP_GRID_PEN_PRIMARY=thinner,#ED99F0 \
       MAP_TICK_PEN_PRIMARY=thicker,black \
       MAP_TITLE_OFFSET=0.5c \
       MAP_ORIGIN_X=0 \
       MAP_ANNOT_OBLIQUE=32 \
       PS_CHAR_ENCODING=ISOLatin1+ \
       PS_PAGE_ORIENTATION=portrait \
       PS_PAGE_COLOR=ivory

# ==== Open Door ====
psxy -R0/1/0/1 -JX1c -T -K > $out_ps

# ==== Lower Mercator ====
psbasemap -R70/270/30S/70N -JM13c -O -K -X4c -B+tMercator >> $out_ps
pscoast -R -J -O -K -Dl -A1000 -G$land_color -N1/thick,60 -Ba40f20g20 \
        --MAP_GRID_PEN_PRIMARY=thicker >> $out_ps
psxy $input_xy -R -J -O -K -: -A -W1p,$rl_color >> $out_ps
psxy $input_xy -R -J -O -K -:    -W1p,$gc_color >> $out_ps
psxy $input_xy -R -J -O -K -:    -Sa0.4c -Gblack >> $out_ps
echo "174 41 Rhumb Line"    | pstext -R -J -O -K -F+f,18,$rl_color >> $out_ps
echo "174 61 Great Circle"  | pstext -R -J -O -K -F+f,18,$gc_color >> $out_ps

# ==== Uppder Lambert ====
psbasemap -Rg -JA106:55/47:55/13c -O -K -Y12c -B+tLambert \
        --MAP_TITLE_OFFSET=0c >> $out_ps
pscoast -R -J -O -K -Dl -A1000 -G$land_color -N1/thick,60 -Bxg60 -Byg30 \
        --MAP_GRID_CROSS_SIZE_PRIMARY=0p >> $out_ps
project -C106.92/47.92 -E237.67/47.61 -G10 -N |\
psxy           -R -J -O -K    -W1p,$rl_color >> $out_ps
psxy $input_xy -R -J -O -K -: -W1p,$gc_color >> $out_ps
psxy $input_xy -R -J -O -K -: -Sa0.4c -Gblack >> $out_ps
pstext -R -J -O -K -F+a   >> $out_ps << ANNOTEND
106.92 -30 0   30\260S
106.92 30  0   30\260N
60     15  70  60\260E
180    15  305 180\260
ANNOTEND
pstext -R -J -O -K -F+a+f >> $out_ps << LABELEND
180    40  58  ,Bookman-DemiItalic,$rl_color   Rhumb Line
180    80  58  ,Bookman-DemiItalic,$gc_color   Great Circle
LABELEND

# ==== Close door ====
psxy -R -J -O -T >> $out_ps
rm -rf gmt.conf
