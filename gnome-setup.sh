#!/bin/bash

# Ensure the gnome extensions are enabled
gsettings set org.gnome.shell disable-user-extensions false

# Always launch a new window/instance when selecting from the applications menu
# I know where to find the currently running instances, so if I am going to the applications
# menu, it is to launch a new instance
gnome-extensions enable launch-new-instance@gnome-shell-extensions.gcampax.github.com
