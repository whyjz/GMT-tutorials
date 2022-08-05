# 推薦搭配的軟體或套件

GMT 是負責「畫圖」的軟體，只要丟給它適當的數據和選項，它就能為我們畫出漂亮的圖片。正因為它只負責繪圖，我們時常需要搭配其他軟體處理餵給 GMT 畫圖的資料或是編修輸出圖檔。以下就是筆者推薦搭配 GMT 一同安裝並使用的程式套件或是軟體。

## 程式碼編輯器

GMT 使用 UNIX 系統下的 Shell 指令介面的風格設計而成，也就是說它跟其他所有指令列語言一樣，可以先把所有要下的指令寫成<b>腳本或批次檔</b>，再一併執行。使用 PyGMT 的方法則與撰寫 Python 程式語言腳本相同。雖然作業軟體 (尤其是 Windows) 內附的純文字編輯器可以用來寫腳本，但筆者仍然推薦找個更好用的文字編輯器。專為程式設計打造的文字編輯器會有許多附加功能，例如語法標示模式、自動版面調整、簡易除錯等等。以下是幾個常見選擇：

### [Gedit](https://wiki.gnome.org/Apps/Gedit)

本來是為 GNOME 桌面環境 (如 Ubuntu) 製作的輕量級文字編輯器，特點為簡單、易用，並支援語法標示模式，目前更可安裝於所有的作業系統。

### [Sublime Text](http://sublimetext.com)

一款很流行而且很強大的程式碼編輯器，各種功能應有盡有，你甚至可以使用愛好者提供的進階模組來增進此軟體，打造屬於你的編輯器。可安裝於所有的作業系統。它是付費軟體，但很佛心的提供終生免費試用。

% Sublime merge

### [Visual Studio Code](https://code.visualstudio.com/) (VS Code)

由微軟開發的跨平台免費程式碼編輯器，具有一切你想得到的、寫程式時的必備功能，還有不少佈景主題供使用者個人化。更重要的是，VS Code 還支援了 Git 的版本控制，讓使用者可以在同介面中瀏覽修改的檔案，甚至是提交新的更動。

% Sublime vs VSCode https://www.codecademy.com/resources/blog/visual-studio-code-sublime-text/

% `Notepad++ <https://notepad-plus-plus.org>`_
%  由台灣人所開發的程式編輯器，輕巧實用，且支援不少程式設計的常見功能，更是有不少人直接拿來當作 Windows 記事本的替代品。不過，目前它只能安裝在 Windows 上。

