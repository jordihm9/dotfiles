#!/usr/bin/env bash
set -e

function ffmpeg_lower() {
  local input=$1
  local output=$2

  if [[ -z $input ]]; then
    echo "Missing input"
    exit 1
  fi

  if [[ -z $output ]]; then
    echo "Missing output"
    exit 1
  fi

  ffmpeg -i $input -vcodec libx264 -b 800k -crf 24 $output
}
