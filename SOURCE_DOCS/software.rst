======================================
推薦搭配的軟體或套件
======================================

GMT 是負責「畫圖」的軟體，只要丟給它適當的數據和選項，它就能為我們畫出漂亮的圖片。正因為它只負責繪圖，我們時常需要搭配其他軟體處理餵給 GMT 畫圖的資料或是編修輸出圖檔。以下就是筆者推薦搭配 GMT 一同安裝並使用的程式套件或是軟體。

程式碼編輯器
----------------------------------------------------------
GMT 使用 UNIX 系統下的 Shell 指令介面的風格設計而成，也就是說它跟其他所有指令列語言一樣，可以先把所有要下的指令寫成\ **腳本或批次檔**，再一併執行。使用 PyGMT 的方法則與撰寫 Python 程式語言腳本相同。雖然作業軟體 (尤其是 Windows) 內附的純文字編輯器可以用來寫腳本，但筆者仍然推薦找個更好用的文字編輯器。專為程式設計打造的文字編輯器會有許多附加功能，例如語法標示模式、自動版面調整、簡易除錯等等。以下是幾個常見選擇：

`Gedit <https://wiki.gnome.org/Apps/Gedit>`_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  本來是為 GNOME 桌面環境 (如 Ubuntu) 製作的輕量級文字編輯器，特點為簡單、易用，並支援語法標示模式，目前更可安裝於所有的作業系統。

`Sublime Text <http://www.sublimetext.com>`_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  一款很流行而且很強大的程式碼編輯器，各種功能應有盡有，你甚至可以使用愛好者提供的進階模組來增進此軟體，打造屬於你的編輯器。可安裝於所有的作業系統，網路上也有很完整的\ `中文教學 <http://docs.sublimetext.tw/>`_。它是付費軟體，但很佛心的提供終生免費試用。

`Notepad++ <https://notepad-plus-plus.org>`_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  由台灣人所開發的程式編輯器，輕巧實用，且支援不少程式設計的常見功能，更是有不少人直接拿來當作 Windows 記事本的替代品。不過，目前它只能安裝在 Windows 上。

其他還有 Vim、Nano、Kate、Crimson Editor 等等，族繁不及備載，歡迎大家比較後，挑一個自己覺得比較順手的就行了。

`Jupyter <https://jupyter.org/>`_
----------------------------------------------------------
Jupyter 專案的核心宗旨是提供開源的軟體與技術標準，並設計互動性的運算界面，服務以不同程式語言進行工作的使用者們。Jupyter 有許多不同的軟體產品，如果你預計使用 PyGMT，那麼我推薦安裝 Jupyter Lab，讓你可以使用網頁瀏覽器作為撰寫腳本時的整合性開發介面。`這裡 <https://www.mdeditor.tw/pl/23Lf/zh-tw>`_\ 有關於 Jupyter Lab 的進一步介紹。在後續章節中提供的 PyGMT 腳本，就是使用 Jupyter Notebook 格式儲存。(*聲明：*\ `本人 <http://www.geo.cornell.edu/eas/gstudent/wz278/>`_\ *現為 Jupyter 的一個子專案 Jupyter Meets the Earth 團隊的一員，本教學中所有關於 Jupyter 的描述皆是我個人意見，並且是我利用閒暇時間所寫成，不代表開發團隊的意見。*)

.. 並透過 Voilà (Jupyter 生態系中的一個套件) 轉換為 HTML 格式讓您閱讀。

`GDAL <https://gdal.org/>`_ 
--------------------------------------
GMT 支援的地理空間資料格式主要是 **NetCDF** 和純文字檔。透過 GDAL 這個選裝套件的支援，更可以直接的讀取許多常見的地理空間資料格式，像是 **GeoTIFF** 或是 **shapefile** 等等。GDAL 的全名是「Geospatial Data Abstraction Library」，直譯為「地理空間資料存取函式庫」。它是一個開源且一直持續更新的函式庫，並且支援了 142 種影像格式和 84 種向量格式，可以說功能非常全面。GDAL 本身提供了一些常用指令，可以讓你藉由指令列快速的修改或瀏覽地理空間資料，但它也可以模組的方式在許多程式語言中執行，如 Python。GDAL 可以獨立安裝在各種作業系統中，或是透過 Anaconda 等套件管理軟體進行安裝。請記得如果你想讓 GMT 可以透過 GDAL 的支援讀取更多的資料格式，就要在安裝 GMT 時一併或預先安裝 GDAL。

.. 目前 (2019 年 10 月) 已經來到了 GDAL/OGR 2.4.3/3.0.2 版，

.. 不過由於 QGIS 是使用 GDAL 的功能來操作地理空間資料，因此你也可以選擇安裝 `QGIS`_，這樣子 GDAL 就會一併被安裝。

.. 另外，如果你想要單獨安裝 GDAL，目前建議安裝 2.x.x 版本。

.. 如果你手邊有一筆資料，但卻是以不同的格式儲存，像是 **GeoTIFF**、**shapefile** 或 **KML** 之類的檔案，就需要進行額外的處理。 GMT 本身具有指令可支援操作，但功能不足以涵蓋到數十種的檔案格式。如果你有此類轉檔的需求，或是想要調整某種格式檔案內的資料，GDAL 是個不錯的選擇。


