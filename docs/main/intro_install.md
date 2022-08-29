# GMT 簡介與安裝

## [GMT][GMT-link] 是什麼？

[GMT][GMT-link] (Generic Mapping Tools) 始於 1987 年，由當時就讀於拉蒙特-杜赫第地球觀測站 (Lamont-Doherty Earth Observatory) 的 Pål (Paul) Wessel 和 Walter H. F. Smith 設計製作，在 1988 年完成第一版，加強後的第二版則隨著 1991 年的一篇文章開始大力對外宣傳。[^1] 軟體釋出後即收到廣大迴響，這些稱讚與建議成了兩位作者 (與其後加入開發團隊的所有人員) 繼續更新的原動力。目前 GMT 已經更新到第 6 版 [^2]，並持續受到地理繪圖、地球物理、海洋科學、行星科學等領域研究人員的歡迎。



既然 GMT 叫做「通用」製圖工具，大部分的科學圖表種類都可以利用 GMT 來完成，不過本軟體真正強大之處，在於地理空間資料的處理與地圖的繪製。GMT 內建許多地理空間演算法，讓使用者可以輕鬆的藉由一個個指令完成精美且高解析度的地圖。

[GMT-link]: https://www.generic-mapping-tools.org/

% GMT 近年發展，包括 GMT-Matlab, GMTSAR, GMT-Julia 等等

% PS 介紹 GMT 接受使用者的指令與參數輸入 透過一種叫做 PostScript 的文本語言 輸出的圖檔支援多種格式，包括向量化或影像化的格式檔案，非常容易進行更多的編修。

## 我該使用 GMT 嗎？

如果你有製作地圖的需求，不管是全球地圖還是自家附近的街道圖，都可以考慮使用 GMT 或 PyGMT。不過，GMT 特別適合用於科學製圖，這是因為指令化的操作方式，讓觀測或實驗數據變得很容易搭配地理資訊一同呈現。因此，筆者尤其推薦給具有以下任一種需求的人：

1. <b>手邊有大量的地理數據需要呈現在地圖上。</b>例如：降雨量分佈、斷層與地震帶、海底地形圖、全世界火山分佈圖等等。

2. <b>時常繪製地圖，並且總是覺得使用 GIS 軟體效率太低。</b>學習指令列繪圖的技巧，一定能讓你的 GIS 繪圖效率大增。

3. <b>需要即時或互動性呈現地理資料分析的結果。</b>執行 GMT 或 PyGMT 的腳本，可以讓你把資料分析和繪圖輸出這兩件事一次完成。

唯一的問題是，GMT 所有的功能都必須透過指令列操作，對於沒接觸過指令列程式的人而言，GMT 的上手曲線可能沒那麼平緩。幸好，GMT 自身的指令格式並不那麼困難，而且在大多數的情形下，我們也不需要使用 GMT 以外的指令操作資料，因此只要稍微熟稔一點操作介面的觀念，就可輕鬆上手。有關詳情可以參考「{doc}`basic_concept`」。另外，如果你使用過或正在使用 Python 程式語言，那麼可以嘗試看看模組化的 PyGMT，加速學習的效率。

## 這本教學手冊

