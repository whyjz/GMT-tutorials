======================================
為地形圖上色
======================================

.. attention::

    本教學適用於 GMT 6 的現代模式。如須參閱 GMT 6 (傳統模式) 與 GMT 4-5 繪製相同地圖的教程，\ `請至這裡 <coloring_topography_gmt5.html>`_。

把地圖依照不同屬性、在不同區域著色，可以把龐大的資料有效視覺化。最常用來著色的屬性，高度絕對是其中之一。在典型的地形圖中，不同的海拔高度會套上不同的顏色。本章中將會詳細說明如何利用地表的不同高度，製作彩色的地形圖。

目標
--------------------------------------
製作一張\ `的的喀喀湖`_ (Lago Titicaca) 的分層設色地形圖，如下圖所示。的的喀喀湖位於秘魯和玻利維亞交界，面積達 8372 平方公里。特殊的是，湖面位置的海拔高達 3812 公尺，是全世界最高的商業通航湖泊\ [#]_。圖中的藍色線條表示河流，注意右側的河流其實是亞馬遜河的源頭，而且並沒有和的的喀喀湖連接。黑色的虛線是兩國國界。地形圖的顏色從海拔 0 至 5000 公尺，依循以下顏色過渡：綠色 -> 黃色 -> 紅色 -> 灰色 -> 白色，其中 2800 公尺以上即開始以灰色系展示。這麼高的湖泊，位於一片白色系背景當中，更增添了些許雪國的氣氛 (實際上，的的喀喀湖冬天非常乾燥，幾乎不會下雪\ [#]_)。

.. _的的喀喀湖: https://zh.wikipedia.org/wiki/%E7%9A%84%E7%9A%84%E5%96%80%E5%96%80%E6%B9%96
.. _Lake Titicaca: https://en.wikipedia.org/wiki/Lake_Titicaca

.. _最終版地圖:

.. image:: coloring_topography/titicaca_gmt6.png
    :width: 1000px
    :align: center

直接觀看\ `指令稿`_


使用的指令與概念
--------------------------------------

- ``grdinfo`` - **查閱網格檔的基本資訊**
- ``grdimage`` - **繪製著色影像**
- ``coast`` - **繪製河流、湖泊與國界**
- 使用 GMT 伺服器的地形資料繪圖
- 從 `cpt-city`_ 尋找適合地圖的色階檔
- 如何疊加輸出圖層
- 使用腳本、``gmt begin`` 和 ``gmt end``，一次下達所有繪圖指令

.. GMT 共用選項：``-O`` ``-K``


.. _cpt-city: http://soliton.vm.bytemark.co.uk/pub/cpt-city

取得資料
--------------------------------------
這次我們必須要先取得繪圖區域的地形資料。GMT 6 本身有提供全球的地形資料，不過是放在遠端伺服器上，當使用者需要時才會下載到本機電腦中。這些地形資料的檔名為：

.. code-block:: bash

    @earth_relief_rru

其中 ``rr`` 是解析度的大小，而 ``u`` 是單位 (有度 ``d``、分 ``m``、秒 ``s`` 可選)。我們在這邊要使用的是全球解析度 1 弧分的地形高程，因此檔名為 ``@earth_relief_01m``。其他可供選擇的資料，皆在 `GMT 官方手冊中有說明 <https://docs.generic-mapping-tools.org/latest/datasets/earth_relief.html>`_。如果你想查閱地形資料的更多資訊，可以透過終端機輸入 ``grdinfo`` 指令來達成。執行畫面會像如下所示：


.. 這類型的資料有時後會被視作機密，尤其是高解析度的區域資料，時常需經申請或付費才能使用。不過這次我們預計使用的資料，已經公開在網路上了，任何人都可以直接下載使用。它就是 `ETOPO`_，或稱為「全球地形數位模型」。ETOPO 是由美國大氣海洋局 (NOAA) 附屬的美國環境資訊中心 (NCEI) 建立及維護，此資料庫蒐集了數個不同測高衛星與海洋探測的地形調查資料，再把他們統一彙整到相同的解析度。這裡我們要用資料版本是 ETOPO1 Bedrock (ETOPO 解析度 1 弧分的地形高程，極區採用冰層下的基盤高度) 以 **netCDF** 格式發布的檔案。檔案可以在 `ETOPO`_ 的網站下載 (ETOPO1 Bedrock -> grid-registered: netCDF)，或是使用如下快速連結下載：

.. `下載 ETOPO1 Bedrock netCDF 檔`_ (383M，解壓後約 891M)

.. ETOPO: https://www.ngdc.noaa.gov/mgg/global/global.html
.. 下載 ETOPO1 Bedrock netCDF 檔: https://www.ngdc.noaa.gov/mgg/global/relief/ETOPO1/data/bedrock/grid_registered/netcdf/ETOPO1_Bed_g_gmt4.grd.gz


.. code-block:: bash

    $ gmt grdinfo @earth_relief_01m
    earth_relief_01m: Download file from the GMT data server [data set size is 214M].
    earth_relief_01m: Earth Relief at 1x1 arc minutes obtained by Gaussian Cartesian filtering (1.9 km fullwidth) of SRTM15+V2 [Tozer et al., 2019].

    /home/whyj/.gmt/server/earth_relief_01m.grd: Title: Earth Relief at 01 arc minute
    /home/whyj/.gmt/server/earth_relief_01m.grd: Command: grdfilter SRTM15+V2.nc -Fg1.9 -D1 -I01m -rg -Gearth_relief_01m.grd=ns --IO_NC4_DEFLATION_LEVEL=9 --PROJ_ELLIPSOID=Sphere
    /home/whyj/.gmt/server/earth_relief_01m.grd: Remark: Obtained by Gaussian Cartesian filtering (1.9 km fullwidth) from SRTM15+V2.nc [Tozer et al., 2019; http://dx.doi.org/10.1029/2019EA000658]
    /home/whyj/.gmt/server/earth_relief_01m.grd: Gridline node registration used [Geographic grid]
    /home/whyj/.gmt/server/earth_relief_01m.grd: Grid file format: ns = GMT netCDF format (16-bit integer), CF-1.7
    /home/whyj/.gmt/server/earth_relief_01m.grd: x_min: -180 x_max: 180 x_inc: 0.0166666666667 (1 min) name: longitude n_columns: 21601
    /home/whyj/.gmt/server/earth_relief_01m.grd: y_min: -90 y_max: 90 y_inc: 0.0166666666667 (1 min) name: latitude n_rows: 10801
    /home/whyj/.gmt/server/earth_relief_01m.grd: z_min: -10907 z_max: 8170 name: elevation (m)
    /home/whyj/.gmt/server/earth_relief_01m.grd: scale_factor: 1 add_offset: 0
    /home/whyj/.gmt/server/earth_relief_01m.grd: format: netCDF-4 chunk_size: 129,129 shuffle: on deflation_level: 9

訊息的前兩行在有需要下載時才會出現。下載下來的檔案預設是放在 ``~/.gmt/server/`` 這個位置，之後 GMT 會先查看這個位置有沒有已經下載的檔案，如果沒有的話才會再次下載。下載檔檔名為 ``earth_relief_01m.grd``，副檔名 ``.grd`` 表明了它是某種「網格檔 (grid)」，亦即地球的二維表面被切割成網格狀，每個「格子」內，都有一個相對應的高度數據。(非常類似 GeoTiff 的概念，只不過在 GeoTiff 中，相對應的術語稱為「像素」而非「網格點」。) ``.grd`` 檔是 netCDF 格式常見的附檔名，也就是說它可被 GMT 讀取並作圖。另外，從 ``grdinfo`` 的輸出中你還可以看到其他的基本資訊，像是

- 網格檔是從 `SRTM15+V2 <https://topex.ucsd.edu/WWW_html/srtm15_plus.html>`_ 這個資料庫重新取樣而來。
- X 從 -180 度到 180 度，Y 從 -90 度到 90 度，意味著此網格檔涵蓋全球的範圍。
- 網格大小是 0.0166666666667，也就是 1/60 度 (1 弧分)。
- 總共有 21601 x 10801 = 233312401 個格點 (也就是兩億三千三百萬像素)。
- Z 值 (高度) 從 -10907 到 8170 公尺。為什麼最高的地方不是 8848 公尺 (聖母峰的高度)? 那是因為網格的解析度還是不夠高，1 弧分其實只相當於 1 至 2 公里才取一個點而已。

操作流程
--------------------------------------
從本章開始，我們需要使用兩個以上的 GMT 指令製作地圖。在上一章介紹過的 ``coast`` 用來畫向量式資料 (河流、湖泊以及國界)，而在本章中新介紹的 ``grdimage`` 則用來畫地形起伏。因為上一章介紹的 ``-png`` 選項只適用於單一指令，所以在本章我們要用另一種更通用的方式指定輸出檔。具體做法是使用 ``gmt begin`` 和 ``gmt end`` 這兩個關鍵字串把其他所有繪圖指令包起來，像這樣：

.. code-block:: bash

    $ gmt begin [輸出地圖主檔名，不用加附檔名] [格式]      # 輸入後按下 enter
    $ [繪圖指令1]    # 輸入後按下 enter
    $ [繪圖指令2]    # 輸入後按下 enter
    ...
    $ gmt end


你可以一行一行的在命令列中打好指令再送出執行，不過為了修改方便，我們通常會選擇把所有的指令先寫在\ :ref:`腳本 <腳本>`\ 內，再執行此腳本以一次送出所有指令給電腦。在本章中，我們就要來介紹這種更爲便捷的方式。

畫地圖的第一步就是決定繪製區域。如同前一章「\ :doc:`making_first_map`\ 」所述，我們可以使用 *Google Map* 等工具決定區域。這裡我們考慮到高度的呈現效果，選擇經度從 -70.8 到 -66.56 (負值表示西經)，緯度從 -17.17 到 -14.42 (負值表示南緯。)

.. figure:: coloring_topography/coloring_topography_fig1.png
    :align: center

    本次作圖區域在 `Google Map` 上呈現的樣子。

使用 ``grdimage`` 呈現地形數據，最少需要提供兩個參數，分別是 ``輸入檔`` 和 ``-J`` (投影方法和地圖大小)。在這裡我們也需要使用 ``-R`` 指定繪製區域，如果不加 ``-R`` 的話，GMT 會把全網格檔的資料話在地圖上 (因爲我們使用的是全球地形資料，所以輸出會是全球地圖)。就讓我們來畫一張跟\ `前一章 <making_first_map.html>`_\ 一樣寬度的地圖吧。請建立新文字檔，檔名可以為 ``titicaca.bash`` 或任何你喜歡、且符合作業系統格式慣例的名字。然後在檔案中輸入：


.. code-block:: bash

    gmt begin titicaca png
        gmt grdimage @earth_relief_01m -R-70.8/-17.17/-66.56/-14.42r -JM6i 
    gmt end

你會注意到我們在 ``gmt grdimage`` 前面多加了四個空格，這純粹只是製造縮排效果，讓閱讀腳本的人知道這行被包在 ``gmt begin`` 和 ``gmt end`` 之間，增加腳本的可讀性。縮排與否和空格數量不會影響腳本的執行。如需 ``-R`` 與 ``-J`` 選項的語法說明，請至「\ :doc:`making_first_map`\ 」中查閱。存檔後，在\ :ref:`終端機`\ 模式下前往 ``titicaca.bash`` 所在的資料夾，然後執行腳本 (以 Linux 系統爲例)：

.. code-block:: bash

    $ bash titicaca.bash

.. 這邊順便加了 ``-P``，方便輸出圖檔的觀看。

.. note::

    不同的作業系統的腳本會有不同的額外設定，可以讓你的腳本能夠更方便的執行，詳情請參閱「\ :doc:`basic_concept`\」。

輸出的圖檔 ``titicaca.png`` 開啟後應該會是如下的圖案：

.. image:: coloring_topography/coloring_topography_gmt6_fig2.png
    :width: 1000px
    :align: center


有點難以看懂？這是因為 GMT 預設的套色沒那麼適合這個地區的緣故。在未指定地圖的套色下繪製 ``@earth_relief`` 地形資料時，GMT 會用一套名為 ``geo`` 的色階來呈色。這個色階的顏色如下所示

.. image:: coloring_topography/coloring_topography_gmt6_fig3.png
    :align: center
    :scale: 50


圖中的 ``0`` 和 ``1`` 的顏色，也就是深藍色和白色，會對應到地圖範圍中最低和最高的的地方。有沒有辦法換成另一種比較好看的色階？當然可以，GMT 有數種方法可以製造或調整色階，但這邊我們要先來看一種最簡單的方法：直接下載已經做好的色階來用。

`cpt-city`_ 網站蒐集了不少常用的色階，其中也包括 GMT 格式的色階檔。GMT 色階檔通常使用副檔名 ``.cpt``，是 color palette table (色階表) 的縮寫。你可以在網站中搜尋你想要的色階，例如\ `這個網頁 <http://soliton.vm.bytemark.co.uk/pub/cpt-city/views/totp-cpt.html>`_\ 就列了許多最常被下載的 ``.cpt`` 檔。我們這次來用其中的一個叫做 ``mby`` 的色階看看。按下 ``mby`` 的色階表，你應該就會看到如下頁面

.. image:: coloring_topography/coloring_topography_fig4.png
    :align: center

注意圖中的 **-8000 ... 5000**，這是指此色階已經被指定在 -8000 到 5000 公尺之內呈現了。按一下網頁上的 `cpt` 連結就可以把此色階檔下載下來。

為了方便起見，\ :download:`這邊 <coloring_topography/mby.cpt>`\ 也提供了 ``mby.cpt`` 的下載點。

使用 ``grdimage`` 中的 ``-C`` 選項，就可以指定要用的色階，只要在 ``-C`` 後接續色階檔檔名就行了。所以我們更新版的腳本為：

.. code-block:: bash

    gmt begin titicaca png
        gmt grdimage @earth_relief_01m -R-70.8/-17.17/-66.56/-14.42r -JM6i -Cmby.cpt
    gmt end

使用相同的方式再執行一次腳本，這次地圖會變成這樣

.. image:: coloring_topography/coloring_topography_gmt6_fig5.png
    :width: 1000px
    :align: center

看起來已經有模有樣了。

.. note::

    有關於如何自訂色階表，讓地圖的顏色可以隨心所欲變化的技巧，請參閱「\ :doc:`pen_and_painting`\ 」與「\ :doc:`editing_cpt_colorbar`\ 」。

這個地圖目前有個大問題，就是我們雖然知道地圖中大部份的區域都很高 (灰白色)，但是卻看不到我們的主角\ `的的喀喀湖`_。這是因為地形資料只有記載高度，並沒有記載地表的狀態，所以光靠 ``grdimage`` 是無從得知哪邊是湖泊、海洋等等地貌的。因此，為了標上\ `的的喀喀湖`_\ 的位置，我們需要呼叫 ``coast`` 這個指令，利用內建的水體資料幫我們畫上湖泊，順便再畫上邊框。

當一張地圖包含兩個以上的作圖指令時，\ **越上方的圖層要越後畫**。由於我們希望 ``coast`` 畫的湖泊水體疊加在 ``grdimage`` 畫的地形資料上，所以 ``coast`` 指令要排在 ``grdimage`` 之後。再次打開腳本，把內容修改爲：

.. code-block:: bash

    gmt begin titicaca png
        gmt grdimage @earth_relief_01m -R-70.8/-17.17/-66.56/-14.42r -JM6i -Cmby.cpt
        gmt coast -Scornflowerblue -Baf -B+t"Lago Titicaca"
    gmt end

關於 ``coast`` 的指令解說，請至「\ :doc:`making_first_map`\ 」查看。另外，你或許會發現在 ``coast`` 中，沒有 ``-R`` 和 ``-J`` 選項。\ **當不指定這些選項時，GMT 會自動沿用上次的設定**，也就是 ``grdimage`` 的 ``-R`` 與 ``-J`` 資訊，省下重複輸入相同內容的麻煩。

.. tip::

    1. ``coast`` 的 ``-S`` 選項會套用在所有水域。如果你的地圖中有海又有湖，而你想分別為海跟湖指定不同顏色，可以試試看換成 ``-C`` 選項。因為本圖沒有海域，``-Scornflowerblue`` 和 ``-Cl/cornflowerblue`` 具有相同效果，不過後者其實只會為湖泊填上顏色。

    2. 讓我們看一下 ``coast`` 中的兩個 ``-B`` 選項。實際上它們也可以加在 ``grdimage`` 中，因為邊框屬於哪個圖層在本例中不影響地圖疊加，所以效果會一模一樣。   

在終端機中執行腳本，然後開啟輸出檔，應該會看到下圖：

.. image:: coloring_topography/coloring_topography_gmt6_fig6.png
    :width: 1000px
    :align: center


.. 現在湖和邊框是出現了，但是之前畫的地形卻不見了？原來是我們使用了兩次 ``>`` 符號。``>`` 符號會覆蓋掉上一次存檔的內容，因為上面的腳本中 ``pscoast`` 的輸出結果是用 ``>`` 存到了檔案中，所以 ``grdimage`` 畫的內容就被蓋掉了。要避免這種情況，後輸入內容必須要用 ``>>`` 這個符號才行，它會把 ``pscoast`` 的輸出接在檔案的最後面，這樣子繪圖的時候，``pscoast`` 的輸出就會像第二個圖層一樣，蓋在第一個圖層，也就是 ``grdimage`` 的輸出地圖上方。所以我們來把第二個 ``>`` 改成 ``>>`` 看看：

..    grdimage ETOPO1_Bed_g_gmt4.grd -R-70.8/-17.17/-66.56/-14.42r -JM6i -P -Cmby.cpt > titicaca.ps 
..    pscoast  -R-70.8/-17.17/-66.56/-14.42r -JM6i -P -Scornflowerblue -Df -Baf -B+t"Lago Titicaca" >> titicaca.ps

.. 這次的腳本也能成功執行，但輸出結果會變這樣：

.. coloring_topography/coloring_topography_fig5.png

.. 這不是跟沒加 ``pscoast`` 的時候一樣嗎？沒錯，他們是一樣的，``pscoast`` 的輸出在這裡被\ **無效化**\ 了。這是因為 PostScript 語言在檔案結尾時，必須要有一行特定的文字來宣告檔案已經結束，不然讀圖的時候會出現錯誤，這一行一般稱為 **EOF** (End-Of-File) 字符。在預設的情況下，GMT 的每個指令都會在輸出地圖的最後加上 EOF 字符，當看圖軟體讀到 EOF 時，就不會再往下讀了。這就是為什麼 ``pscoast`` 看起來有成功執行，卻沒有顯示在輸出地圖上的原因。GMT 中有一個固定的選項 ``-K``，是專門處理這種情況的，它可以把指令輸出的 EOF 字符移除。在我們的例子中，``-K`` 必須要加在 ``grdimage`` 內，這樣子檔案就不會在中段出現 EOF 字符，像這樣：

..    grdimage ETOPO1_Bed_g_gmt4.grd -R-70.8/-17.17/-66.56/-14.42r -JM6i -P -Cmby.cpt -K > titicaca.ps 
..    pscoast  -R-70.8/-17.17/-66.56/-14.42r -JM6i -P -Scornflowerblue -Df -Baf -B+t"Lago Titicaca" >> titicaca.ps

.. 這次的腳本輸出結果為：

.. coloring_topography/coloring_topography_fig7.png

.. 乍看之下好像跟前一張一樣，但不知道你有沒有注意到左下角的小圖案？沒錯，左下角的圖案是 ``pscoast`` 的輸出。總而言之，程式並沒有把這兩個圖層良好的疊在一起，而是以一種很奇怪的比例呈現，這並不是我們想要的結果。會有奇怪輸出的原因，與上個段落很相似：GMT 的每個指令輸出地圖時，除了會在結尾加 EOF 字符外，也會在開頭加上\ **檔頭敘述**。它就像是我們在上一章看到的一樣，:ref:`以文字敘述檔案的一些基本資訊 <PS檔頭>` 。如果一個檔案中有兩個檔頭，看圖軟體就會以不正確的方式讀取 ``.ps`` 檔案。因此，GMT 中還有一個固定的選項 ``-O``，加上了這個選項，指令就不會輸出檔頭。在我們的例子中，``-O`` 必須要加在 ``pscoast`` 內，這樣才不會在檔案的中段突然出現奇怪的檔頭，像這樣：

..    grdimage ETOPO1_Bed_g_gmt4.grd -R-70.8/-17.17/-66.56/-14.42r -JM6i -P -Cmby.cpt -K > titicaca.ps 
..    pscoast  -R-70.8/-17.17/-66.56/-14.42r -JM6i -P -Scornflowerblue -Df -Baf -B+t"Lago Titicaca" -O >> titicaca.ps


.. coloring_topography/coloring_topography_fig8.png

.. tip:

    1. 有關 ``-K`` 和 ``-O`` 的通用規則就是：除了最後一個指令之外，前面的所有指令都應該加上 ``-K`` (可以記成 Continue 的 K 音)；而除了第一個指令之外，前面的所有指令都應該加上 ``-O`` (它是 Overlay 的 O)。


.. attention:

    ``-K`` 和 ``-O`` 是很重要的指令，如果沒加在正確位置上的話常常會引起不正確的結果，但麻煩的是就算你加錯了，所有的指令仍可正常執行。所以，如果你的地圖不符合你心中預期的情況，請務必要檢查一遍 ``-K`` 和 ``-O`` 是否有加在對的地方。

.. 以上的腳本指令還可以稍微縮短一點點。**對於 GMT 的所有同名選項而言，如果他們表達的是相同意思，那麼後一次的預設值就會是前一次的設定值**。也就是說，兩個指令一模一樣的部份，後一個指令可以不用給值。在 ``pscoast`` 中，``-R`` 跟 ``-J`` 都跟 ``grdimage`` 中的 ``-R`` 跟 ``-J`` 一模一樣 (因為要畫在同一個地圖上。不一樣的話會尺寸不對，或線條跑到別處去)。因此後者的參數值可以不用打。另外，兩個指令中都加了 ``-P`` (直幅繪圖)，但由於 GMT 不允許前後的指令作圖在不同形狀的紙上，所以 ``pscoast`` 中，不管有沒有加 ``-P`` 都沒關係，GMT 會繼續使用直幅的紙張格式來疊圖。因此，簡化後但具有相同功能的腳本就如下所示：

..    grdimage ETOPO1_Bed_g_gmt4.grd -R-70.8/-17.17/-66.56/-14.42r -JM6i -P -Cmby.cpt -K > titicaca.ps 
..    pscoast  -R -J -O -Scornflowerblue -Df -Baf -B+t"Lago Titicaca" >> titicaca.ps

.. 我順便把 -O 調換了一下位置，因為它是很常出現的選項，所以個人習慣把它放前面以供辨別。

.. tip: 事實上，GMT 會在使用第一次給定選項值的時候，把它們存在 ``gmt.history`` 這個純文字文件中。這個檔案會放在使用者當次執行 GMT 的目錄底下，當使用者省略選項值時，GMT 會搜尋此文件，再從中讀取使用者之前使用過的設定。這也就是說，當你第二次執行腳本時，只要 ``gmt.history`` 沒被刪掉，你甚至可以把第一行的 ``-R`` 和 ``-J`` 選項值省略！當然這麼做有其風險，因為 ``gmt.history`` 只會儲存使用者最近一次的選項值，所以你如果執行了別的 GMT 指令，舊的設定就有可能會被覆蓋掉，導致腳本無法執行。因此，個人推薦\ **在腳本中第一次出現的選項值一定要詳細設定**\ ，才不會導致上述狀況的發生。

這次總算有個令人滿意的輸出結果。接下來，我們還可以利用 ``coast`` 的其餘功能來美化這張地圖。首先是 ``-I``，它可以幫我們標上河流，語法為

.. code-block:: bash

    -I編號/畫筆

其中的\ ``編號``\ 可以為不同的英數字，對應到不同等級的河流；而\ :ref:`畫筆 <畫筆>`\ 則用來指定河流的繪圖樣式。這裡我們要使用 ``r`` 這個編號，它對應的是\ **所有的永久河流**。畫筆樣式則使用 ``0.7p,cornflowerblue``。

另外一個 ``coast`` 的選項是 ``-N``，它可以在地圖上標上政治性的邊界。語法同樣為

.. code-block:: bash

    -N編號/畫筆

這裡的\ ``編號``\ 一樣可以為不同的英數字，對應到不同等級政治邊界 (國界、州界等)。我們要用的是 ``1``，亦即\ **標上國界**。至於畫筆樣式，則使用 ``0.7p,,--``，注意這裡我們空下了「顏色」的欄位，因此 GMT 會使用預設值「黑色」進行繪圖。在「線條樣式」欄位中，我們選擇 ``--``，這樣國界就會以虛線呈現。

.. note::

    有關畫筆的進階樣式設定，例如設定線條樣式、利用 RGB 值自訂顏色等，會在「\ :doc:`pen_and_painting`\ 」詳加描述。

把 ``-N`` 和 ``-I`` 以及他們的設定參數加入我們的 ``coast`` 指令中，就完成了這次的地圖設計。

指令稿
--------------------------------------

本地圖的最終指令稿如下：

.. code-block:: bash

    gmt begin titicaca png
        gmt grdimage @earth_relief_01m -R-70.8/-17.17/-66.56/-14.42r -JM6i -Cmby.cpt 
        gmt coast -Ir/0.7p,cornflowerblue -N1/0.7p,,-- -Scornflowerblue -Baf -B+t"Lago Titicaca"
    gmt end


.. note::

    「繪製地形設色圖：以 **70.8E - 66.56E，17.17S - 14.42S** 為邊界，麥卡托投影，地圖橫向寬 **6** 吋，套色使用 ``mby.cpt`` 內的色階表。使用 ``cornflowerblue`` 把湖泊和河流上色，畫上國界，四邊繪製邊框與刻度數值，自動選擇數值間隔與刻度間隔，不畫格線，標題為 *Lago Titicaca*，存檔為 ``titicaca.png``。」

觀看\ `最終版地圖`_

PyGMT 指令稿
--------------------------------------

使用 PyGMT，可以如下腳本繪製本地圖：

.. code-block:: python

    import pygmt
    
    # 取得地形資料
    region = [-70.8, -66.56, -17.17, -14.42]
    grid = pygmt.datasets.load_earth_relief(resolution='01m', region=region)
    
    # 繪圖
    fig = pygmt.Figure()
    fig.grdimage(grid, region=region, projection='M6i', cmap='mby.cpt')
    fig.coast(rivers='r/0.7p,cornflowerblue', borders='1/0.7p,,--', water='cornflowerblue', frame=['af', '+t"Lago Titicaca"'])
    fig.show()
    fig.savefig('titicaca_pygmt.png')

你可以使用以下的 Binder 連結嘗試此程式碼：

.. image:: https://mybinder.org/badge_logo.svg
    :target: https://mybinder.org/v2/gh/whyjz/GMT-tutorials/HEAD?filepath=SOURCE_DOCS%2Fcoloring_topography%2Ftiticaca_pygmt.ipynb


習題
--------------------------------------

1. 畫出貝加爾湖 (*Lake Baikal* 或 *Baygal nuur*) 與週邊區域的地形設色圖。貝加爾湖是全世界最深的湖泊，也是世界第七大湖，位於俄羅斯，南端接近蒙古的邊界。
2. 從地圖中可看到有幾條河流注入或流出貝加爾湖？
3. 貝加爾湖週邊的海拔為何？湖底的海拔為何？你的地圖分別用什麼顏色表示這兩個海拔？


.. [#] `Data Summary: Lago Titicaca (Lake Titicaca). <http://www.ilec.or.jp/database/sam/dsam04.html>`_
       International Lake Environment Committee Foundation - ILEC. Retrieved 2009-01-03.
.. [#] `ClClimatological Information for Juliaca, Peru. 
       <http://www.weather.gov.hk/wxinfo/climat/world/eng/s_america/ec_per/juliaca_e.htm>`_
       Hong Kong Observatory.