其他還有 Vim、Emacs、Micro、Nano、Kate、Notepad++ 等等，族繁不及備載，歡迎大家[比較後](https://zh.wikipedia.org/wiki/%E6%96%87%E4%BB%B6%E7%BC%96%E8%BE%91%E5%99%A8%E6%AF%94%E8%BE%83)，挑一個自己覺得比較順手的就行了。

## [Jupyter](https://jupyter.org/)

Jupyter 專案的核心宗旨是提供開源的軟體與技術標準，並設計互動性的運算界面，服務以不同程式語言進行工作的使用者們。Jupyter 有許多不同的軟體產品，如果你預計使用 PyGMT，那麼我推薦安裝 Jupyter Lab，讓你可以使用網頁瀏覽器作為撰寫腳本時的整合性開發介面。[這裡](https://www.mdeditor.tw/pl/23Lf/zh-tw)有關於 Jupyter Lab 的進一步介紹。在後續章節中提供的 PyGMT 腳本，就是使用 Jupyter Notebook 格式儲存。(*聲明：[本人](https://whyjz.github.io/)現為 Jupyter 的一個子專案 Jupyter Meets the Earth 團隊的一員，本教學中所有關於 Jupyter 的描述皆是我個人意見，並且是我利用閒暇時間所寫成，不代表開發團隊的意見。*)

% 並透過 Voilà (Jupyter 生態系中的一個套件) 轉換為 HTML 格式讓您閱讀。

### Jupyter Notebook

Jupyter Notebook 是一個透過瀏覽器 (即在伺服器端) 運作的應用程式，透過使用者指定的「核心」如 Python、R、Shell 等程式語言存取電腦的計算資源。使用者可在 Notebook 的圖形化介面中撰寫程式碼與文檔，並在同一份文件中顯示運算結果、插入連結、播放影片等等，使一份工作流程以高度結構化的方式呈現在讀者眼前。

### JupyterLab

JupyterLab 是 Notebook 的進化版，以控制面板的設計，讓瀏覽不同類型的資料、管理不同的 Notebooks，不同工作流程之間的比較都變得更容易。JupyterLab 也是在本教學中雲端執行程式碼功能 (MyBinder) 的預設圖形化介面。

% Jupyter Book

## [GDAL](https://gdal.org/) 

GMT 原生支援的地理空間資料格式是 **NetCDF** 和純文字檔，不過可透過 GDAL 這個選裝套件的支援直接讀取許多常見的地理空間資料格式，像是 **GeoTIFF** 或是 **shapefile** 等等。GDAL 的全名是「Geospatial Data Abstraction Library」，直譯為「地理空間資料存取函式庫」。它是一個開源且一直持續更新的函式庫，並且支援了 142 種影像格式和 84 種向量格式，可以說功能非常全面。GDAL 本身提供了一些常用指令，可以讓你藉由指令列快速的修改或瀏覽地理空間資料，但它也可以模組的方式在許多程式語言中執行，如 Python。GDAL 可以獨立安裝在各種作業系統中，或是透過 Anaconda 等套件管理軟體進行安裝。請記得如果你想讓 GMT 可以透過 GDAL 的支援讀取更多的資料格式，就要在安裝 GMT 時一併或預先安裝 GDAL。

% 目前 (2019 年 10 月) 已經來到了 GDAL/OGR 2.4.3/3.0.2 版，

% 不過由於 QGIS 是使用 GDAL 的功能來操作地理空間資料，因此你也可以選擇安裝 `QGIS`_，這樣子 GDAL 就會一併被安裝。

% 如果你手邊有一筆資料，但卻是以不同的格式儲存，像是 **GeoTIFF**、**shapefile** 或 **KML** 之類的檔案，就需要進行額外的處理。 GMT 本身具有指令可支援操作，但功能不足以涵蓋到數十種的檔案格式。如果你有此類轉檔的需求，或是想要調整某種格式檔案內的資料，GDAL 是個不錯的選擇。


## 地理空間資料處理圖形介面

GMT 的強大之處是在於它對空間資料的數學操作，以及類 Unix 的設計理念，就算是很複雜的製圖需求，都可以只透過短短幾行指令達成；但有的時候，你只是想要快速的看一下你的資料，或是對它們進行一些簡單的處理。這種情況下，安裝一個具有圖形介面的地理資訊系統 (GIS) 處理軟體或許也是不錯的選擇。

### [QGIS](http://qgis.org/)

QGIS 是非常著名的 GIS 自由軟體，從 2009 年釋出第一版至今，已經累積了不少使用者和志願協助開發者。除了使用圖形化介面操作以外，它也以 Python 作為腳本語言，方便使用者編寫腳本增進工作效率，甚至自行設計外掛模組。QGIS 可以安裝在各種電腦作業系統，甚至還包括 Android！

### [ArcGIS](https://arcgis.com/)

ArcGIS 是一個老牌的 GIS 商業軟體，由 Esri 這間公司一手打造。ArcGIS 其實是一群軟體的統稱：Esri 依照使用者不同的需求，把自家產品往許多方向微調，讓我們可以依照不同的目的選擇最適當的軟體來操作。同樣的，Python 也是 ArcGIS 主流支援的腳本語言，可惜的是目前 ArcGIS 只能安裝在 Windows 中。

% 至今 (2019) 已走過 20 個年頭

### [Google 地球](https://earth.google.com/)

嚴格來講，Google 地球 (Google Earth) 算是「地球儀軟體」，也就是以提供瀏覽地理空間資料為主，而不強調操作或修改這些資料。在 Google 地球中，使用者僅能建立簡單的圖徵，或是瀏覽從別處取得的地理空間資料，不過這在許多狀況中已經很夠用了。目前 Google 地球可以安裝在各種作業系統，當然也有 Android，同時還有一般版與專業版可以選擇。

````{margin}
```{note}
GMT 5 或之前的版本只能以 PostScript (PS) 格式出圖 (請參閱{doc}`basic_concept`)，但可以使用 GMT 自帶指令或第三方軟體如 ImageMagick 轉檔。如要檢視 PS 檔又不想安裝專用軟體，可以把它傳到 Google 雲端硬碟上再用 [Google 文件](https://www.google.com/intl/zh-TW/docs/about/) 開啟檔案。
```
````


(PSViewer)=
## 圖檔檢視、處理與編修軟體

從 GMT 6 開始，使用者可以自行選擇出圖的格式，例如向量格式的 PDF 或影像格式的 PNG。難免有些時候，你會覺得 GMT 的出圖還需要一點點額外的編修。除了重新跑一次 GMT 的所有指令外，你也可以使用以下兩個在開放科學圈比較流行的的影像編輯軟體來幫你處理：

### [ImageMagick](http://www.imagemagick.org/)
一款開源的免費圖像處理軟體，由許多不同的指令構成，每個指令都有很多選項可使用，更支援許多不同的向量或影像格式。它使用命令列操作，你可以使用 `convert` 這個指令，輕鬆快速的微調輸出的影像 (如調整解析度與尺寸等等操作)。ImageMagick 目前可以在多種平台上安裝，同時它也是許多 Linux 發行版預裝的軟體之一。
  
### [Inkscape](https://inkscape.org/)
果你想要使用自由軟體編修向量檔，或是你的作業系統是 Linux，那麼此套軟體是不錯的選擇。它也可在非 Linux 的多種平台上執行。

如果想要使用商業軟體的話，[Adobe Illustrator](http://www.adobe.com/tw/products/illustrator.html) 或是 [CorelDRAW](http://www.coreldraw.com/tw/) 也是不錯的選擇。


% Ghostscript 家族
% Ghostscript 就是設計用來瀏覽或轉換 PS 檔或 PDF 檔的自由軟體。它有很多衍生的版本，各自有不同的使用介面，在不同的作業系統中運行。例如說 `GSview <http://pages.cs.wisc.edu/~ghost/gsview/>`_ 是在 Windows 中的 Ghostscript 圖像化軟體，而在 Unix 或相關的系統中，則有 `Ghostview 或 GV <http://pages.cs.wisc.edu/~ghost/>`_ 可以選擇。

% `Evince <https://wiki.gnome.org/Apps/Evince>`_ 
% 許多 Linux 發行版預裝的文件瀏覽器，使用它就可以直接開啟 PS 檔，省去許多麻煩。目前已有移植到 Windows 上的安裝版本。

