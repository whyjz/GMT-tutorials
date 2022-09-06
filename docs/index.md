# GMT 教學手冊

```{image} main/index/gmt_titleimage_banner_s.png
    :alt: GMT tutorials
    :width: 500
    :align: center
```
% :target: main/index/gmt_titleimage.png

**GMT** (**Generic Mapping Tools**, 通常譯成「**通用製圖工具**」) 是一套開源免費的地理繪圖軟體。原生的 GMT 透過 Windows 和 UNIX 系統的指令列運行，不過使用者也可以在編寫 Python、Julia、Matlab 以及 C 等程式語言時使用對應的包裝庫存取 GMT 的各項功能。因為 GMT 滿足了以程式進行大量高品質繪圖的需求，受到了地球物理、海洋學以及行星科學等社群的歡迎。然而，GMT 與其他具有圖像界面的軟體比起來更不好上手，令許多接觸地理繪圖或程式設計的初學者望之卻步。因此，本手冊旨在分享 GMT 的基礎知識與許多作圖實用技巧，希望能有更多人享受使用 GMT 畫地圖的樂趣！

在手冊的前幾章，我們會先瀏覽與 GMT 相關的概念、如何設置開發環境，以及如何使用後幾章的範例材料。接下來的章節則是以完成一張精美的圖片為目標，說明 GMT 的指令、操作方法以及其他訣竅。這些章節也提供了 Binder 連結，讓使用者直接在雲端存取、嘗試章節中的程式碼。本手冊的內文主要介紹的是 GMT **現代模式 (Modern mode)** 的語法，但也提供 **古典模式 (Classic mode)** 與 **PyGMT (Python 的 GMT 包裝庫)** 的相同範例讓有興趣的讀者交替使用。

本教學採循序漸進的模式撰寫，但各篇章使用的材料是互相獨立的。初學者不妨從頭開始閱讀，但如果您已對 GMT 有相當程度的了解，可以透過{doc}`main/command_index`與{doc}`main/gallery`跳至您想查閱的部份以節省時間。如果有什麼想分享的評論或使用秘訣，非常歡迎在各章節中留言或直接與[我](mailto:whyjayzheng@gmail.com)聯繫。

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

% Cite GMT tutorials

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