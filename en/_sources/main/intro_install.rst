======================================
GMT / PyGMT 簡介與安裝
======================================

`GMT`_ 是什麼？
--------------------------------------
`GMT`_ 的全名是 Generic Mapping Tools，為一套多功能的製圖工具。這套軟體始於 1988 年，由當時就讀於拉蒙特-杜赫第地球觀測站 (Lamont-Doherty Earth Observatory) 的 Pål (Paul) Wessel 和 Walter H. F. Smith 設計製作，並在 1991 年公開發表第一版。[1]_ 軟體釋出後即收到廣大迴響，這些稱讚與建議成了兩位作者 (與其後加入開發團隊的所有人員) 繼續更新的原動力。三十多年過去了，GMT 在 2019 年的 11 月已經更新到第 6 版 [2]_\ ，在地理繪圖領域享有一席之地，更是許多領域，如地球物理學、海洋科學等等，一定會接觸到的軟體之一。

GMT 身為「通用」的製圖工具，當然可以進行一般性的科學繪圖，大部分你想得到的圖表種類，都可以利用 GMT 內附的指令來完成。但本軟體真正的強大之處，還是在於地理資料的處理與地圖的繪製。GMT 內建許多和地理資訊系統 (GIS) 有關的演算法，讓使用者可以輕鬆的藉由一個個指令，就完成精美且高解析度的地圖。輸出的圖檔支援多種格式，包括向量化的格式檔案如 EPS 或 PDF 等，非常容易進行更多的編修。

.. _GMT: https://www.generic-mapping-tools.org/

.. GMT 近年發展，包括 GMT-Matlab, GMTSAR 等等

那 `PyGMT`_ 呢？
--------------------------------------
`PyGMT`_ 其實就是把 GMT 重新包裝，讓所有 GMT 內的工具都可以透過 Python 這個程式語言以模組的方式來使用。除了讓原本就熟悉 Python 的人快速上手 GMT 外，遠程目標是與 Python 的其他資料科學模組一同連動，構築以 Python 進行科學資料分析的豐富環境。目前 PyGMT 已經支援了 Numpy、Pandas 和 Xarray 專有的資料格式，並且也可透過 Jupyter 環境進行互動性資料繪圖。[3]_

PyGMT 是由科學社群發起的專案計畫，目前的最新版 (版本號 0.3.1) 已於 2021 年 3 月釋出。各位如有興趣貢獻一己之力開發軟體，非常歡迎前往 PyGMT 的官方網站一探究竟。

.. _PyGMT: https://www.pygmt.org/

我該使用 GMT 嗎？
--------------------------------------
如果你有製作地圖的需求，不管是全球地圖還是自家附近的街道圖，都可以考慮使用 GMT 或 PyGMT。不過，GMT 特別適合用於科學製圖，這是因為指令化的操作方式，讓觀測或實驗數據變得很容易搭配地理資訊一同呈現。因此，筆者尤其推薦給具有以下任一種需求的人：

1. **手邊有大量的地理數據需要呈現在地圖上。**\ 例如：降雨量分佈、斷層與地震帶、海底地形圖、全世界火山分佈圖等等。

2. **時常繪製地圖，並且總是覺得使用 GIS 軟體效率太低。**\ 學習指令列繪圖的技巧，一定能讓你的 GIS 繪圖效率大增。

3. **需要即時或互動性呈現地理資料分析的結果。**\ 執行 GMT 或 PyGMT 的腳本，可以讓你把資料分析和繪圖輸出這兩件事一次完成。

唯一的問題是，GMT 所有的功能都必須透過指令列操作，對於沒接觸過指令列程式的人而言，GMT 的上手曲線可能沒那麼平緩。幸好，GMT 自身的指令格式並不那麼困難，而且在大多數的情形下，我們也不需要使用 GMT 以外的指令操作資料，因此只要稍微熟稔一點操作介面的觀念，就可輕鬆上手。有關詳情可以參考「\ :doc:`basic_concept`\ 」。另外，如果你使用過或正在使用 Python 程式語言，那麼可以嘗試看看模組化的 PyGMT，加速學習的效率。

這本教學手冊
--------------------------------------
`筆者`_\ 目前為地球物理與行星科學領域的研究員，前前後後接觸 GMT 已約 10 年的時間。有感於網路上缺少 GMT 與 PyGMT 的簡明中文教學資料，導致包括筆者在內的許多人得花額外的時間熟悉各種工具的用法，因此決定試著紀錄一些使用心得與操作程序，並設計成教學手冊，讓新手們可以由淺入深學習 GMT，老鳥們也可以把本教學當成工具書一般的查看。

本教學的難度，是放在讓從沒操作過指令列程式的使用者也能理解的等級，並循序漸進到一些比較像程式碼的華麗繪圖流程。學習 GMT 最佳的方法，除了參考本手冊或其他線上說明外，實際動手做更是掌握此工具的不二法門，因此在本教學中所有的章節都會提供繪圖資料以供各位使用，或許你可以畫得出比章節的目標更漂亮的地圖！


