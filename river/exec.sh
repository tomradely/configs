#!/bin/bash
export XDG_CONFIG_HOME="/home/tom/.config"
export XDG_DATA_DIRS="/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:/home/tom/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"
export PATH="$HOME/bin:$HOME/.local/bin:/usr/games:$PATH"
export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export GDK_BACKEND=wayland,x11
export GLFW_IM_MODULE=ibus
export XMODIFIERS=@im=fcitx
export GTK_USE_PORTAL=1
export GTK_IM_MODULE=fcitx 
export QT_IM_MODULE=wayland;fcitx
export XDG_CURRENT_DESKTOP=river
~/.local/bin/river
