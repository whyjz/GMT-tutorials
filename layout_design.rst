======================================
版面設計與地圖的幾何布局
======================================

接下來讓我們來探討一下 GMT 的版面設計功能。在一般的情形下，GMT 會使用許多預設選項，\
讓使用者不需做太多設定，甚至是下達簡單的一行指令，就能產生想要的地圖。如果我們想設計比較複雜的配置，\
例如版面分割、邊框樣式調整、字型與字體樣式，就需要調整 GMT 的「使用者組態設定」。另外，\
我們也會在這裡介紹地理空間資料常用的兩大類座標：平面與球面，以及 GMT 如何處理這兩種座標混用時的情況。

目標
--------------------------------------
繪製從蒙古國\ *烏蘭巴托* (Ulaanbaatar) 到美國\ *西雅圖* (Seattle) 的\
`大圓路徑 <https://en.wikipedia.org/wiki/Great-circle_distance>`_ 
(**Great Circle** Route) 與\
`恆向線 <https://en.wikipedia.org/wiki/Rhumb_line>`_
(**Rhumb Line**)。大圓路徑指的是沿著大圓 (半徑為地球半徑的的圓) 前進的路徑，\
恆向線則是對於所有的子午線，交角皆相等的路線。本章地圖使用了兩個不同的投影方法，上圖為\
「蘭伯特等積方位投影」 (**Lambert** azimuthal equal-area projection) ，下圖為「麥卡托投影」\
(**Mercator** Projection)。圖中說明了幾個特點：

- 恆向線在麥卡托投影中會以直線呈現，而大圓路徑在相同的圖中則是曲線。有趣的是，大圓路徑才是兩地之間\
  實際較短的路徑。
- 連接到蘭伯特等積方位投影中心點 (本例中為烏蘭巴托) 的大圓路徑會是直線，恆向線則變成曲線。\
  這是比較能直觀連結它們的實際長度的一種方法，也是投影名稱的「方位」二字緣由 (大圓路徑保持在相同方位)。

另外，本地圖也替換了 GMT 的預設字型、顏色與版面配置。這些細節將會在以下部份一一解說。

.. _最終版地圖:

.. image:: layout_design/ulaanbaatar_seattle.png

直接觀看\ `指令稿`_

使用的指令與概念
--------------------------------------
- ``gmtdefaults`` - **查看 GMT 的預設作圖參數**
- ``gmtset`` - **更改 GMT 的預設作圖參數**
- ``psxy`` - **在地理座標系統上畫點和線**
- ``pstext`` - **詳細的設定標記在圖上的文字**
- ``project`` - **產生路徑座標**
- ``psbasemap`` - 設定繪圖區、座標軸與邊框
- ``pscoast`` - 繪製海岸線與國界
- 外部指令 ``rm`` - **刪除檔案** (Windows 為 ``del``)
- 外部指令 ``echo`` - 把資料輸入到管線命令中
- GMT 共用選項：``-X`` ``-Y`` ``-:``
- GMT 的預設參數與 ``gmt.conf`` 檔案
- 地理座標的給定方式
- 地圖版面的設定
- 文字風格設定
- GMT 針對不同投影座標系統的不同處理方式

前置作業
--------------------------------------
我們要先取得烏蘭巴托與西雅圖兩地的經緯度座標。從 *Wikipedia* 的條目頁面中，可以找到「經緯度」的資訊欄位，
點選連結後，可以看到不同座標系統的位置資訊，如下所示 (以烏蘭巴托為例)。

.. image:: layout_design/layout_design_fig1.png

注意在「\ **WGS84**\ 」欄位中，有兩種座標的格式。你要使用哪種都可以，GMT 都有支援。\
另外也請注意這裡的座標是「緯度在前，經度在後」。在下表中，也蒐集了兩地的經緯座標
(十進位制四捨五入至小數點第二位)：

=============== ============================== =================================
城市             烏魯木齊                        西雅圖
=============== ============================== =================================
經緯度 (度分秒)   47° 55′ 0″ N, 106° 55′ 0″ E        47° 36′ 35″ N, 122° 19′ 59″ W
經緯度 (十進位)   47.92, 106.92                  47.61, -122.33
=============== ============================== =================================

為了方便使用這些資料，我們可以建立一個純文字文件 ``coord.txt``，再把兩地的座標資訊複製到文件中存檔，\
如此一來供 GMT 使用的資料表就建立完成。以下是使用十進位制座標的 ``coord.txt`` 內容：

.. code-block:: bash

    47.92, 106.92
    47.61, -122.33

再次強調，資料中的第一欄現在是緯度 (y 值)，第二欄是經度 (x 值)。這與我們在「\ :doc:`scatter_plot`\ 」一章中\
所使用的 xy 順序相反，不過只要適當的指定欄位意義，GMT 仍然可以讀取。另外，兩個欄位中間使用了「逗號」分隔，\
在 GMT 中也是可以接受的。

以下是使用度分秒制座標的 ``coord.txt`` 內容：

.. code-block:: bash

    47:55:0N, 106:55:0E
    47:36:35N, 122:19:59W

注意我把所有的度分秒符號都統一成「冒號」，而且座標字串中間的空白都被移除了。\
這種格式是 GMT 5 建議的標準地理座標 (度分秒) 格式，如果你有一串地理座標資料是以度分秒格式儲存，\
建議在輸入 GMT 之前，把所有的度分秒符號都改為冒號，如上所示。

你也可以從這裡下載資料檔：\ :download:`coord.txt <layout_design/coord.txt>`\ ，這個版本\
使用度分秒制座標。