.. _筆者: http://www.geo.cornell.edu/eas/gstudent/wz278/

如何安裝
--------------------------------------

.. 有空要來改寫這一節

GMT 和 PyGMT 有許多種安裝方式，以下是我個人推薦的方法：利用 ``conda`` 安裝 **GMT 6**。至於其他的方法，可前往 `GMT`_ 或 `PyGMT`_ 的網站查看。

1. 首先\ `安裝 Anaconda <https://www.anaconda.com/products/individual>`_。Anaconda 是個跨平台的套件管理軟體，尤其適合資料科學分析使用。你可以根據你的作業系統下載不同的檔案安裝。

2. 開啟終端機 (Linux 或 Mac) 或是 Anaconda 的指令列 (Windows)，建立 GMT 的安裝環境： (更多終端機的詳細說明請看「:doc:`basic_concept`」。這邊環境的名字 ``gmt6`` 可自由更改成您喜歡的字。)

   .. code-block:: bash

       $ conda create --name gmt6
       $ conda activate gmt6
       
3. 安裝 GMT：

   .. code-block:: bash

       $ conda config --prepend channels conda-forge
       $ conda install python=3.9 gmt
       
   或是你也可以直接安裝 PyGMT，這樣 GMT 會一併被安裝：
   
   .. code-block:: bash

       $ conda config --prepend channels conda-forge
       $ conda install python=3.9 pygmt pip numpy pandas xarray netcdf4 packaging gmt pytest pytest-mpl

4. 如果你計畫使用 PyGMT，推薦一併安裝 Jupyter 以進行互動式資料分析。

   .. code-block:: bash

       $ conda install jupyterlab

5. 要使用 GMT 時，切換至 GMT 的環境即可開始使用。

   .. code-block:: bash

       $ conda activate gmt6
       $ gmt help
   
   要使用 PyGMT 時，在 Python 內匯入同名模組即可：

   .. code-block:: python
   
       import pygmt 
       pygmt.show_versions()


.. 目前 GMT 的安裝並不算是太困難，`官網有對應各種平台的安裝教學 (英文) <https://github.com/GenericMappingTools/gmt/blob/master/INSTALL.md>`_\ 或是\ `編譯教學 (英文) <https://github.com/GenericMappingTools/gmt/blob/master/BUILDING.md>`_。一般來說安裝檔提供的是稍舊的版本，例如在 Ubuntu 上，從官方伺服器下載安裝的 GMT 是 5.2 版，如果你想要使用最新版 GMT 的話，就得自己編譯。

.. 所有可供安裝的檔案都放在\ `下載頁面 <https://www.generic-mapping-tools.org/download/>`_。基本上 Windows 選擇 ``.exe`` 檔安裝，Linux 則透過 ``.tar`` 檔安裝，而 ``.dmg`` 檔則供 Mac 使用。值得注意的是，`GMT 舊版的網站 <http://gmt.soest.hawaii.edu/projects/gmt/wiki/Download>`_\ 可下載兩個額外的資料庫，分別叫做 **dcw-gmt** 和 **gshhg-gmt**，推薦在 GMT 下載安裝前，先把這兩個資料庫載下來解壓縮，再移到你喜歡的位置存放 (GMT 會詢問使用者這兩個資料庫的路徑)。dcw 和 gshhg 的簡略內容如下，供各位參考：

.. `DCW <http://www.soest.hawaii.edu/wessel/dcw/>`_ (**Digital Chart of the World**)：提供一些基本的向量形式資料，像是國界、人口密集地、道路、水文資料、地標、植被等等。

.. `GSHHG <https://www.soest.hawaii.edu/pwessel/gshhg/>`_ (**Global Self-consistent, Hierarchical, High-resolution Geography**)： 提供數種解析度的向量形式資料，像是海岸線、河湖水系、國界與州界等等。

使用者社群
--------------------------------------
GMT 與 PyGMT 有著日益茁壯的社群。`官方的使用者論壇 (英文) <https://forum.generic-mapping-tools.org/>`_ 提供了使用者們交流、發問、參與開發的園地，也是軟體發布新版本時的公佈欄。



.. [1] Wessel, P., and Smith, W. H. F. (1991). 
       Free software helps map and display data, EOS Trans. AGU, 72(41), 445–446. 
       `doi.org/10.1029/90EO00319 <http://doi.org/10.1029/90EO00319>`_.
.. [2] Wessel, P., Luis, J., Uieda, L., Scharroo, R., Wobbe, F., Smith, W. H. F., and Tian, D. (2019). 
       The Generic Mapping Tools Version 6. Geochemistry, Geophysics, Geosystems, 20. 
       `doi.org/10.1029/2019GC008515 <http://doi.org/10.1029/2019GC008515>`_.
.. [3] Uieda, L., Tian, D., Leong, W. J., Toney, L., Newton, T., and Wessel, P. (2020, November 14). 
       PyGMT: A Python interface for the Generic Mapping Tools (Version v0.2.1). Zenodo. 
       `doi.org/10.5281/zenodo.4253459 <http://doi.org/10.5281/zenodo.4253459>`_.