地理空間資料處理圖形介面
--------------------------------------
GMT 的強大之處是在於它對空間資料的數學操作，以及類 Unix 的設計理念，就算是很複雜的製圖需求，都可以只透過短短幾行指令達成；但有的時候，你只是想要快速的看一下你的資料，或是對它們進行一些簡單的處理。這種情況下，安裝一個具有圖形介面的地理資訊系統 (GIS) 處理軟體或許也是不錯的選擇。

`QGIS <http://qgis.org/>`_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  QGIS 是非常著名的 GIS 自由軟體，從 2009 年釋出第一版至今，已經累積了不少使用者和志願協助開發者。除了使用圖形化介面操作以外，它也以 Python 作為腳本語言，方便使用者編寫腳本增進工作效率，甚至自行設計外掛模組。QGIS 可以安裝在各種電腦作業系統，甚至還包括 Android！

`ArcGIS <https://www.arcgis.com/>`_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  ArcGIS 是一個老牌的 GIS 商業軟體，由 Esri 這間公司一手打造。ArcGIS 其實是一群軟體的統稱：Esri 依照使用者不同的需求，把自家產品往許多方向微調，讓我們可以依照不同的目的選擇最適當的軟體來操作。同樣的，Python 也是 ArcGIS 主流支援的腳本語言，可惜的是目前 ArcGIS 只能安裝在 Windows 中。

.. 至今 (2019) 已走過 20 個年頭

`Google 地球 <http://www.google.com/intl/zh-TW/earth/>`_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  嚴格來講，Google 地球 (Google Earth) 算是「地球儀軟體」，也就是以提供瀏覽地理空間資料為主，而不強調操作或修改這些資料。在 Google 地球中，使用者僅能建立簡單的圖徵，或是瀏覽從別處取得的地理空間資料，不過這在許多狀況中已經很夠用了。目前 Google 地球可以安裝在各種作業系統，當然也有 Android，同時還有一般版與專業版可以選擇。


圖檔處理與編修軟體
--------------------------------------
從 GMT 6 開始，使用者可以自行選擇出圖的格式，例如向量格式的 PDF 或影像格式的 PNG。難免有些時候，你會覺得 GMT 的出圖還需要一點點額外的編修。除了重新跑一次 GMT 的所有指令外，你也可以使用以下幾種比較流行的的影像編輯軟體來幫你處理：


`ImageMagick <http://www.imagemagick.org/>`_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  一款開源的免費圖像處理軟體，由許多不同的指令構成，每個指令都有很多選項可使用，更支援許多不同的向量或影像格式。它使用命令列操作，你可以使用 ``convert`` 這個指令，輕鬆快速的微調輸出的影像 (如調整解析度與尺寸等等操作)。ImageMagick 目前可以在多種平台上安裝，同時它也是許多 Linux 發行版預裝的軟體之一。
  

`Adobe Illustrator <http://www.adobe.com/tw/products/illustrator.html>`_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  一款著名且最被廣泛使用的向量檔處理軟體，由 Adobe 公司所研發並進行商業販售。目前有 Mac 及 Windows 版本。


`CorelDRAW <http://www.coreldraw.com/tw/>`_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  另一個著名的向量檔處理軟體，由 Corel 公司所研發並進行商業販售，價錢也比 Illustrator 親民。目前只有 Windows 版本。


`Inkscape <https://inkscape.org/>`_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  如果你想要使用自由軟體編修向量檔，或是你的作業系統是 Linux，那麼此套軟體是不錯的選擇。它也可在非 Linux 的多種平台上執行。


.. _PostScript Viewer:
.. _PostScript 看圖軟體:

PostScript 看圖軟體
--------------------------------------
GMT 6 的預設出圖格式是 PDF，所以正常情況下你的電腦應該有方法可以讀取它。但如果你是使用 GMT 5 或更以前的版本，出圖格式只有一種能選，也就是 PostScript (請參閱\ :doc:`basic_concept`)。以下列出能讀取 PostScript 格式 (PS 檔) 的軟體。

`Google 文件 <https://www.google.com/intl/zh-TW/docs/about/>`_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  免安裝，而且是 Google 雲端硬碟和 Gmail 設定的看圖軟體。如果你不想安裝任何東西，可以把東西傳到雲端硬碟上，就可以用瀏覽器的檢視模式，開啟 PS 檔。

Ghostscript 家族
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  Ghostscript 就是設計用來瀏覽或轉換 PS 檔或 PDF 檔的自由軟體。它有很多衍生的版本，各自有不同的使用介面，在不同的作業系統中運行。例如說 `GSview <http://pages.cs.wisc.edu/~ghost/gsview/>`_ 是在 Windows 中的 Ghostscript 圖像化軟體，而在 Unix 或相關的系統中，則有 `Ghostview 或 GV <http://pages.cs.wisc.edu/~ghost/>`_ 可以選擇。

`Evince <https://wiki.gnome.org/Apps/Evince>`_ 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  許多 Linux 發行版預裝的文件瀏覽器，使用它就可以直接開啟 PS 檔，省去許多麻煩。目前已有移植到 Windows 上的安裝版本。

