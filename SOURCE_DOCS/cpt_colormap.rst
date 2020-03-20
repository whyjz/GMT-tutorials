======================================
使用色階表為網格資料著色
======================================


目標
--------------------------------------

.. _最終版地圖:

.. image:: cpt_colormap/iceland_glacier_speed.png
    :width: 1000px
    :align: center

直接觀看\ `指令稿`_

使用的指令與概念
--------------------------------------
- ``basemap`` - 設定繪圖區、座標軸與邊框
- ``coast`` - 繪製海岸線與陸海域填色
- ``clip`` - **只在給定的多邊形區域內繪製資料**
- ``makecpt`` - **製作與修改色階表**
- ``grdimage`` - 繪製著色影像
- ``plot`` - 繪製多邊形
- ``colorbar`` - 繪製色階條
- ``text`` - 在圖上標記文字
- 外部指令 ``gdalwarp`` - **把網格資料重投影，並轉檔成 NetCDF 格式**
- 如何解釋色階表 (CPT, color palette table) 的內容

前置作業
--------------------------------------


操作流程
--------------------------------------


指令稿
--------------------------------------
本地圖的最終指令稿如下：

.. code-block:: bash

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
    gmt end

.. note::

    「」

觀看\ `最終版地圖`_


習題
--------------------------------------
