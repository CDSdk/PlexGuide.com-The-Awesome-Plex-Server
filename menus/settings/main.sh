#!/bin/bash
#
# [PlexGuide Menu]
#
# GitHub:   https://github.com/Admin9705/PlexGuide.com-The-Awesome-Plex-Server
# Author:   Admin9705 & Deiteq
# URL:      https://plexguide.com
#
# PlexGuide Copyright (C) 2018 PlexGuide.com
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#   You may copy, distribute and modify the software as long as you track
#   changes/dates in source files. Any modifications to our software
#   including (via compiler) GPL-licensed code must also be made available
#   under the GPL along with build & install instructions.
#
#################################################################################

HEIGHT=18
WIDTH=59
CHOICE_HEIGHT=16
BACKTITLE="Visit https://PlexGuide.com - Automations Made Simple"
TITLE="PG Settings"
MENU="Make Your Selection Choice:"

OPTIONS=(A "Domain/Traefik: Setup/Change Domain & Trefik"
         B "Hard Drive 2nd: Use a Second HD for Processing"
         C "Notifications : Enable the Use of Notifications"
         D "Ports         : Turn On/Off Application Ports"
         E "Processor     : Enhance Processing Power"
         F "Kernel Mods   : Enhance Network Throughput"
         G "SuperSpeeds   : Change GDrive Transfer Settings"
         H "WatchTower    : Auto-Update Application Manager"
         I "Import Media  : Import Existing Media to GDrive "
         J "App Themes    : Install Dark Theme(s) For Apps "
         Z "Exit")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
    A)
        bash /opt/plexguide/menus/traefik/main.sh
        ;;
    B)
        bash /opt/plexguide/scripts/baseinstall/harddrive.sh ;;
    C)
        bash /opt/plexguide/menus/notifications/main.sh
        echo "Pushover Notifications are Working!" > /tmp/pushover
        ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags pushover &>/dev/null &
        ;;
    D)
        bash /opt/plexguide/menus/ports/main.sh ;;
    E)
        bash /opt/plexguide/scripts/menus/processor/processor-menu.sh ;;
    F)
        bash /opt/plexguide/scripts/menus/kernel-mod-menu.sh ;;
    G)
        bash /opt/plexguide/menus/transfer/menu.sh ;;
    H)
        bash /opt/plexguide/menus/watchtower/main.sh ;;
    I)
        bash /opt/plexguide/menus/migrate/main.sh ;;
    J)
        bash /opt/plexguide/menus/themes/main.sh ;;
    Z)
        clear
        exit 0
        ;;
    esac
clear

bash /opt/plexguide/menus/settings/main.sh
exit 0
