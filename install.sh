SKIPMOUNT=false
LATESTARTSERVICE=false
POSTFSDATA=false
PROPFILE=false
print_modname() {
 printf "\033[33mFuckMIUI by Moe-hacker."
 ui_print 'mmmmmm m    m   mmm  m    m m    m mmmmm  m    m mmmmm'
 ui_print '#      #    # m"   " #  m"  ##  ##   #    #    #   #'
 ui_print '#mmmmm #    # #      #m#    # ## #   #    #    #   #'
 ui_print '#      #    # #      #  #m  # "" #   #    #    #   #'
 ui_print '#      "mmmm"  "mmm" #   "m #    # mm#mm  "mmmm" mm#mm'
 ui_print '愛にできることはまだあるよ，僕にできることはまだあるよ！"
}
on_install() {
 unzip -o "$ZIPFILE" -d $MODPATH 2>&1 > /dev/null
}
set_permissions() {
 set_perm_recursive $MODPATH 0 0 0755 0644
}
