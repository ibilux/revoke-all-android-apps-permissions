#!/bin/bash
#######################
# Written by: @ibilux #
#######################

pm list packages -3 | while read line; do
  package=${line#"package:"};
  echo revoking $package;
  while read permission; do
    echo revoking $package:$permission;
    pm revoke $package $permission;
  done < permissions.txt;
done;
