; アイコン設定
Menu, Tray, Icon, % A_ScriptDir . "\p_paste.ico",, 1

; Teams.exeが"アクティブのときにだけ"
#IfWinActive, ahk_exe Teams.exe
    ; ショートカットキー：Ctrl + D 押下時に実行
    ~^d::
        open_selected_str_by_explorer()
        Return
#IfWinActive

; 選択した文字列をエクスプローラで開く
open_selected_str_by_explorer(){
    ; 現在のクリップボードをバックアップ
    Backup := ClipboardAll

    ; クリップボードを空にする※必須
    Clipboard =

    ; 文字列をコピーして、そのクリップボードを保存
    Send, ^c
    Sleep,50
    currentClip := Clipboard
    Sleep,500

    ; クリップボードのフォルダパスが存在する場合、エクスプローラでそのフォルダパスを開く
    IfExist, %currentClip%
        Run, explorer.exe "%currentClip%"

    ; 現在のクリップボードを復旧
    Clipboard := Backup
}