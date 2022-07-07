# ==== parameter ====
out_ps="hawaiian-emperor.ps"
in_img="grav.img.23.1"
in_grd="grav_hawaiian.grd"
in_shadow="grav_hawaiian_shade.grd"
master_cpt="Spectral.cpt"
in_cpt="hawaiian-emperor.cpt"
pen="thin,black"
font="14p,13,black"

# ==== Make input files ====
img2grd $in_img -M -G$in_grd -R150/210/15/60
grdgradient $in_grd -G$in_shadow -A45 -N10
grd2cpt $in_grd -C$master_cpt -S44 -I > $in_cpt

# ==== Configuration ====
gmtset MAP_FRAME_TYPE=plain \
       MAP_GRID_PEN_PRIMARY=$pen \
       MAP_TICK_PEN_PRIMARY=$pen \
       FONT_ANNOT_PRIMARY=$font \
       FONT_LABEL=$font \
       FORMAT_GEO_MAP=dddF \
       PROJ_ELLIPSOID=Sphere

# ==== Open Door ====
psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps

# ==== Hillshade Map ====
grdimage $in_grd -Jx0.25c -O -K -C$in_cpt -I$in_shadow -Y3c >> $out_ps
pscoast -R150/210/14.9925850705/60.0052682687 -Dh -A50 -Jm0.25c -O -K -G100 -Wthin \
        >> $out_ps
psbasemap -R -J -O -K -Bxa20g180 -Bya20g40 >> $out_ps
pstext -R -J -O -K -F+a+jCM+f20p,15,black=0.5p,white >> $out_ps << TEXT1END
166 40 -81 Emperor Chain     
184 23 -21 Hawaiian Chain
TEXT1END
pstext -R -J -O -K -F+a+jCM+f$font -Givory -Wthin -N -TO >> $out_ps << TEXT2END
209 17 0  Hawaii     
159 56 70 Kamchatka
190 55 22 Aleutian Islands
TEXT2END
psscale -O -K -C$in_cpt -D3i/-1.5c/6i/0.5ch -G-1000/1000 \
        -Bxa500f250+l"Gravity Anomaly (10@+-4@+ Gal)" >> $out_ps

# ==== Close door ====
psxy -R -J -O -T >> $out_ps
rm -rf gmt.conf
