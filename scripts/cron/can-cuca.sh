#!/bin/bash
set -e

title="Can Cuca"
msg="Recorda demanar dinar! 🍝"

osascript -e "display notification \"$msg\" with title \"$title\""
