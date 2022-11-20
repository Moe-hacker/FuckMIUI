SKIPMOUNT=false
LATESTARTSERVICE=false
POSTFSDATA=false
PROPFILE=false
print_modname() {
 ui_print ''
 ui_print ''
 ui_print ''
 ui_print ''
 ui_print 'FuckMIUI by Moe-hacker.'
 ui_print ''
 ui_print 'mmmmmm m    m   mmm  m    m m    m mmmmm  m    m mmmmm'
 ui_print '#      #    # m"   " #  m"  ##  ##   #    #    #   #'
 ui_print '#mmmmm #    # #      #m#    # ## #   #    #    #   #'
 ui_print '#      #    # #      #  #m  # "" #   #    #    #   #'
 ui_print '#      "mmmm"  "mmm" #   "m #    # mm#mm  "mmmm" mm#mm'
 ui_print ''
 ui_print '愛にできることはまだあるよ，僕にできることはまだあるよ！'
 ui_print ''
 ui_print ''
 ui_print '都说了仅供观赏，听不懂猫话吗？喵喵喵？等着卡米吧，哼！💢'
 ui_print ''
 ui_print ''
 ui_print ''
 ui_print ''
}
on_install() {
 unzip -o "$ZIPFILE" -d $MODPATH 2>&1 > /dev/null
 #没想到吧，这里也有玄学优化
 settings put global hide_error_dialogs 1
}
set_permissions() {
 set_perm_recursive $MODPATH 0 0 0755 0644
}
