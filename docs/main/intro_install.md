# GMT 簡介與安裝

## [GMT][GMT-link] 是什麼？

[GMT][GMT-link] (Generic Mapping Tools) 始於 1987 年，由當時就讀於拉蒙特-杜赫第地球觀測站 (Lamont-Doherty Earth Observatory) 的 Pål (Paul) Wessel 和 Walter H. F. Smith 設計製作，在 1988 年完成第一版，加強後的第二版則隨著 1991 年的一篇文章開始大力對外宣傳。[^1] 軟體釋出後即收到廣大迴響，這些稱讚與建議成了兩位作者 (與其後加入開發團隊的所有人員) 繼續更新的原動力。目前 GMT 已經更新到第 6 版 [^2]，並持續受到地理繪圖、地球物理、海洋科學、行星科學等領域研究人員的歡迎。[官方的使用者論壇 (英文)](https://forum.generic-mapping-tools.org/) 提供了使用者們交流、發問、參與開發的園地。

雖然 GMT 可以用來製作各種不同的科學圖表，不過本軟體真正強大之處是在於地理空間資料的處理與地圖的繪製，這也是在繪圖套件百家爭鳴的時代中，GMT 能保有一席之地的原因。GMT 的指令把許多地理空間演算法與繪圖的程序融合在一起，讓使用者可以輕鬆的藉由模組化的指令完成具有學術出版品質的地圖。

[GMT-link]: https://www.generic-mapping-tools.org/

## 我該使用 GMT 嗎？

如果你有製作地圖的需求，不管是全球地圖還是自家附近的街道圖，都可以考慮使用 GMT。不過，GMT 的模組化指令與對地理空間演算法的支援特別適合用於科學製圖，像是讓觀測或實驗數據搭配地理資訊一同呈現等等的目的。筆者推薦 GMT 給具有以下任一種需求的人：

1. <b>手邊有大量的數據需要視覺化，並且要呈現在地圖上。</b>例如：降雨量分佈、斷層與地震帶、海底地形圖、全世界火山分佈圖等等。

2. <b>時常繪製地圖，並且總是覺得 GIS 軟體圖形介面的繪圖效率太低。</b>學習指令列繪圖的技巧，一定能讓你的作業效率大增。

3. <b>需要快速呈現地理資料分析的結果。</b>GMT 可以讓你把資料分析和繪圖輸出這兩件事一次完成。

## 怎麼使用 GMT？

原生的 GMT 是在命令列介面 (Command-line interface, CLI) 下執行的工具，必須要在命令列環境 ({ref}`終端機 <Terminal>`) 下透過輸入指令的方式來執行。不過，近年來開發人員已經幫 GMT 的函數庫製作了適用於 Python、Matlab 以及 Julia 的應用程式介面 (API)，因此只要安裝相關的額外套件，就能夠在編寫這三種程式語言時運用 GMT 的各種功能。

### Python 的 GMT 套件：PyGMT

[PyGMT](https://www.pygmt.org/) 嘗試把 GMT 帶入 Python 科學資料分析的大家庭，讓使用者可以在一份 GMT 工作流程中連動 Python 的其他資料科學模組，像是 Numpy、Pandas 和 Xarray 提供的資料結構與算法。在本教學中，大部分的範例也會附上 PyGMT 的程式碼，讓您了解 GMT 與 PyGMT 的指令如何相互轉換。詳細說明請看{doc}`using_this_book`。

PyGMT 是由科學社群在 2020 年發起的專案計畫，2022 年 7 月的最新版是 0.7.0。各位如有興趣貢獻一己之力開發軟體，非常歡迎前往 PyGMT 的官方網站一探究竟。[^3]

### Matlab 的 GMT 套件：GMTMex

[GMTMex](https://github.com/GenericMappingTools/gmtmex) 讓廣大的 Matlab 使用者在腳本中存取 GMT 的各項功能。本手冊將不會對此套件著墨太多，歡迎有興趣的人自行查閱安裝與使用說明。

### Julia 的 GMT 套件：GMT.jl

Julia 是數值分析和資料科學領域近幾年的後起之秀，而 [GMT.jl](https://github.com/GenericMappingTools/GMT.jl) 則提供了在 Julia 中進行空間運算與視覺化的好用工具。本手冊暫時不會對此套件著墨太多，歡迎有興趣的人自行查閱[安裝與使用說明](https://www.generic-mapping-tools.org/GMT.jl/dev/)。

## GMT 會不會很難學？

如果您沒學過 Linux 的指令列語法或在其他作業系統中相似的東西，也沒接觸過 Python、Matlab 或是 Julia，那麼上手曲線可能沒那麼平緩。這就是為什麼筆者想寫這本教學手冊的原因：在具有最低限度的指令列知識下輕鬆上手 GMT。如果你對指令列不熟，但是有用過後三個程式語言的任何一個，那麼也可從相對應的 API 套件 (PyGMT、GMTMex 或 GMT.jl) 入門。由於 Python 的使用者廣大，因此本手冊對大多數範例附上了 PyGMT 的程式碼，讓 PyGMT 的使用者了解原生 GMT 的工作流程，以及提供 GMT 使用者進入 Python 資料分析世界的管道。

本手冊只會著重在與 GMT 或 PyGMT 相關的內容，並不會教你所有寫 Shell 腳本或 Python 程式碼的知識。歡迎自行從網路、書籍或實體課程中尋找相關資源。

## 安裝 GMT 或 PyGMT

GMT 和 PyGMT 有多種安裝方式，我個人推薦利用 `conda` 套件管理器安裝。至於其他的方法，可前往 [GMT](https://github.com/GenericMappingTools/gmt/blob/master/INSTALL.md) 或 [PyGMT](https://www.pygmt.org/latest/install.html) 的網站查看。

````{margin}
```{note}
Anaconda 會預裝很多常用的 Python 套件。如果只想要 Conda 而不想要其他的套件，也可以選擇安裝 [Miniconda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/download.html)。
```
````

1. 首先[安裝 Anaconda](https://www.anaconda.com/products/individual)。Anaconda 是個跨平台的套件管理軟體，尤其適合資料科學分析使用。你可以根據你的作業系統下載不同的檔案安裝。安裝 Anaconda 時會一併安裝我們需要的 Conda 管理器。Conda 的詳細用法，可參閱[官方說明文檔](https://docs.conda.io/projects/conda/en/latest/user-guide/index.html)。


2. 開啟{ref}`終端機 <Terminal>` (Linux 或 Mac) 或是 Anaconda 的指令列 (Windows)，使用具有第三方套件的 conda-forge 頻道做為安裝來源。

    ```bash
    $ conda config --prepend channels conda-forge
    ```

    ````{margin}
    ```{tip}
    覺得 `conda` 太慢的話，可以裝 `mamba` 來加速安裝套件。請參閱 [Mamba 的說明文檔](https://mamba.readthedocs.io/en/latest/user_guide/mamba.html)以及 [PyGMT 的官方安裝示範](https://www.pygmt.org/latest/install.html)。
    ```
    ````

3. 建立 GMT 的安裝環境並安裝 GMT。這邊環境的名字 `mygmt` 可自由更改成您喜歡的字。

    ```bash
    $ conda create --name mygmt python=3.9 gmt
    ```

   或是你也可以直接安裝 PyGMT，這樣 GMT 會一併被安裝：

    ```bash
    $ conda create --name mygmt python=3.9 numpy pandas xarray netcdf4 packaging pygmt
    ```

4. 切換至 `mygmt` 環境即可開始使用 GMT 或 PyGMT。你可以在終端機中透過 `gmt` 這個指令使用 GMT 的所有功能。

    ```bash
    $ conda activate mygmt
    $ gmt help
    ```

   如要使用 PyGMT，在 Python 互動介面或腳本內匯入同名模組即可：

    ```python
    import pygmt 
    pygmt.show_versions()
    ```

5. 推薦一併安裝 JupyterLab 以進行互動式資料分析。

    ```bash
    $ conda install jupyterlab
    ```
    
    PyGMT 需要的 Python 核心是 JupyterLab 預設核心，因此如果是使用 PyGMT 的話，不用再安裝任何東西。但如果想要透過 JupyterLab 執行 GMT 程式碼，就要額外安裝 Shell 核心，如 Calysto Bash： 
    
    ```bash
    $ conda install calysto_bash
    ```
    
    更多細節請參考 {doc}`using_this_book`。

[^1]: Wessel, P., and Smith, W. H. F. (1991). 
       Free software helps map and display data, EOS Trans. AGU, 72(41), 445–446. 
       <https://doi.org/10.1029/90EO00319>
[^2]: Wessel, P., Luis, J., Uieda, L., Scharroo, R., Wobbe, F., Smith, W. H. F., and Tian, D. (2019). 
       The Generic Mapping Tools Version 6. Geochemistry, Geophysics, Geosystems, 20. 
       <http://doi.org/10.1029/2019GC008515>
[^3]: Uieda, L., Tian, D., Leong, W. J., Jones, M., Schlitzer, W., Grund, M., Toney, L., Yao, J., 
       Magen, Y., Materna, K., Fröhlich, Y., Belem, A., Newton, T., Anant, A., Ziebarth, M., Quinn, Ja., and Wessel, P. (2022). 
       PyGMT: A Python interface for the Generic Mapping Tools (v0.7.0). Zenodo. <https://doi.org/10.5281/zenodo.6702566>