.. tip::

    簡單小結 GMT 對於文字輸入檔與地理座標格式的要求：

    1. 欄位的分隔符號可以是\ **空白**\ 、\ **逗號** (``.csv`` 檔) 與 **Tab** (``.tsv`` 檔) 三者之一，\
       但不能在同一個檔案中使用超過一種的分隔符號來分隔欄位。欄位代表的意義預設是第一欄 x 值、第二欄 y 值，\
       不過可以在下指令時逐一指定。
    2. 地理座標可以採用\ **十進位**\ 或\ **度分秒**：

       - 以十進位系統表示時，南緯要表示為負緯度，西經則表示為負經度或是東經 180 度之後持續累加，\
         如經度 243 和 -63 都代表西經 63 度。
       - 以度分秒系統表示時，使用 ``dd:mm:ssF`` 的方法，\ ``dd`` 為度，\ ``mm`` 為分，\
         ``ss`` 為秒，\ ``F`` 則是 NEWS 四個字母之一。
       - 事實上，GMT 也讀得懂 ``dd°mm′ss″F`` 的表示方法，因此你如果不把這些符號換成冒號，\
         指令還是可以順利執行，不過個人仍然建議換成冒號，使用比較常見的字元，較能避免一些不必要的麻煩，\
         如不正確的螢幕顯示模式或 GMT 再次改版之後可能帶來的困擾。

操作流程
--------------------------------------
在「\ :doc:`scatter_plot`\ 」一章中，我們已經介紹了如何使用 ``psxy -T`` 來設定腳本結尾。這裡\
我們可以沿用相同的概念，來設定腳本開頭。因此，整個腳本的基礎設計大概會是這樣：

.. code-block:: bash

    # ==== 設定腳本的變數與參數 ====
    out_ps="ulaanbaatar_seattle.ps"
    其他設定......

    # ==== 開門 (寫入 PS 檔頭) ====
         # 因為只寫檔頭，所以 -R 和 -J 的設定並不重要，你可以隨意指定。
    psxy -R0/1/0/1 -JX1c -T -K > $out_ps

    # ==== 繪圖 ====
    主要的繪圖指令......

    # ==== 關門 (寫入 EOF) ====
    psxy -R -J -O -T >> $out_ps

在前面的章節中，我們會把 ``-P`` 加入第一個 GMT 指令中，以指定紙張採用直向排版。這裡我們要嘗試使用\
另一種方式：\ **調整 GMT 的預設參數**\ 。在終端機中輸入

.. code-block:: bash

    $ gmtdefaults






指令稿
--------------------------------------

本地圖的最終指令稿如下：

.. code-block:: bash

    # ==== 設定變數 ====
    out_ps="ulaanbaatar_seattle.ps"
    input_xy="coord.txt"
    xy_ulaanbaatar="47:55:0N, 106:55:0E"
    xy_seattle="47:36:35N, 122:19:59W"
    land_color="#CEB9A0"
    gcp_color="#0044FF"        # 大圓路徑的顏色
    psl_color="#FF0073"        # 恆向線的顏色
        # 把兩個程式的 xy 座標寫入 $input_xy 檔案中
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

    # ==== 下圖 (麥卡托) ====
    psbasemap -R70/270/30S/70N -JM13c -O -K -X4c -B+tMercator >> $out_ps
    pscoast -R -J -O -K -Dl -A1000 -G$land_color -N1/thick,60 -Ba40f20g20 \
            --MAP_GRID_PEN_PRIMARY=thicker >> $out_ps
    psxy $input_xy -R -J -O -K -: -A -W1p,$psl_color >> $out_ps    # 線
    psxy $input_xy -R -J -O -K -:    -W1p,$gcp_color >> $out_ps    # 線
    psxy $input_xy -R -J -O -K -:    -Sa0.4c -Gblack >> $out_ps    # 點
        # 線的說明文字
    echo "174 41 Projected Straight Line" | pstext -R -J -O -K -F+f,18,$psl_color >> $out_ps
    echo "174 61 Great Circle Path"       | pstext -R -J -O -K -F+f,18,$gcp_color >> $out_ps

    # ==== 上圖 (蘭伯特) ====
    psbasemap -Rg -JA106:55/47:55/13c -O -K -Y12c -B+tLambert \
            --MAP_TITLE_OFFSET=0c >> $out_ps
    pscoast -R -J -O -K -Dl -A1000 -G$land_color -N1/thick,60 -Bxg60 -Byg30 \
            --MAP_GRID_CROSS_SIZE_PRIMARY=0p >> $out_ps
    project -C106.92/47.92 -E237.67/47.61 -G10 -N |\
    psxy           -R -J -O -K    -W1p,$psl_color >> $out_ps    # 線
    psxy $input_xy -R -J -O -K -: -W1p,$gcp_color >> $out_ps    # 線
    psxy $input_xy -R -J -O -K -: -Sa0.4c -Gblack >> $out_ps    # 點
        # 加座標
    pstext -R -J -O -K -F+a   >> $out_ps << ANNOTEND
    106.92 -30 0   30\260S
    106.92 30  0   30\260N
    60     15  70  60\260E
    180    15  305 180\260
    ANNOTEND
        # 線的說明文字
    pstext -R -J -O -K -F+a+f >> $out_ps << LABELEND
    180    40  58  ,Bookman-DemiItalic,$psl_color   Projected Straight Line
    180    80  58  ,Bookman-DemiItalic,$gcp_color   Great Circle Path
    LABELEND

    # ==== 關門 (寫入 EOF) ====
    psxy -R -J -O -T >> $out_ps
    # rm -rf gmt.conf    # <---- 此行可用於消除舊的組態設定檔

.. note::

    「」

觀看\ `最終版地圖`_


習題
--------------------------------------

