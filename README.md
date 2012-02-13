# Remove Exif Plug-in for MovableType
* Author:: Yuichi Takeuchi <uzuki05@takeyu-web.com>
* Website:: http://takeyu-web.com/
* Copyright:: Copyright 2011-2012 Yuichi Takeuchi
* License:: MIT-License

pluginsディレクトリに配置すると、アセットのサムネイル生成の際にExif情報を削除するようになります。

## 動作（するかもしれない）環境
* MovableType/MTOS 5
** MovableType 4 は未検証
* Image::Magick が利用できるサーバー

## しくみ
MT標準のサムネイル生成関数をフックして、サムネイル削除コードを挿入します。

フックするだけなので、サムネイル生成の挙動自体はかわりません。


## ご注意
* 無保証です。このプラグインを使用したことでいかなる損害が発生しても、制作者は一切責任を負いません。
