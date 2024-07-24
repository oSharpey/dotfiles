#!/usr/bin/env bash
# Maintained in linux-config.org
if ! pgrep "ulauncher"; then
exec ulauncher;
else
exec ulauncher-toggle
fi
