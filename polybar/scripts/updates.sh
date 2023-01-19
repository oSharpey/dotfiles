#!/bin/sh

updates=$(xbps-install -Sun 2> /dev/null | wc -l)

if [ -n "$updates" ] && [ "$updates" -gt 0 ]; then
	echo " updates: $updates "
else
	echo " updates: 0 "
fi
