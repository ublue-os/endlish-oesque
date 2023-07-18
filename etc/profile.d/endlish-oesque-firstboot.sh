if test "$(id -u)" -gt "0" && test -d "$HOME"; then
    if test ! -e "$HOME"/.config/autostart/endlish-oesque-firstboot.desktop; then
        mkdir -p "$HOME"/.config/autostart
        cp -f /etc/skel.d/.config/autostart/endlish-oesque-firstboot.desktop "$HOME"/.config/autostart
    fi
fi
