# UI, Flutter, Widget

> 8/22 (Sat.)

* IDE: Android Studio
<br>

* Download flutter SDK:
    * step 1: search the github of "flutter" on Google, and get the url:`https://github.com/flutter/flutter`.
    * step 2: open Terminal (cmd), go to `C:/`.
    * step 3: enter `git clone https://github.com/flutter/flutter`
    * step 4: enter `cd flutter`
    * step 5: enter `flutter doctor`, finished to install.
<br>

* 如果在 flutter project 的開發中，需要在專案下新增額外資料夾，必需編輯 `pubspec.yaml` 檔內容。
    * 之後打包時，程式編譯才知道須將非自訂內容的資料也要一起打包。
    * For example: add the folder of `assets`, to store the images.
    * Need to edit the `pubspec.yaml`:
        ```dart
        assets:
            - assets/
        ```





