# gdalwarp -t_srs EPSG:4326 -dstnodata NaN -of NetCDF ICE_G0240_0000_v.tif ICE_G0240_0000_v_EPSG4326.nc

speed_file=ICE_G0240_0000_v_EPSG4326.nc
glacier_outline=glims_iceland_glacier_outlines.gmt

gmt begin iceland_glacier_speed png
    gmt basemap -Baf -BWNEs -RIS+R0.2 -JM15c
    gmt coast -Wthinnest,darkred -Gdarkseagreen1 -Slightblue -A1
    gmt clip $glacier_outline
    gmt makecpt -Cbatlow -T0/400/10 -D -Z -M --COLOR_NAN=gray
    gmt grdimage $speed_file
    gmt clip -C
    gmt plot $glacier_outline -Wthinner,black
    gmt colorbar -DJCB+w6c+ef -Bx100+l"Glacier Speed (m/yr)"
    echo -16.8 64.95 Vatnajökull | gmt text -F+f12p+jCM
    # echo -16.8 64.9 "Vatnaj\366kull" | gmt text -F+f12p+jCM
gmt end
