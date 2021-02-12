# GMT 教學手冊 (GMT Tutorials)

[網站 (中文)](http://gmt-tutorials.org)
[Website (English)](http://gmt-tutorials.org/en/)

![CC-BY](SOURCE_DOCS/by.png)

# 有關於此儲存庫 (About This Repository)

這裡為「GMT 教學手冊」網站的文本檔 (包含文字、腳本、圖片)，除了 README.md 之外，文檔皆以 *re***Structured***Text* 格式撰寫而成，再以 [Sphinx](http://www.sphinx-doc.org/en/stable/index.html) 編譯。

- `SOURCE_DOCS/xxx.rst`: 各章節文檔
- `SOURCE_DOCS/locale/en/`: 英文翻譯檔
- `SOURCE_DOCS/xxx/`: 各章節所需的圖片、輸入檔以及最終的 bash 腳本
- `_build/`: 編譯過的文檔

This repo hosts the source files (text, scripts, and images) of the website "GMT Tutorials". All the text (expect for the README.md itself) is in *re***Structured***Text* format and is built using [Sphinx](http://www.sphinx-doc.org/en/stable/index.html).



- `SOURCE_DOCS/xxx.rst`: text file for each chapter (webpage)
- `SOURCE_DOCS/locale/en/`: English translation files
- `SOURCE_DOCS/xxx/`: figures, sources for plotting, and the final bash script for each chapter
- `_build/`: html documentation

# 簡介 (Introduction)

**GMT** (**Generic Mapping Tools**, 通常譯成「**通用製圖工具**」) 是一套開放的地理繪圖軟體。與一般的地理繪圖軟體如 QGIS、ArcGIS 最大的不同是，GMT 完全可以在命令列介面底下運行。最新的 PyGMT 軟體更讓 Python 的使用者有更便捷的方式使用 GMT 提供的各種繪圖工具。對於有大量繪圖需求，想用程式語言或腳本批次檔處理這些繪圖工作的人而言，GMT 非常值得一學，但也正因為 GMT 的命令列風格令上手曲線顯得相當陡峭，使得許多想接觸地理繪圖的初學者望之卻步。

在本教學手冊中，會透過一個個範例介紹 GMT 的基礎知識與許多作圖實用技巧。每個章節的最終目標，基本上都是完成一張精美的插圖，本教學基本上採循序漸進的模式撰寫，但各篇章使用的材料是互相獨立的。初學者不妨從頭開始閱讀，但如果你已對 GMT 有相當程度的了解，更請隨時跳至你想查閱的部份以節省時間。如果有什麼想分享的評論或使用秘訣，非常歡迎在各章節中留言、在 Github 上留言或直接與[我](mailto:whyjayzheng@gmail.com)聯繫。祝各位都能在閱讀的過程中，享受到使用 GMT 畫地圖的樂趣！

**Generic Mapping Tools** (**GMT**) is a set of open-source software for mapping and plotting geographic data. It features a command-line interface, which makes it completely different from the common GIS software like QGIS or ArcGIS. The PyGMT software, which is the latest derivative of GMT, even allows all Python users to use the collection of GMT tools more conveniently. For those who need to deal with a lot of plotting tasks or want to write a script for handling all these jobs, GMT is extremely worth learning. However, The command-line style of GMT syntax would be very challenging and makes the learning curve very steep, especially for beginners who are not familiar with manipulating geographic data and mapping.

In these tutorials, we will explore basic knowledge of GMT and useful plotting skills from numerous examples. The goal of each chapter is to produce a high-quality map from scratch and I will show you how to do that step by step. The tutorials are designed and written from beginner level to more advanced tricks, but the content in each chapter is actually independent. You can read all the chapters in order if you are a GMT rookie, or you can jump to whichever section you are interested in to save your time if you have been using GMT for a while. Please feel free to leave any messages below any chapters, open an issue on Github, or contact [me](mailto:whyjayzheng@gmail.com) at any time for any questions, comments, and ideas/tips to be shared. I hope you enjoy the fun of mapping from reading these tutorials!

# 編譯文本 (How to build the files to html)

首先需安裝 Sphinx。我推薦先安裝 [Anaconda](https://www.anaconda.com/products/individual)，再使用 ```conda``` 指令安裝。

Firstly you will need Sphinx. I recommend installing [Anaconda](https://www.anaconda.com/products/individual) first and then installing Sphinx using the ```conda``` command.

```
$ conda install sphinx
```

再來使用 ```pip``` 安裝剩下需要的模組：

And then use ```pip``` to install the remaining necessary modules:

```
$ pip install sphinx_rtd_theme sphinx-intl
```

開始編譯 HTML:

Start building HTML:


```
# 前往 Makefile 所在資料夾，也就是根目錄 
# (Go to where the Makefile is located, which should be the root of this repo)
# 編譯中文文本 (build Chinese html)
make html
    # 文本會產生在 _build/html/ 底下 (html would be at _build/html/)

# 編譯英文文本 (make English html)
make gettext
sphinx-intl update -p _build/locale -l en
    # 前往 locale/en/ 翻譯文檔後... (Go to locate/en/ and translate them. After that...)
make -e SPHINXOPTS="-D language='en'" BUILDSURFIX="/en" html
    # 文本會產生在 _build/html/en/ 底下 (html would at _build/html/en/)

# 修改 CSS 與添加額外的網頁設計 (Modify CSS and add more web design)
bash decorate.bash

# 完成！ (Finished!!)
```

# 翻譯協作 (How to contribute translation)

如您對翻譯此網站有興趣，歡迎前往在 [Weblate 上公開的專案](https://hosted.weblate.org/projects/gmt-tutorials/) 並隨時開始翻譯。感謝您的貢獻！

If you are interested in translating this website, please come to the [open project on Weblate](https://hosted.weblate.org/projects/gmt-tutorials/) and start translating at any time. Thank you for contributing to this project!
