#!/bin/bash
set -e

for i in "$@"; do
   case $i in
      -t|--title)
         title=$2
         shift
         shift
         ;;
      -m|--message)
         msg=$2
         shift
         shift
         ;;
   esac
done

osascript -e "display notification \"$msg\" with title \"$title\""
