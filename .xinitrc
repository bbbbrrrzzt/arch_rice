#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb ${XDG_CONFIG_HOME:-$HOME/.config}/Xresources &
picom -b &
xset r rate 300 50 &
sxhkd &
slstatus &
./.fehbg &

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
exec /usr/local/bin/dwm
