======================================
3D 視圖
======================================


目標
--------------------------------------

.. _最終版地圖:

.. image:: view3d/afar.png

直接觀看\ `指令稿`_

使用的指令與概念
--------------------------------------
- ``gmtset`` - 更改 GMT 的預設作圖參數
- ``grdcut`` - **裁剪網格檔**
- ``grdgradient`` - 計算網格檔的梯度與照明值
- ``psxy`` - 輸出檔頭與檔尾
- ``psbasemap`` - **製作 3-D 底圖與添加地圖元素**
- ``grdview`` - **繪製 3-D 視圖**
- ``psconvert`` - 把 ps 檔轉成 png 檔


前置作業
--------------------------------------


操作流程
--------------------------------------


指令稿
--------------------------------------
本地圖的最終指令稿如下：

.. code-block:: bash

    in_grd="ETOPO1_Bed_g_gmt4_Afar.grd"
    in_shadow="ETOPO1_Bed_g_gmt4_Afar_shadow.grd"

    out_ps="afar.ps"

    font="12p,31,black"
    font_title="15p,29,black"

    gmtset MAP_FRAME_TYPE=plain \
           FONT_ANNOT_PRIMARY=$font \
           FONT_LABEL=$font \
           FONT_TITLE=$font_title \
           FORMAT_GEO_MAP=dddF

    # 製作輸入檔
    # grdcut ../ETOPO1_Bed_g_gmt4.grd -R25/55/-5/25 -G$in_grd
    grdgradient $in_grd -G$in_shadow -A295 -N10

    psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps

    psbasemap -R38/44//7/14/-2/3 -JM3i -JZ0.6i -O -K -p60/25 -B2 -Bz2+lkm -BsEwNZ >> $out_ps

    grdview ETOPO1_Bed_g_gmt4_Afar.grd -R38/44//7/14/-2000/3000 -I$in_shadow -J -JZ -O -K -p -Cmby.cpt -N-2000+ggray -Qi500 >> $out_ps

    psbasemap -R -J -JZ -O -K -p -TdjRB+w1.5c+l,,,N+o2c/0c >> $out_ps
    psbasemap -R0/1/0/1 -JX4.5i/2.5i -O -K -B+t"Topography of the Afar Triangle" >> $out_ps

    psxy -R0/1/0/1 -JX1c -O -T >> $out_ps

    psconvert $out_ps -A -P -Tg

.. note::

    「」

觀看\ `最終版地圖`_


習題
--------------------------------------

