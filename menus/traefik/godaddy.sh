#!/bin/bash
#
# [Traefik V2]
#
# GitHub:   https://github.com/Admin9705/PlexGuide.com-The-Awesome-Plex-Server
# Author:   Admin9705 & DesignGears
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

  dialog --infobox "Configuring Traefik For: GoDaddy" 3 40
  sleep 2

#### PART 1 
  display1="GODADDY_API_KEY"
    dialog --title "Input Required Information" \
    --backtitle "Visit https://PlexGuide.com - Automations Made Simple" \
    --inputbox "$display1:" 8 40 2>/tmp/var1
  var1=$(cat /tmp/var1)
  main1="$display1=$var1"
  echo ""
  echo "test combinedd"
  echo $main1
  echo ""
  eval export ${main1}
 
 #### PART 2
  display2="GODADDY_API_SECRET"
    dialog --title "Input Required Information" \
    --backtitle "Visit https://PlexGuide.com - Automations Made Simple" \
    --inputbox "$display2:" 8 40 2>/tmp/var2
  var2=$(cat /tmp/var2)
  main2="$display2=$var2"
  echo ""
  echo "test combinedd"
  echo $main2
  echo ""
  eval export ${main2}

## If you want to display afterwards, uncomment the two lines below
#clear
#printenv

echo GODADDY_API_KEY

#  ansible-playbook /opt/plexguide/ansible/roles/traefik2/traefik2.yml --tags $provider