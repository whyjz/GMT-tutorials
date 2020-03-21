======================================
使用色階表為網格資料著色
======================================

.. attention::

    本教學適用於 GMT 6 的現代模式。

在前幾章中，我們簡單介紹了地圖的著色技巧。本章將延續這個主題，介紹如何熟練的運用色階表，在地圖上任何你想要的地方著色。

目標
--------------------------------------
使用美國國家太空總署 (NASA) 提供的 ITS_LIVE 的資料集\ [#]_\ 與美國國家冰雪數據中心 (NSIDC) 提供的 GLIMS 冰河覆蓋區域資料\ [#]_，繪製冰島上所有冰河的移動速度。為了方便判讀冰河移動速度，在地圖下方加上了色階條顯示速度與顏色的對應關係。圖中特別標記了冰島最大的冰帽：瓦特納冰原 (Vatnajökull)。全冰島移動速度最快的冰河就發源於此冰帽，每年移動超過 400 公尺。沒有數據的冰河區域，會以灰色呈現在地圖上。

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
我們這次要使用兩種不同的額外資料，第一是冰河的移動速度，第二是冰河的覆蓋範圍。拜科技發展所賜，這兩種資料都可以在網路上免費取得。

首先來尋找冰河速度的資料吧。NASA 的 ITS_LIVE 計畫 (全名為「多種衛星組合成的陸冰速度與高度的時間序列」，Inter-mission Time Series of Land Ice Velocity and Elevation) 提供了多年份的冰河速度資料\ [#]_。前往 `ITS_LIVE 的資料搜尋網頁 <https://nsidc.org/apps/itslive/>`_，在世界地圖上點選冰島的區域，會跳出一個白色的小視窗，如下圖所示。

.. image:: cpt_colormap/cpt_colormap_fig1.png

點選藍色的區塊，選擇「Composite: 240m」(多年份彙整資料，240 米解析度) 的資料集，最後再點選「v」(速度) 的連結，下載 ``ICE_G0240_0000_v.tif``。這是一個 `GeoTIFF <https://en.wikipedia.org/wiki/GeoTIFF>`_ 檔，也是一種網格地理資料儲存的格式，與 GMT 支援的 NetCDF 格式類似。不同的是，GeoTIFF 大多使用 ``.tif`` 作為副檔名，而且自身帶有網格的投影法與座標系統等資料。本檔案使用的投影法是 NSIDC 極區投影。為了讓 GMT 能夠正確讀取本檔案，我們需要使用 `GDAL <software.html#id8>`_ 附的 ``gdalwarp`` 指令，把 Geotiff 轉檔為 NetCDF 格式，並且重投影成經緯度編碼 (EPSG:4326)：

.. code-block:: bash

    $ gdalwarp -t_srs EPSG:4326 -dstnodata NaN -of NetCDF ICE_G0240_0000_v.tif ICE_G0240_0000_v_EPSG4326.nc
    # 選項意義：
    # -t_srs: 輸出檔案的投影法 (EPSG 是投影法的編碼系統。EPSG:4326 就是 WGS84 經緯度座標系統的編碼代號。)
    # -dstnodata: 輸出檔案中代表「無資料」的數值 (NaN 意味著使用浮點數的 NaN 數值)
    # -of: 輸出檔案格式

注意我們使用了不同的副檔名 ``.nc`` 代表這是 NetCDF 格式的網格檔。

.. note::
    雖然這邊你可以使用任何你想得到的附檔名，但為了方便識別，我只推薦使用 ``.nc`` 或者\ `之前提及到 <coloring_topography.html#id9>`_\ 的 ``.grd`` 作為 NetCDF 檔的副檔名。

再來我們要下載冰河覆蓋區域的資料。NSIDC 的 GLIMS 資料庫 (全名為「從太空測量全球陸冰」，Global Land Ice Measurements from Space) 具有全球冰河的資料\ [#]_，但我們只需要冰島的區域就可以了。前往 `GLIMS Glacier Viewer <http://www.glims.org/maps/glims>`_，把地圖滑到冰島周圍，你應該會看到下圖：

.. image:: cpt_colormap/cpt_colormap_fig2.png

點選「Download GLIMS Data in Current View」，然後在新開啟的視窗中的 File format 選單中選擇 GMT 格式，其他選項保持預設，最後按下 Download Data 按鈕。把下載的檔案解壓縮，裡面的 ``glims_polygons.gmt`` 檔案就是我們要的冰河覆蓋區域的多邊形檔。把它改名為 ``glims_iceland_glacier_outlines.gmt`` 以茲識別。

.. note::
    這個 ``.gmt`` 檔其實是純文字檔，可以使用文字編輯器開啟。此格式將在「\ :doc:`plot_vector_data`\ 」中詳細描述與解釋。

為了方便起見，你也可以直接從以下連結取得本章節使用的兩個檔案：

:download:`ICE_G0240_0000_v_EPSG4326.nc <cpt_colormap/ICE_G0240_0000_v_EPSG4326.nc>`

:download:`glims_iceland_glacier_outlines.gmt <cpt_colormap/glims_iceland_glacier_outlines.gmt>`

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

.. [#] Gardner, A. S., M. A. Fahnestock, and T. A. Scambos, 2019 [updated 2020]: ITS_LIVE Regional Glacier and Ice Sheet Surface Velocities. Data archived at National Snow and Ice Data Center; doi:10.5067/6II6VW8LLWJ7.


.. [#] Raup, B.H.; A. Racoviteanu; S.J.S. Khalsa; C. Helm; R. Armstrong; Y. Arnaud (2007).  "The GLIMS Geospatial Glacier Database: a New Tool for Studying Glacier Change".  Global and Planetary Change 56:101--110. (doi:10.1016/j.gloplacha.2006.07.018)

.. [#] Gardner, A. S., G. Moholdt, T. Scambos, M. Fahnstock, S. Ligtenberg, M. van den Broeke, and J. Nilsson, 2018: Increased West Antarctic and unchanged East Antarctic ice discharge over the last 7 years, Cryosphere, 12(2): 521–547, doi:10.5194/tc-12-521-2018.

.. [#] GLIMS and NSIDC (2005, updated 2019): Global Land Ice Measurements from Space glacier database. Compiled and made available by the international GLIMS community and the National Snow and Ice Data Center, Boulder CO, U.S.A.  DOI:10.7265/N5V98602
