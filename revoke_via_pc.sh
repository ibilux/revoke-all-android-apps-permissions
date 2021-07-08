#!/bin/bash
#######################
# Written by: @ibilux #
#######################

adb shell pm list packages -3 | while read line; do
  package=${line#"package:"};
  echo revoking $package;
  while read permission; do
    echo revoking $package:$permission;
    adb shell pm revoke $package $permission;
  done < permissions.txt;
done;
