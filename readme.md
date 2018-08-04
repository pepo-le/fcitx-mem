# fcitx-mem
Vimで挿入モードへ移行するときに、以前のIME状態を復元するプラグインです。  
Terminal上のVimや`vim -g`で起動したGVimでも動作します。

## 動作条件
- fcitxの入力メソッド切り替えで入力状態を制御していること
- `fcitx-remote`コマンドが使えること
- `iminsert`が`0`または`2`に設定されていること（GVimではiminsertが`1`だと以前の状態に関わらず直接入力で挿入モードに移行します）

## 補足
v8.0.1344以降のGVimでは復元動作が機能しないようです。  
（参考：[Linux版 gvimで imactivatefunc / imstatusfunc が 8.0.1344以降、呼ばれなくなっている #1130](https://github.com/vim-jp/issues/issues/1130)）  
GVimをご使用の方は[fcitx-mem-re](https://github.com/pepo-le/fcitx-mem-re)もお試しください。
