#!/bin/bash
set -e

title="Awita time"
msg="Drink some water! 💦"

osascript -e "display notification \"$msg\" with title \"$title\""
