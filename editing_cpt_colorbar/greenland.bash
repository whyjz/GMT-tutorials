# ==== Set variables ====
in_grd='ETOPO1_Bed_g_gmt4.grd'
out_ps='greenland.ps'
cpt_sea='mby.cpt'
cpt_land='greenland.cpt'

# ==== Make bedrock cpt ====
grd2cpt $in_grd -Ccequal.cpt -R-52/67/-30/80r -L-650/0 -G90/190 \
        -Z -V -N > $cpt_land
makecpt -C$cpt_sea -G0/4000 -Z -M \
        --COLOR_BACKGROUND=82/106/233 >> $cpt_land

# ==== Draw topography map ====
grdimage $in_grd -R-60/57/20/80r -JB-42/76/90/60/4i -K -P -C$cpt_sea \
         -Ba15g15 -BWSne > $out_ps
    # clip previous image along coastline
pscoast          -R -J -O -K -Dh -Gc >> $out_ps
grdimage $in_grd -R -J -O -K -C$cpt_land -B >> $out_ps
    # paste previous image along coastline
pscoast          -R -J -O -K -Q -B+t"Greenland Bedrock" >> $out_ps

# ==== Draw 3 color bars ====
psscale -O -K -C$cpt_sea  -D5.35i/4.5i/1.75i/0.3i -G0/3500 \
        -Bxa1000f+l"Above Sea Level" -By+lm >> $out_ps
psscale -O -K -C$cpt_sea  -D5.1i/1.9i/3i/0.3i     -G-6000/0 -A -I0.5 \
        -Bxa1000f+lBathymetry >> $out_ps
psscale -O    -C$cpt_land -D5.6i/2.9i/1i/0.3i     -GNaN/0      -I0.5 \
        -Bxa600f+lBedrock -Eb0.1i >> $out_ps
