gmt begin titicaca_gmt6 png
    gmt grdimage @earth_relief_01m -R-70.8/-17.17/-66.56/-14.42r -JM6i -Cmby.cpt 
    gmt coast -Ir/0.7p,cornflowerblue -N1/0.7p,,-- -Scornflowerblue -Baf -B+t"Lago Titicaca"
gmt end