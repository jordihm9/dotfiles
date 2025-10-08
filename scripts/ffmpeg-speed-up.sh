#!/bin/bash
set -e

function ffmpeg_speed_up() {
  local input=$1
  local output=$2
  local speed=$3

  if [[ -z $input ]]; then
    echo "Missing input"
    exit 1
  fi

  if [[ -z $output ]]; then
    echo "Missing output"
    exit 1
  fi

  if [[ -z $speed ]]; then
    echo "Missing speed"
    exit 1
  fi

  ffmpeg -i $input -filter:v "setpts=${speed}*PTS" -an $output
}
