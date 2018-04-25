
# 程式碼樣板 製作教學

## I - 流程

![.](https://github.com/5SMNOONMS5/XcodeSyncTools/blob/master/Imgs/tu_t4.gif)

## II - 路徑

![](https://github.com/5SMNOONMS5/XcodeSyncTools/blob/master/Imgs/tu_t1.png)

```
/Users/stephenchen/Library/Developer/Xcode
```

## III - 目錄結構

![.](https://github.com/5SMNOONMS5/XcodeSyncTools/blob/master/Imgs/tu_t2.png)

* 這裡透過 TableviewHeader 跟 cell 來比喻。

> 後綴名一定要是 **xctemplate**

## IV - 檔案介紹

![.](https://github.com/5SMNOONMS5/XcodeSyncTools/blob/master/Imgs/tu_t3.png)

| 檔案名稱  | 描敘  | 
|--:|---|
| TemplateIcon.png  |  48 * 48  |
| TemplateIcon@2x.png  | 96 * 96  | 
| TemplateInfo.plist  | 設定參數，下方會描敘更多 |
| \_\_\_FILEBASENAME___.xib  | 客製化的 xib  | 
| \_\_\_FILEBASENAME___.swift  | 客製化的 swift |

## V - Plist 的參數

![.](https://github.com/5SMNOONMS5/XcodeSyncTools/blob/master/Imgs/create_file.gif)

Plist 的參數是直接影響**創建的過程**，打個比方，動態的輸入檔案名稱的時候





## VI - 源碼變數 ~~> 產生後的檔案

![.](https://github.com/5SMNOONMS5/XcodeSyncTools/blob/master/Imgs/tu_t5.png)
![.](https://github.com/5SMNOONMS5/XcodeSyncTools/blob/master/Imgs/tu_t6.png)

* 源碼變數介紹，假設我開了一個新專案，名稱叫做 MyProject，透過產生了一個 test.swift 的檔案。

| 參數  | 顯示  | 備註 |
|--:|---|---|
| \_\_\_YEAR___	  |  2018  | |
| \_\_\_TIME___  |  9:36 PM  | |
| \_\_\_COPYRIGHT___  | 版權說明 | |
| \_\_\_DATE___  |  創建這檔案的時間  | |
| \_\_\_ORGANIZATIONNAME___  | 創建者的姓名 | |
| \_\_\_FILEBASENAME___  | Test.swift  | **沒有**後綴名 |
| \_\_\_FILENAME___  | Test | **有**後綴名 |
| \_\_\_FILEBASENAMEASIDENTIFIER___  | Test | **沒有**後綴名，任何在 c 語言裡面非法的變量名稱(Ex: $%)，都會被下底線替換掉 |
| \_\_\_USERNAME___  | stephenchen | 當前電腦登入者的姓名 |
| \_\_\_FULLUSERNAME___  | StephenChen | 當前電腦登入者的姓名(全名) | 
| \_\_\_PROJECTNAME___  | MyProject | |
| \_\_\_PROJECTNAMEASIDENTIFIER___  | MyProject  | 當前項目的名稱，任何在 c 語言裡面非法的變量名稱(Ex: $%)，都會被**下劃線**替換掉 |
| \_\_\_PROJECTNAMEASXML___  | MyProject | 當前項目的名稱，但是任何特殊字串都會被替換成合格的 XML 字串(EX: < 跟 > 被分別替換為 < 還有 &rt; |
| \_\_\_PACKAGENAME___  | MyProject | 通常跟項目名稱會是一樣的 |
| \_\_\_PACKAGENAMEASIDENTIFIER___  | MyProject | 通常跟項目名稱會是一樣的，任何在 c 語言裡面非法的變量名稱(Ex: $%)，都會被**下劃線**替換掉 |
| \_\_\_PACKAGENAMEASXML___  | MyProject | 通常跟項目名稱會是一樣的，但是任何特殊字串都會被替換成合格的 XML 字串(EX: < 跟 > 被分別替換為 < 還有 &rt; |
| \_\_\_UUIDASIDENTIFIER___	  |   4C046C78-743D-4E52-B59F-E99711C4D3A5  | UUID 通用唯一標識符 (A universally unique identifier) |
| \_\_\_UUIDASIDENTIFIER___  |  4C046C78-743D-4E52-B59F-E99711C4D3A5  | UUID 通用唯一標識符，任何在 c 語言裡面非法的變量名稱(Ex: $%)，都會被**下劃線**替換掉。|
| \_\_\_VARIABLE_NameOfVariable___  | Test | 這個值是在創建檔案的時候所輸入的檔名，比如我剛剛輸入 Test，我在源碼寫成 \_\_\_VARIABLE_NameOfVariable___ViewController，那結果就會是 TestViewController |

## Reference 

[Use-your-loaf](https://useyourloaf.com/blog/creating-custom-xcode-project-templates/)

[Xcode 4 Template Documentation](http://www.learn-cocos2d.com/store/xcode4-template-documentation)
