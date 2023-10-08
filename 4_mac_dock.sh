#!/bin/sh

dockutil --no-restart --remove all

dockutil --no-restart --add "/System/Applications/Launchpad.app"
dockutil --no-restart --add "/System/Applications/System Preferences.app"
dockutil --no-restart --add "/System/Applications/Safari.app"
dockutil --no-restart --add "/System/Applications/Reminders.app"
dockutil --no-restart --add "/System/Applications/Calender.app"

dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/RStudio.app"
# dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/Microsoft Teams.app"
dockutil --no-restart --add "/Applications/iterm.app"
# dockutil --no-restart --add "/Applications/Microsoft Excel.app"
# dockutil --no-restart --add "/Applications/Microsoft Word.app"


#The following adds a spacer tile in the apps section after System Preferences
# dockutil --add '' --type spacer --section apps --after "System Preferences"




killall Dock
