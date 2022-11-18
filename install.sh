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
 ui_print '               目前移除应用数  :  58'
 ui_print '               目前屏蔽域名数  :  70'
}
on_install() {
 unzip -o "$ZIPFILE" -d $MODPATH 2>&1 > /dev/null
}
set_permissions() {
 set_perm_recursive $MODPATH 0 0 0755 0644
}
