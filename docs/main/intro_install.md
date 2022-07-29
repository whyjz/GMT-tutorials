# GMT / PyGMT 簡介與安裝

## [GMT][GMT-link] 是什麼？

[GMT][GMT-link] 的全名是 Generic Mapping Tools，為一套多功能的製圖工具。這套軟體始於 1988 年，由當時就讀於拉蒙特-杜赫第地球觀測站 (Lamont-Doherty Earth Observatory) 的 Pål (Paul) Wessel 和 Walter H. F. Smith 設計製作，並在 1991 年公開發表第一版。[^1] 軟體釋出後即收到廣大迴響，這些稱讚與建議成了兩位作者 (與其後加入開發團隊的所有人員) 繼續更新的原動力。三十多年過去了，GMT 在 2019 年的 11 月已經更新到第 6 版 [^2]，在地理繪圖領域享有一席之地，更是許多領域，如地球物理學、海洋科學等等，一定會接觸到的軟體之一。

GMT 身為「通用」的製圖工具，當然可以進行一般性的科學繪圖，大部分你想得到的圖表種類，都可以利用 GMT 內附的指令來完成。但本軟體真正的強大之處，還是在於地理資料的處理與地圖的繪製。GMT 內建許多和地理資訊系統 (GIS) 有關的演算法，讓使用者可以輕鬆的藉由一個個指令，就完成精美且高解析度的地圖。輸出的圖檔支援多種格式，包括向量化的格式檔案如 EPS 或 PDF 等，非常容易進行更多的編修。

[GMT-link]: https://www.generic-mapping-tools.org/

% GMT 近年發展，包括 GMT-Matlab, GMTSAR, GMT-Julia 等等

## [PyGMT][PyGMT-link] 呢？

[PyGMT][PyGMT-link] 其實就是把 GMT 重新包裝，讓所有 GMT 內的工具都可以透過 Python 這個程式語言以模組的方式來使用。除了讓原本就熟悉 Python 的人快速上手 GMT 外，遠程目標是與 Python 的其他資料科學模組一同連動，構築以 Python 進行科學資料分析的豐富環境。目前 PyGMT 已經支援了 Numpy、Pandas 和 Xarray 專有的資料格式，並且也可透過 Jupyter 環境進行互動性資料繪圖。[^3]

PyGMT 是由科學社群發起的專案計畫，目前的最新版 (版本號 0.7.0) 已於 2022 年 7 月釋出。各位如有興趣貢獻一己之力開發軟體，非常歡迎前往 PyGMT 的官方網站一探究竟。

[PyGMT-link]: https://www.pygmt.org/

## 我該使用 GMT 嗎？

如果你有製作地圖的需求，不管是全球地圖還是自家附近的街道圖，都可以考慮使用 GMT 或 PyGMT。不過，GMT 特別適合用於科學製圖，這是因為指令化的操作方式，讓觀測或實驗數據變得很容易搭配地理資訊一同呈現。因此，筆者尤其推薦給具有以下任一種需求的人：

1. <b>手邊有大量的地理數據需要呈現在地圖上。</b>例如：降雨量分佈、斷層與地震帶、海底地形圖、全世界火山分佈圖等等。

2. <b>時常繪製地圖，並且總是覺得使用 GIS 軟體效率太低。</b>學習指令列繪圖的技巧，一定能讓你的 GIS 繪圖效率大增。

3. <b>需要即時或互動性呈現地理資料分析的結果。</b>執行 GMT 或 PyGMT 的腳本，可以讓你把資料分析和繪圖輸出這兩件事一次完成。

唯一的問題是，GMT 所有的功能都必須透過指令列操作，對於沒接觸過指令列程式的人而言，GMT 的上手曲線可能沒那麼平緩。幸好，GMT 自身的指令格式並不那麼困難，而且在大多數的情形下，我們也不需要使用 GMT 以外的指令操作資料，因此只要稍微熟稔一點操作介面的觀念，就可輕鬆上手。有關詳情可以參考「{doc}`basic_concept`」。另外，如果你使用過或正在使用 Python 程式語言，那麼可以嘗試看看模組化的 PyGMT，加速學習的效率。

## 這本教學手冊

[筆者](https://whyjz.github.io/)目前為地球物理與行星科學領域的研究員，接觸 GMT 已超過 10 年。有感於網路上缺少 GMT 與 PyGMT 的簡明教學資料，導致包括筆者在內的許多人得花額外的時間熟悉各種工具的用法，因此決定試著紀錄一些使用心得與操作程序，並設計成教學手冊，讓新手們可以由淺入深學習 GMT，老鳥們也可以把本教學當成工具書一般的查看。

本教學的難度，是放在讓從沒操作過指令列程式的使用者也能理解的等級，並循序漸進到一些比較像程式碼的華麗繪圖流程。學習 GMT 最佳的方法，除了參考本手冊或其他線上說明外，實際動手做更是掌握此工具的不二法門，因此在本教學中所有的章節都會提供繪圖資料以供各位使用，或許你可以畫得出比章節的目標更漂亮的地圖！

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
[^3]: Uieda, L., Tian, D., Leong, W. J., Jones, M., Schlitzer, W., Grund, M., Toney, L., Yao, J., 
       Magen, Y., Materna, K., Fröhlich, Y., Belem, A., Newton, T., Anant, A., Ziebarth, M., Quinn, Ja., and Wessel, P. (2022). 
       PyGMT: A Python interface for the Generic Mapping Tools (v0.7.0). Zenodo. <https://doi.org/10.5281/zenodo.6702566>
