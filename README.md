# GMT 教學手冊 (GMT Tutorials)

[網站 (中文)](http://gmt-tutorials.org)
[Website (English)](http://gmt-tutorials.org/en/)

![CC-BY](SOURCE_DOCS/by.png)

# 有關於此儲存庫 (About This Repository)

這裡為「GMT 教學手冊」網站的文本檔，以 *re***Structured**^Text^ 格式撰寫而成，再以 [Sphinx](http://www.sphinx-doc.org/en/stable/index.html) 建立。

Sphinx 與相關的 Python 模組均透過 [Anaconda 4.0.0](https://www.continuum.io/downloads) 安裝。

- `SOURCE_DOCS/xxx.rst`: 各章節文檔
- `SOURCE_DOCS/locale/en/`: 英文翻譯檔
- `SOURCE_DOCS/xxx/`: 各章節所需的圖片、輸入檔以及最終的 bash 腳本
- `_build/`: 編譯過的文檔

Here are the source and text files for the website "GMT Tutorials". All the text is written in *re***Structured**^Text^ format. The website is built using [Sphinx](http://www.sphinx-doc.org/en/stable/index.html).

Sphinx itself and all related Python modules are installed through [Anaconda 4.0.0](https://www.continuum.io/downloads).

- `SOURCE_DOCS/xxx.rst`: text file for each chapter (webpage)
- `SOURCE_DOCS/locale/en/`: English translation files
- `SOURCE_DOCS/xxx/`: figures, sources for plotting, and the final bash script for each chapter
- `_build/`: html documentation

# 簡介 (Introduction)

**GMT** (**Generic Mapping Tools**, 通常譯成「**通用製圖工具**」) 是一套開放的地理繪圖軟體。與一般的地理繪圖軟體如 QGIS、ArcGIS 最大的不同是，GMT 完全可以在命令列介面底下運行。對於有大量繪圖需求，想用程式語言或腳本批次檔處理這些繪圖工作的人而言，GMT 非常值得一學，但也正因為GMT 的命令列風格令上手曲線顯得相當陡峭，使得許多想接觸地理繪圖的初學者望之卻步。

在本教學手冊中，會透過一個個範例介紹 GMT  的基礎知識與許多作圖實用技巧。每個章節的最終目標，基本上都是完成一張精美的插圖，本教學基本上採循序漸進的模式撰寫，但各篇章使用的材料是互相獨立的。初學者不妨從頭開始閱讀，但如果你已對 GMT 有相當程度的了解，更請隨時跳至你想查閱的部份以節省時間。如果有什麼想分享的評論或使用秘訣，非常歡迎在各章節中留言或直接與 [我](mailto:whyjayzheng@gmail.com) 聯繫。祝各位都能在閱讀的過程中，享受到使用 GMT 畫地圖的樂趣！

**Generic Mapping Tools** (**GMT**) is a set of open-source software for mapping and plotting geographic data. It features a command-line interface, which makes it completely different from the common GIS software like QGIS or ArcGIS. For those who need to deal with a lot of plotting tasks, or want to write a script for handling all these jobs, GMT is extremely worth learning; however, The command-line style of GMT syntax would be very challenging and makes the learning curve very steep, especially for beginners who are not familiar with manipulating geographic data and mapping.

In this tutorials, we will introduce the basic GMT knowledge and many useful tips from numerous exmaples. The final goal for each chapter is always to finish a well-designated map or figure. The tutorials are basically written from introductory level to more advanced techniques, but the materials for each chapeter is also independent. If you have never heard what the GMT is, it would be a good start from the most beginning of this tutorials; but if you are already a seasoned GMT user, please jump to the chapter you're interested to save your time. If you have any comments and tips and want to share with everybody, please feel free to leave a message below any chapters, or send it to [me](mailto:whyjayzheng@gmail.com) at any time. I hope you guys could enjoy the fun plotting using GMT from this tutorials!

# 編譯文本 (How to build the files to html)

```
    # 編譯中文文本 (build Chinese html)
    make html
        # 文本會產生在 _build/html/ 底下
        # html would be put under _build/html/

    # 編譯英文文本 (make English html)
    make gettext
    sphinx-intl update -p _build/locale -l en
        # (前往 locale/en/ 翻譯文檔)
        # (Go to locate/en/ and translate them)
    make -e SPHINXOPTS="-D language='en'" BUILDSURFIX="/en" html
        # 文本會產生在 _build/html/en/ 底下
        # html would be put under _build/html/en/

    # 修改 CSS 與添加額外的網頁設計 (Modify CSS and add more web design)
    bash decorate.bash

    # 完成！
    # Finished!!
```