[筆者](https://whyjz.github.io/)目前為地球物理與行星科學領域的研究員，接觸 GMT 已超過 10 年。有感於網路上缺少 GMT 與 PyGMT 的簡明教學資料，導致包括筆者在內的許多人得花額外的時間熟悉各種工具的用法，因此決定試著紀錄一些使用心得與操作程序，並設計成教學手冊，讓新手們可以由淺入深學習 GMT，老鳥們也可以把本教學當成工具書一般的查看。

本教學的難度，是放在讓從沒操作過指令列程式的使用者也能理解的等級，並循序漸進到一些比較像程式碼的華麗繪圖流程。學習 GMT 最佳的方法，除了參考本手冊或其他線上說明外，實際動手做更是掌握此工具的不二法門，因此在本教學中所有的章節都會提供繪圖資料以供各位使用，或許你可以畫得出比章節的目標更漂亮的地圖！

### 使用的軟體版本

本教學手冊目前使用的 GMT 軟體版本為：

- GMT 6.3.0 (用以測試所有的 GMT <b>現代與經典模式</b>腳本。版本發布日期 2021/11/19)
- GMT 5.4.5 (用以測試所有的 GMT <b>經典模式</b>腳本。版本發布日期 2019/02/19)
- PyGMT 0.7.0 (用以測試所有的 PyGMT 腳本。版本發布日期 2022/07/01)

## 如何安裝

GMT 和 PyGMT 有許多種安裝方式，我個人推薦利用 `conda` 套件管理器安裝。至於其他的方法，可前往 [GMT](https://github.com/GenericMappingTools/gmt/blob/master/INSTALL.md) 或 [PyGMT](https://www.pygmt.org/latest/install.html) 的網站查看。

````{margin}
```{note}
Anaconda 會預裝很多常用的 Python 套件。如果只想要 Conda 而不想要其他的套件，也可以選擇安裝 [Miniconda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/download.html)。
```
````

1. 首先[安裝 Anaconda](https://www.anaconda.com/products/individual)。Anaconda 是個跨平台的套件管理軟體，尤其適合資料科學分析使用。你可以根據你的作業系統下載不同的檔案安裝。安裝 Anaconda 時會一併安裝我們需要的 Conda 管理器。



2. 開啟終端機 (Linux 或 Mac) 或是 Anaconda 的指令列 (Windows)，使用具有第三方套件的 conda-forge 頻道做為安裝來源。更多關於終端機的詳細說明請看「{doc}`basic_concept`」。

    ```bash
    $ conda config --prepend channels conda-forge
    ```

    ````{margin}
    ```{tip}
    覺得 `conda` 太慢的話，可以裝 `mamba` 來加速安裝套件。請參閱 [Mamba 的說明文檔](https://mamba.readthedocs.io/en/latest/user_guide/mamba.html)以及 [PyGMT 的官方安裝示範](https://www.pygmt.org/latest/install.html)。
    ```
    ````

3. 建立 GMT 的安裝環境並安裝 GMT。這邊環境的名字 `mygmt` 可自由更改成您喜歡的字。)

    ```bash
    $ conda create --name mygmt python=3.9 gmt
    ```

   或是你也可以直接安裝 PyGMT，這樣 GMT 會一併被安裝：

    ```bash
    $ conda create --name mygmt python=3.9 numpy pandas xarray netcdf4 packaging pygmt
    ```

4. 切換至 `mygmt` 環境即可開始使用 GMT/PyGMT。GMT 是在命令列介面 (Command-line interface, CLI) 下執行的工具，因此你可以在終端機中透過 `gmt` 這個指令使用 GMT 的所有功能。

    ```bash
    $ conda activate mygmt
    $ gmt help
    ```

   如要使用 PyGMT，在 Python 互動介面或腳本內匯入同名模組即可：

    ```python
    import pygmt 
    pygmt.show_versions()
    ```

5. 如果你計畫使用 PyGMT，推薦一併安裝 JupyterLab 以進行互動式資料分析。

    ```bash
    $ conda install jupyterlab
    ```

% 舊內容
% dcw 和 gshhg 的簡略內容如下，供各位參考：
% `DCW <http://www.soest.hawaii.edu/wessel/dcw/>`_ (**Digital Chart of the World**)：提供一些基本的向量形式資料，像是國界、人口密集地、道路、水文資料、地標、植被等等。
% `GSHHG <https://www.soest.hawaii.edu/pwessel/gshhg/>`_ (**Global Self-consistent, Hierarchical, High-resolution Geography**)： 提供數種解析度的向量形式資料，像是海岸線、河湖水系、國界與州界等等。

## 使用者社群

GMT 與 PyGMT 有著日益茁壯的社群。[官方的使用者論壇 (英文)](https://forum.generic-mapping-tools.org/) 提供了使用者們交流、發問、參與開發的園地，也是軟體發布新版本時的公佈欄。


[^1]: Wessel, P., and Smith, W. H. F. (1991). 
       Free software helps map and display data, EOS Trans. AGU, 72(41), 445–446. 
       <https://doi.org/10.1029/90EO00319>
[^2]: Wessel, P., Luis, J., Uieda, L., Scharroo, R., Wobbe, F., Smith, W. H. F., and Tian, D. (2019). 
       The Generic Mapping Tools Version 6. Geochemistry, Geophysics, Geosystems, 20. 
       <http://doi.org/10.1029/2019GC008515>

