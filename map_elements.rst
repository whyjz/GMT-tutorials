======================================
加入地圖元素
======================================
為了使呈現的資料更容易判讀，一張地圖上通常會含有其它的輔助性圖示。除了網格線和地圖四周的座標數字外，常見的圖示還有\
比例尺、指北記號以及分圖等等。在本章中，我們要來試著使用 GMT 標上這些地圖元素。

目標
--------------------------------------
繪製\ `魯卜哈利沙漠 <https://zh.wikipedia.org/wiki/%E9%B2%81%E5%8D%9C%E5%93%88%E5%88%A9%E6%B2%99%E6%BC%A0>`_
(Rub' al Khali 或 الربع الخالي) 其中一個\
小區域的 `Landsat <https://zh.wikipedia.org/wiki/%E9%99%B8%E5%9C%B0%E8%A1%9B%E6%98%9F%E8%A8%88%E7%95%AB>`_
衛星影像，並標上指北針、比例尺及在阿拉伯半島的大略位置。魯卜哈利沙漠具有全世界最大的連續沙丘區域\ [#]_\ ，也是全世界最杳無人煙的地方之一。\
如同其阿拉伯語的意思「空曠的四分之一」，在這片區域除了沙丘以外幾乎什麼也沒有；\
然而，魯卜哈利沙漠的衛星影像卻讓我們發現了大地之母的藝術實驗室。無數的\
`新月丘 <https://en.wikipedia.org/wiki/Barchan>`_\ 連綿不絕，日以繼夜的移動、合併與分離，\
奇幻的畫面甚至會讓你懷疑這是否是真的自然景觀。由於以上特殊的地理、氣候條件，魯卜哈利沙漠也是研究由風力所形塑的地表作用的絕佳地點。\
在本衛星影像中，所有的新月形沙丘似乎都朝向相同的方向。這個事實告訴了我們在這個區域，盛行風是從西北偏北的方向吹來。\
為什麼？請看\ `這裡 <http://nadm.gl.ntu.edu.tw/nadm/cht/class_detail.php?serial=122&serial_type_1=8&serial_type_2=4&serial_type_3=16>`_\ 。

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
- 如何使用正確的 ``-J`` 投影選項套疊衛星影像與其他地理空間資料
- 如何繪製分圖 (Map Inset)

前置作業
--------------------------------------


操作流程
--------------------------------------


指令稿
--------------------------------------
本地圖的最終指令稿如下：

.. code-block:: bash

    # ==== 設定變數 ====
    out_ps="Rub_al_Khali.ps"
    in_grd_r="LC81600452017098LGN00_B4_s.grd"    # 輸入檔，作為紅色 (R) 波段
    in_grd_g="LC81600452017098LGN00_B3_s.grd"    # 輸入檔，作為綠色 (G) 波段
    in_grd_b="LC81600452017098LGN00_B2_s.grd"    # 輸入檔，作為藍色 (B) 波段

    # ==== 調整 GMT 預設參數 ====
    gmtset MAP_FRAME_TYPE=plain

    # ==== 繪製衛星影像 ====
        # 取得 -R 資訊並畫圖 (注意 -J 的設定！)
    R=$(grdinfo $in_grd_r -I1/1)
    grdimage $in_grd_r $in_grd_g $in_grd_b -R$in_grd_r -JX15c/0 -P -K > $out_ps
        # 繪製不含任何標記的邊框
    psbasemap -R -J -O -K -B0 >> $out_ps

    # ==== 繪製地圖元素 ====
        # 繪製指北針 (注意 -J 的設定！)
            # GMT 5.2
    # psbasemap -R -JU40Q/15c -O -K -TdjRT+w2c+f+l\ ,\ ,\ ,N+o1c/1.8c -F+c0.2c/0.2c/0.2c/1c+gwhite@50+r0.5c --FONT=15p >> $out_ps
            # GMT 5.4
    psbasemap -R -JU40Q/15c -O -K -TdjRT+w2c+f+l,,,N+o1c/1.8c -F+c0.2c/0.2c/0.2c/1c+gwhite@50+r0.5c --FONT=15p >> $out_ps
        # 繪製比例尺
    psbasemap -R -J         -O -K -LjRB+c22+w10k+f+o2c/2c+u -F+gwhite@50  >> $out_ps
        # 繪製分圖，放上鄰近區域的海岸線和國界位置
    pscoast -R-700000/1100000/1920000/3180000 -JU40Q/5c -O -K -Di -Wthinner -Gwhite -Sgray -B0 -N1/thinnest >> $out_ps
        # 標上主地圖在分圖中的位置 (注意 -J 的設定！) 與其他文字
    psbasemap -R -JX5c/0 -O -K -D${R#*-R} -F >> $out_ps
    echo -300000 2300000 Saudi Arabia | pstext -R -J -O -K -F+f8p+jMC >> $out_ps

    # ==== 關門 (寫入 EOF) 與轉檔 ====
    psxy -R -J -O -T >> $out_ps
    psconvert $out_ps -A -P -Tg

.. note::

    「」

觀看\ `最終版地圖`_

習題
--------------------------------------


.. [#] Peter Vincent (2008). 
       `Saudi Arabia: an environmental overview <https://books.google.com/books?id=Vacv2wy3yd8C&pg=PA141>`_. 
       Taylor & Francis. p. 141. ISBN 978-0-415-41387-9.

