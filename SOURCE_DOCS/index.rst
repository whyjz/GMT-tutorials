.. GMT 教學手冊 documentation master file, created by
   sphinx-quickstart on Sun Jan 10 14:27:02 2016.

GMT 教學手冊
======================================

.. image:: index_banner_text.png
    :scale: 25
    :align: center

**GMT** (**Generic Mapping Tools**, 通常譯成「**通用製圖工具**」) 是一套開放的地理繪圖軟體。與一般的地理繪圖軟體如 QGIS、ArcGIS 最大的不同是，GMT 完全可以在命令列介面底下運行。最新的 PyGMT 軟體更讓 Python 的使用者有更便捷的方式使用 GMT 提供的各種繪圖工具。對於有大量繪圖需求，想用程式語言或腳本批次檔處理這些繪圖工作的人而言，GMT 非常值得一學，但也正因為 GMT 的命令列風格令上手曲線顯得相當陡峭，使得許多想接觸地理繪圖的初學者望之卻步。

在本教學手冊中，會透過一個個範例介紹 GMT 的基礎知識與許多作圖實用技巧。每個章節的最終目標，基本上都是完成一張精美的插圖，你可以透過這些範例，了解 GMT 許多有用的指令操作方法，以及如何在命令列腳本 (Shell script) 中組織這些指令 (如果是 PyGMT 的話就是在 Python 腳本中組織)。除此之外，本教學也會在適當的地方解說 GMT 如何與 shapefile、GDAL 等相關的格式或軟體銜接，讓您的資料或繪圖處理流程更為順暢。

在 2019 年 11 月，GMT 釋出了官方第六版。此版本比起之前大眾常用的 GMT 4 與 GMT 5 改進了不少，而且語法更是全新翻修過。本教學預計以 **GMT 6** 的新式語法為主，但是各章節將附連結至 **GMT 4-5** 的傳統語法供您參考。另外。PyGMT 已於 2020 年發布測試版，因軟體尚在積極開發中，本教學暫時不會詳細的介紹 PyGMT 的各項語法，但是在每一章的最後，你可以找到用 PyGMT 寫成的腳本 (Jupyter Notebook 格式) 來製作此章節的目標圖片。

.. GMT 目前具有兩個主要的版本：**GMT 4** 和 **GMT 5**。兩個版本的基本指令非常相似，但 GMT 5 具有更為\
.. 齊全的功能。本教學使用 `GMT 5 <http://gmt.soest.hawaii.edu/>`_ 當作操作軟體，如果你是 GMT 新手，\
.. 它也是我推薦使用的 GMT 版本。\
.. GMT 4 在某些地方，尤其是預設屬性的設定上，與 GMT 5 較為不同，因此如果你手邊已經有一些 GMT 4
.. 的程式碼，在指令選項的細節上，請以
.. `GMT 4 官方說明手冊 <https://www.soest.hawaii.edu/gmt/gmt/html/gmt_services.html>`_\
.. 為準。

.. GMT has 2 main versions so far: GMT 4 and GMT 5. They are really similar to each other, especially for basic commands, but GMT 5 is further developed and has more completed functions. Here we use GMT 5 as our primary GMT version in all tutorials. If it’s your first time using GMT, I would also recommend sticking with GMT 5. As the old version, Some syntax details in GMT 4, such as setting up default parameters, differs from GMT 5. Thus, if you already have some codes written in GMT 4, please see GMT 4 Online Services for the most accurate support.

本教學基本上採循序漸進的模式撰寫，但各篇章使用的材料是互相獨立的。初學者不妨從頭開始閱讀，但如果你已對 GMT 有相當程度的了解，更請隨時跳至你想查閱的部份以節省時間。如果有什麼想分享的評論或使用秘訣，非常歡迎在各章節中留言或直接與\ `我 <mailto:whyjayzheng@gmail.com>`_\ 聯繫。祝各位都能在閱讀的過程中，享受到使用 GMT 畫地圖的樂趣！

授權
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

本著作使用 MIT 與創用 CC 姓名標示 4.0 雙授權，使用者可以依據其想要獲得授權的部份選擇任一或兩個許可：

* `MIT 授權 <https://github.com/whyjz/GMT-tutorials/blob/master/LICENSE.md>`_：適用程式碼的部份以及所有的 Jupyter Notebooks。被授權人有權利使用、複製、修改、合併、出版發行、散布、再授權和/或販售軟體及軟體的副本。

