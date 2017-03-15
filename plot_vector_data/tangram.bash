
out_ps="tangram.ps"
in_cpt="tangram.cpt"

makecpt -Cwysiwyg -A70 > $in_cpt
psxy -R0/4/0/4 -JX15c -T -K -P > $out_ps

psxy lines.txt -R -J -O -K >> $out_ps
psxy pieces.txt -R -J -O -K -L -C$in_cpt >> $out_ps

psxy -R -J -O -T >> $out_ps

ps2raster $out_ps -A -P -Tg