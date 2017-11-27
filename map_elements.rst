======================================
加入地圖元素
======================================


目標
--------------------------------------

.. _最終版地圖:

.. image:: map_elements/Rub_al_Khali.png

直接觀看\ `指令稿`_


使用的指令與概念
--------------------------------------
- ``gmtset`` - 更改 GMT 的預設作圖參數
- ``grdinfo`` - **由網格資料建立** ``-R`` **設定**
- ``grdimage`` - **以 RGB 資料進行繪圖**
- ``psbasemap`` - **添加不同的地圖元素**
- ``pscoast`` - 繪製海岸線、國界與海域填色
- ``pstext`` - 在地圖上加入文字
- ``psxy`` - 輸出檔尾
- ``psconvert`` - 把 ps 檔轉成 png 檔並保留透明度設定
- 外部指令 ``echo`` - 把資料輸入到管線命令中
- 如何繪製分圖 (Map Inset)


前置作業
--------------------------------------


操作流程
--------------------------------------


指令稿
--------------------------------------
本地圖的最終指令稿如下：

.. code-block:: bash

    out_ps="Rub_al_Khali.ps"

    in_grd_r="LC81600452017098LGN00_B4_s.grd"
    in_grd_g="LC81600452017098LGN00_B3_s.grd"
    in_grd_b="LC81600452017098LGN00_B2_s.grd"

    gmtset MAP_FRAME_TYPE=plain

    R=$(grdinfo $in_grd_r -I1/1)
    grdimage $in_grd_r $in_grd_g $in_grd_b -R$in_grd_r -JX15c/0 -P -K > $out_ps
    psbasemap -R -J -O -K -B0 >> $out_ps
    # GMT 5.2
    # psbasemap -R -JU40Q/15c -O -K -TdjRT+w2c+f+l\ ,\ ,\ ,N+o1c/1.8c -F+c0.2c/0.2c/0.2c/1c+gwhite@50+r0.5c --FONT=15p >> $out_ps
    # GMT 5.4
    psbasemap -R -JU40Q/15c -O -K -TdjRT+w2c+f+l,,,N+o1c/1.8c -F+c0.2c/0.2c/0.2c/1c+gwhite@50+r0.5c --FONT=15p >> $out_ps
    psbasemap -R -J         -O -K -LjRB+c22+w10k+f+o2c/2c+u -F+gwhite@50  >> $out_ps

    pscoast -R-700000/1100000/1920000/3180000 -JU40Q/5c -O -K -Di -Wthinner -Gwhite -Sgray -B0 -N1/thinnest >> $out_ps

    psbasemap -R -JX5c/0 -O -K -D${R#*-R} -F >> $out_ps

    echo -300000 2300000 Saudi Arabia | pstext -R -J -O -K -F+f8p+jMC >> $out_ps

    psxy -R -J -O -T >> $out_ps

    psconvert $out_ps -A -P -Tg

.. note::

    「」

觀看\ `最終版地圖`_

習題
--------------------------------------

