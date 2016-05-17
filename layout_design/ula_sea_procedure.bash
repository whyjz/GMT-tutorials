    # ==== 設定變數 ====
    out_ps="layout_design_fig6.ps"
    input_xy="coord.txt"
    xy_ulaanbaatar="47:55:0N, 106:55:0E"       # 烏蘭巴托的座標
    xy_seattle="47:36:35N, 122:19:59W"         # 西雅圖的座標
    land_color="#CEB9A0"                       # pscoast 的陸域填色
    gcp_color="#0044FF"                        # 大圓路徑的顏色
    psl_color="#FF0073"                        # 恆向線的顏色
        # 把兩個城市的 xy 座標寫入 $input_xy 檔案中。
        # 如果你已經下載了 coord.txt，以下兩行可以註解掉。
    echo $xy_ulaanbaatar > $input_xy
    echo $xy_seattle    >> $input_xy

    # ==== 調整 GMT 預設參數 ====
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

    # ==== 開門 (寫入 PS 檔頭) ====
    psxy -R0/1/0/1 -JX1c -T -K > $out_ps

    # ==== 繪圖 (麥卡托) ====
    psbasemap -R70/270/30S/70N -JM13c -O -K -X4c -B+tMercator >> $out_ps 
    pscoast -R -J -O -K -Dl -A1000 -G$land_color -N1/thick,60 -Ba40f20g20 \
            --MAP_GRID_PEN_PRIMARY=thicker >> $out_ps 
    psxy $input_xy -R -J -O -K -: -A -W1p,$psl_color >> $out_ps    # 恆向線
    psxy $input_xy -R -J -O -K -:    -W1p,$gcp_color >> $out_ps    # 大圓路徑
    psxy $input_xy -R -J -O -K -:    -Sa0.4c -Gblack >> $out_ps    # 城市的位置，-Sa0.4c 是外接圓為 0.4 公分的星形符號。
        # 兩條線的說明文字
    echo "174 41 Rhumb Line"              | pstext -R -J -O -K -F+f,18,$psl_color >> $out_ps
    echo "174 61 Great Circle Path"       | pstext -R -J -O -K -F+f,18,$gcp_color >> $out_ps

    # ==== 繪圖 (蘭伯特) ====
    psbasemap -Rg -JA106:55/47:55/13c -O -K -Y12c -B+tLambert \
            --MAP_TITLE_OFFSET=0c >> $out_ps      # 把標題與地圖邊框弄靠近一點
    pscoast -R -J -O -K -Dl -A1000 -G$land_color -N1/thick,60 -Bxg60 -Byg30 \
            --MAP_GRID_CROSS_SIZE_PRIMARY=0p >> $out_ps      # 這次我們不要十字符號出現在此地圖中
    project -C106.92/47.92 -E237.67/47.61 -G10 -N |\
    psxy           -R -J -O -K    -W1p,$psl_color >> $out_ps    # 在蘭伯特投影中的恆向線
    psxy $input_xy -R -J -O -K -: -W1p,$gcp_color >> $out_ps    # 大圓路徑
    psxy $input_xy -R -J -O -K -: -Sa0.4c -Gblack >> $out_ps    # 城市位置

    # ==== 關門 (寫入 EOF) ====
    psxy -R -J -O -T >> $out_ps
