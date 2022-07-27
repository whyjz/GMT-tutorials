# GMT 教學手冊

```{image} main/index/index_banner_text.png
    :alt: GMT tutorials
    :scale: 25
    :align: center
```

**GMT** (**Generic Mapping Tools**, 通常譯成「**通用製圖工具**」) 是一套開放的地理繪圖軟體。與一般的地理繪圖軟體如 QGIS、ArcGIS 最大的不同是，GMT 完全可以在命令列介面底下運行。最新的 PyGMT 軟體更讓 Python 的使用者有更便捷的方式使用 GMT 提供的各種繪圖工具。對於有大量繪圖需求，想用程式語言或腳本批次檔處理這些繪圖工作的人而言，GMT 非常值得一學，但也正因為 GMT 的命令列風格令上手曲線顯得相當陡峭，使得許多想接觸地理繪圖的初學者望之卻步。

在本教學手冊中，會透過一個個範例介紹 GMT 的基礎知識與許多作圖實用技巧。每個章節的最終目標，基本上都是完成一張精美的插圖，你可以透過這些範例，了解 GMT 許多有用的指令操作方法，以及如何在命令列腳本 (Shell script) 中組織這些指令 (如果是 PyGMT 的話就是在 Python 腳本中組織)。除此之外，本教學也會在適當的地方解說 GMT 如何與 shapefile、GDAL 等相關的格式或軟體銜接，讓您的資料或繪圖處理流程更為順暢。

在 2019 年 11 月，GMT 釋出了官方第六版。此版本比起之前大眾常用的 GMT 4 與 GMT 5 改進了不少，而且語法更是全新翻修過。本教學預計以 **GMT 6** 的新式語法為主，但是各章節將附連結至 **GMT 4-5** 的傳統語法供您參考。另外。PyGMT 已於 2020 年發布測試版，因軟體尚在積極開發中，本教學暫時不會詳細的介紹 PyGMT 的各項語法，但是在每一章的最後，你可以找到用 PyGMT 寫成的腳本 (Jupyter Notebook 格式) 來製作此章節的目標圖片。

本教學基本上採循序漸進的模式撰寫，但各篇章使用的材料是互相獨立的。初學者不妨從頭開始閱讀，但如果你已對 GMT 有相當程度的了解，更請隨時跳至你想查閱的部份以節省時間。如果有什麼想分享的評論或使用秘訣，非常歡迎在各章節中留言或直接與[我](mailto:whyjayzheng@gmail.com)聯繫。祝各位都能在閱讀的過程中，享受到使用 GMT 畫地圖的樂趣！

## 授權

本著作使用 MIT 與創用 CC 姓名標示 4.0 雙授權，使用者可以依據其想要獲得授權的部份選擇任一或兩個許可：

- [MIT 授權](https://github.com/whyjz/GMT-tutorials/blob/master/LICENSE.md)：適用程式碼的部份以及所有的 Jupyter Notebooks。被授權人有權利使用、複製、修改、合併、出版發行、散布、再授權和/或販售軟體及軟體的副本。

- [創用 CC 姓名標示 4.0 國際 授權條款](http://creativecommons.org/licenses/by/4.0/)：適用於文本部份。在此授權條款下，您可以在任何目的下自由分享或修改本作品，並包含商業性質之使用。您只需給予原作者適當表彰（姓名標示）。

```{image} main/index/mit.png
    :alt: MIT License
    :scale: 30
```

```{image} main/index/by.png
    :alt: CC BY 4.0 License
    :scale: 30
```

Copyright © 2016-22 鄭懷傑 (Whyjay Zheng).

教學內文與圖片的原始碼公開在 [Github](https://github.com/whyjz/GMT-tutorials) 上，歡迎隨時動叉！

% 以 `reStructuredText <https://en.wikipedia.org/wiki/ReStructuredText>`_ 格式編寫。

## 致謝

感謝 William Durkin，Patricia MacQueen，李明龍，李定宇等人提出的建議與討論，讓本教學手冊的內容更為豐富完整。另外，也感謝所有 Github 上的協作者：譚諤 (tan2)，李奎模 (likueimo)，王亮 (wangliang1989)，對文檔內容所作的建設性修改。在此深深謝謝參與翻譯此教學手冊的人員，翻譯是件龐大的工作，沒有你們的協助是不可能完成的。如您也想參與一起翻譯本教學，請參閱下方說明。

## 翻譯協作

```{image} https://hosted.weblate.org/widgets/gmt-tutorials/-/88x31-black.png
    :alt: Translation status
    :target: https://hosted.weblate.org/engage/gmt-tutorials/
    :align: right
```

如您對翻譯此網站有興趣，歡迎前往在 [Weblate 上公開的專案](https://hosted.weblate.org/engage/gmt-tutorials/)並隨時開始翻譯。感謝您的貢獻！

## 贊助本教學
覺得本教學手冊的內容頗有幫助？隨時歡迎[請我喝杯手搖奶茶](https://www.paypal.com/donate?hosted_button_id=68GZNRJ3MZDBE)，讓我有更多的能量繼續創作。行有餘力的話，也歡迎出資贊助本教學網站的營運和維護成本 :D

<p> <form action="https://www.paypal.com/donate" method="post" target="_top"> <input type="hidden" name="hosted_button_id" value="68GZNRJ3MZDBE" /> <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate with PayPal button" /> <img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1" /> </form> </p>