* `創用 CC 姓名標示 4.0 國際 授權條款 <http://creativecommons.org/licenses/by/4.0/>`_：適用於文本部份。在此授權條款下，您可以在任何目的下自由分享或修改本作品，並包含商業性質之使用。您只需給予原作者適當表彰（姓名標示）。

|pic1| |pic2|

.. |pic1| image:: mit.png
   :alt: MIT License
   :scale: 30

.. |pic2| image:: by.png
   :alt: CC BY 4.0 License
   :scale: 30

.. figure by.png
..    :scale: 30
..    :align: center

.. 本網站中大部分用以繪圖的資料皆屬公領域，或以 GNU 通用公共授權條款發行。詳細說明請參閱「\ :doc:`data_credit`\ 」。

Copyright © 2016-21 鄭懷傑 (Whyjay Zheng). All rights reserved.

教學內文與圖片的原始碼公開在 `Github <https://github.com/whyjz/GMT-tutorials>`_ 上，以 `reStructuredText <https://en.wikipedia.org/wiki/ReStructuredText>`_ 格式編寫。歡迎隨時動叉！

致謝
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
感謝 William Durkin，Patricia MacQueen，李明龍，李定宇等人提出的建議與討論，讓本教學手冊的內容更為豐富完整。另外，也感謝所有 Github 上的協作者：譚諤 (tan2)，李奎模 (likueimo)，王亮 (wangliang1989)，對文檔內容所作的建設性修改。在此深深謝謝參與翻譯此教學手冊的人員，翻譯是件龐大的工作，沒有你們的協助是不可能完成的。如您也想參與一起翻譯本教學，請參閱下方說明。

翻譯協作 |pic3|
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
如您對翻譯此網站有興趣，歡迎前往在 `Weblate 上公開的專案 <https://hosted.weblate.org/engage/gmt-tutorials/>`_\ 並隨時開始翻譯。感謝您的貢獻！

.. |pic3| image:: https://hosted.weblate.org/widgets/gmt-tutorials/-/88x31-black.png
    :alt: Translation status
    :target: https://hosted.weblate.org/engage/gmt-tutorials/

..    :align: left 

贊助本教學
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
覺得本教學手冊的內容頗有幫助？隨時歡迎\ `請我喝杯手搖奶茶 <https://www.paypal.com/donate?hosted_button_id=68GZNRJ3MZDBE>`_，讓我有更多的能量繼續創作。行有餘力的話，也歡迎出資贊助本教學網站的營運和維護成本 :D

目錄
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

如果你想快速瀏覽各章的目標與地圖，請前往\ :doc:`gallery`。

* 新手入門
   - :doc:`intro_install`
   - :doc:`software`
   - :doc:`basic_concept`
* 繪圖的基本技巧
   - :doc:`making_first_map`
   - :doc:`coloring_topography`
   - :doc:`pen_and_painting`
   - :doc:`scatter_plot`
* 繪製與編修各種常見的地圖 (基礎)
   - :doc:`cpt_colormap`
   - :doc:`plot_vector_data`
   - :doc:`layout_design`
   - :doc:`hillshading`
   - :doc:`contour_and_profile`
   - :doc:`map_elements`
* 繪製與編修各種常見的地圖 (進階)
   - :doc:`editing_cpt_colorbar`
   - :doc:`view3d`
   - :doc:`focal_mech`
   - :doc:`draping`
* 網格資料處理
   - :doc:`raster_calculator`
   - :doc:`basic_img_processing`
* 數值資料處理
   - :doc:`stat_histogram`
   - :doc:`regression_basics`
* 附錄
   - :doc:`data_credit`
   - :doc:`command_index`
   - :doc:`gallery`

.. toctree::
   :maxdepth: 1
   :numbered:
   :hidden:

   intro_install
   software
   basic_concept
   making_first_map
   coloring_topography
   pen_and_painting
   scatter_plot
   cpt_colormap
   plot_vector_data
   layout_design
   hillshading
   contour_and_profile
   map_elements
   editing_cpt_colorbar
   view3d
   focal_mech
   draping
   raster_calculator
   basic_img_processing
   stat_histogram
   regression_basics
   data_credit
   command_index
   gallery


