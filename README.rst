GMT 教學手冊 (GMT Tutorials)
======================================

`網站 (中文) <http://gmt-tutorials.org>`_

`Website (English) <http://gmt-tutorials.org/en/>`_

有關於此儲存庫 (About This Repository)
======================================

本儲存庫為「GMT 教學手冊」網站的文本檔，以 *re*\ **Structured**\ :sup:`Text` 格式撰寫而成，\
再以 `Sphinx <http://www.sphinx-doc.org/en/stable/index.html>`_ 建立。

``Sphinx`` 與相關的 ``Python`` 模組均建立在 `Anaconda 4.0.0 <https://www.continuum.io/downloads>` 之下。

- ``xxx.rst``: 各章節文檔
- ``xxx/``: 各章節所需的圖片以及最終的 bash 腳本
- ``_template/``: favicon 放在這
- ``_static/``: 在 sphinx 標準構築之外額外的 html、javascript 以及 css 程式碼片段
- ``locale/en/``: 英文翻譯檔

簡介 (Introduction)
======================================

**GMT** (**Generic Mapping Tools**, 通常譯成「**通用製圖工具**」) 是一套開放的地理繪圖軟體。與一般\
的地理繪圖軟體如 QGIS、ArcGIS 最大的不同是，GMT 完全可以在命令列介面底下運行。對於有大量\
繪圖需求，想用程式語言或腳本批次檔處理這些繪圖工作的人而言，GMT 非常值得一學，但也正因為\
GMT 的命令列風格令上手曲線顯得相當陡峭，使得許多想接觸地理繪圖的初學者望之卻步。

在本教學手冊中，會透過一個個範例介紹 GMT 的基礎知識與許多作圖實用技巧。每個章節的最終目標，\
基本上都是完成一張精美的插圖，本教學基本上採循序漸進的模式撰寫，但各篇章使用的材料是互相獨立的。\
初學者不妨從頭開始閱讀，但如果你已對 GMT 有相當程度的了解，更請隨時跳至你想查閱的部份以節省時間。
如果有什麼想分享的評論或使用秘訣，非常歡迎在各章節中留言或直接與\ `我 <https://www.facebook.com/whyjz>`_\ 聯繫。\
祝各位都能在閱讀的過程中，享受到使用 GMT 畫地圖的樂趣！

編譯文本
======================================

.. code-block:: bash

    # 編譯中文文本
    make html
        # 文本會產生在 ``_build/html/`` 底下

    # 編譯英文文本
    make gettext
    sphinx-intl update -p _build/locale -l en
        # (前往 locale/en/ 翻譯文檔)
    make -e SPHINXOPTS="-D language='en'" BUILDSURFIX="/en" html
        # 文本會產生在 ``_build/html/en/`` 底下

    # 修改 CSS 與為添加額外的欄位
    bash decorate.bash

    # 完成！
