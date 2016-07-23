.. GMT 教學手冊 documentation master file, created by
   sphinx-quickstart on Sun Jan 10 14:27:02 2016.

GMT 教學手冊
======================================

**GMT** (**Generic Mapping Tools**, 通常譯成「**通用製圖工具**」) 是一套開放的地理繪圖軟體。與一般\
的地理繪圖軟體如 QGIS、ArcGIS 最大的不同是，GMT 完全可以在命令列介面底下運行。對於有大量\
繪圖需求，想用程式語言或腳本批次檔處理這些繪圖工作的人而言，GMT 非常值得一學，但也正因為\
GMT 的命令列風格令上手曲線顯得相當陡峭，使得許多想接觸地理繪圖的初學者望之卻步。

在本教學手冊中，會透過一個個範例介紹 GMT 的基礎知識與許多作圖實用技巧。每個章節的最終目標，\
基本上都是完成一張精美的插圖，你可以透過這些範例，了解 GMT 許多有用的指令操作方法，以及如\
何在命令列腳本 (Shell script) 中組織這些指令。除此之外，本教學也會在適當的地方，解說與\
GMT 相關的格式、軟體像是 shapefile、GDAL 之間的銜接，它們在實作上總是非常的有用。

GMT 目前具有兩個主要的版本：**GMT 4** 和 **GMT 5**。兩個版本的基本指令非常相似，但 GMT 5 具有更為\
齊全的功能。本教學使用 `GMT 5 <http://gmt.soest.hawaii.edu/>`_ 當作操作軟體，如果你是 GMT 新手，\
它也是我推薦使用的 GMT 版本。\
GMT 4 在某些地方，尤其是預設屬性的設定上，與 GMT 5 較為不同，因此如果你手邊已經有一些 GMT 4
的程式碼，在指令選項的細節上，請以
`GMT 4 官方說明手冊 <https://www.soest.hawaii.edu/gmt/gmt/html/gmt_services.html>`_\
為準。

本教學基本上採循序漸進的模式撰寫，但各篇章使用的材料是互相獨立的。初學者不妨從頭開始閱讀，\
但如果你已對 GMT 有相當程度的了解，更請隨時跳至你想查閱的部份以節省時間。如果有什麼想分\
享的評論或使用秘訣，非常歡迎在各章節中留言或直接與\ `我 <https://www.facebook.com/whyjz>`_\ 聯繫。\
祝各位都能在閱讀的過程中，享受到使用 GMT 畫地圖的樂趣！

授權
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. figure:: by.png
    :scale: 30
    :align: center

    本著作係採用\ `創用 CC 姓名標示 4.0 國際 授權條款 <http://creativecommons.org/licenses/by/4.0/>`_\ 授權。\
    在此授權條款下，您可以在任何目的下自由分享或修改本作品，並包含商業性質之使用。您只需給予原作者適當表彰（姓名標示）。

本網站中大部分用以繪圖的資料皆屬公領域，或以 GNU 通用公共授權條款發行。資料來源請參閱「\ :doc:`data_credit`\ 」。

Copyright © 2016 鄭懷傑 (Whyjay Zheng). All rights reserved.

教學內文與圖片的原始碼也公開在 `Github <https://github.com/whyjz/GMT-tutorials>`_ 上，以 
`reStructuredText <https://en.wikipedia.org/wiki/ReStructuredText>`_ 格式編寫。歡迎隨時動叉！

目錄
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. toctree::
   :maxdepth: 1

   intro_install
   software
   basic_concept
   making_first_map
   coloring_topography
   pen_and_painting
   editing_cpt_colorbar
   scatter_plot
   layout_design
   hillshading
   contour_and_profile
   data_credit

