<a href="https://hosted.weblate.org/engage/gmt-tutorials/">
<img src="https://hosted.weblate.org/widgets/gmt-tutorials/-/svg-badge.svg" alt="翻譯狀態" />
</a>

# GMT 教學手冊 (GMT Tutorials)

[網站 (中文)](http://gmt-tutorials.org)
[Website (English)](http://gmt-tutorials.org/en/)

# 有關於此儲存庫 (About This Repository)

這裡為「GMT 教學手冊」網站的文本檔 (包含文字、腳本、圖片)，使用 *re***Structured***Text* 與 MyST 格式混合撰寫，以 [Jupyter Book](https://jupyterbook.org/) 編譯。

- `docs/`: 文檔設定、首頁、HTML 外觀調整與插入元件
- `docs/main/`: 文檔內容
- `docs/locale/`: 供翻譯作業的檔案

This repo hosts the source files (text, scripts, and images) of the website "GMT Tutorials". The documents are in *re***Structured***Text* and MyST format and are built using [Jupyter Book](https://jupyterbook.org/).

- `docs/`: documentation settings, index page, HTML appearances and plugins
- `docs/main/`: main content
- `docs/locale/`: files for translating into other languages

# 簡介 (Introduction)

**GMT** (**Generic Mapping Tools**, 通常譯成「**通用製圖工具**」) 是一套開放的地理繪圖軟體。與一般的地理繪圖軟體如 QGIS、ArcGIS 最大的不同是，GMT 完全可以在命令列介面底下運行。最新的 PyGMT 軟體更讓 Python 的使用者有更便捷的方式使用 GMT 提供的各種繪圖工具。對於有大量繪圖需求，想用程式語言或腳本批次檔處理這些繪圖工作的人而言，GMT 非常值得一學，但也正因為 GMT 的命令列風格令上手曲線顯得相當陡峭，使得許多想接觸地理繪圖的初學者望之卻步。

在本教學手冊中，會透過一個個範例介紹 GMT 的基礎知識與許多作圖實用技巧。每個章節的最終目標，基本上都是完成一張精美的插圖，本教學基本上採循序漸進的模式撰寫，但各篇章使用的材料是互相獨立的。初學者不妨從頭開始閱讀，但如果你已對 GMT 有相當程度的了解，更請隨時跳至你想查閱的部份以節省時間。如果有什麼想分享的評論或使用秘訣，非常歡迎在各章節中留言、在 Github 上留言或直接與[我](mailto:whyjayzheng@gmail.com)聯繫。祝各位都能在閱讀的過程中，享受到使用 GMT 畫地圖的樂趣！

**Generic Mapping Tools** (**GMT**) is a set of open-source software for mapping and plotting geographic data. It features a command-line interface, which makes it completely different from the common GIS software like QGIS or ArcGIS. The PyGMT software, which is the latest derivative of GMT, even allows all Python users to use the collection of GMT tools more conveniently. For those who need to deal with a lot of plotting tasks or want to write a script for handling all these jobs, GMT is extremely worth learning. However, The command-line style of GMT syntax would be very challenging and makes the learning curve very steep, especially for beginners who are not familiar with manipulating geographic data and mapping.

In these tutorials, we will explore basic knowledge of GMT and useful plotting skills from numerous examples. The goal of each chapter is to produce a high-quality map from scratch and I will show you how to do that step by step. The tutorials are designed and written from beginner level to more advanced tricks, but the content in each chapter is actually independent. You can read all the chapters in order if you are a GMT rookie, or you can jump to whichever section you are interested in to save your time if you have been using GMT for a while. Please feel free to leave any messages below any chapters, open an issue on Github, or contact [me](mailto:whyjayzheng@gmail.com) at any time for any questions, comments, and ideas/tips to be shared. I hope you enjoy the fun of mapping from reading these tutorials!

# 編譯文本 (How to build the files to html)

需安裝 Jupyter Book 以及 sphinx-inline-tabs。前者可使用 ```conda``` 或 ```pip``` 安裝，後者可透過 ```pip``` 安裝。

The documentation needs Jupyter Book and sphinx-inline-tabs to build. The former is available through ```conda``` or ```pip```, and the latter can be installed using ```pip```..

```
$ pip install jupyter-book sphinx-inline-tabs
```

開始編譯 HTML，在儲存庫根目錄下執行以下指令:

Start building HTML by running this command in the root path of this repository:


```
$ bash generate_html.bash
```

編譯完成的 HTML 網頁會儲存在 `docs/_build/html/` 之中。

The compiled HTML pages would be stored in `docs/_build/html/`.

# 授權 (License)

本作品使用 MIT 與 CC BY 4.0 雙授權。更多資訊請參閱 [授權檔案](LICENSE.md)。

This work is dual-licensed under the MIT licenses and the CC BY 4.0 licenses. For more information, please see the [LICENSE file](LICENSE.md).

# 翻譯協作 (How to contribute translation)

如您對翻譯此網站有興趣，歡迎前往在 [Weblate 上公開的專案](https://hosted.weblate.org/engage/gmt-tutorials/) 並隨時開始翻譯。感謝您的貢獻！

If you are interested in translating this website, please come to the [open project on Weblate](https://hosted.weblate.org/engage/gmt-tutorials/) and start translating at any time. Thank you for contributing to this project!

<a href="https://hosted.weblate.org/engage/gmt-tutorials/">
<img src="https://hosted.weblate.org/widgets/gmt-tutorials/-/multi-auto.svg" alt="翻譯狀態" />
