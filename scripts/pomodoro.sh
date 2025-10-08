#!/bin/bash
set -e

# sourceable pomodoro command
pomodoro() {
    # convert seconds to minutes
    convert_seconds_to_minutes() {
      echo $(($1 / 60))
    }

    # convert minutes to seconds
    convert_minutes_to_seconds() {
      echo $(($1 * 60))
    }

    # print help
    echo_help() {
       # Display help
       echo "🍎 Pomodoro timer for the terminal."
       echo
       echo "Syntax: pomodoro [ OPTIONS ]"
       echo "options:"
       echo "   -s or --break [INTEGER]"
       echo "       length of breaks inverval in minutes"
       echo "   -w or --work [INTEGER]"
       echo "       length of work interval in minutes"
       echo "   -q or --quiet"
       echo "       do not show notifications"
       echo "   -h or --help"
       echo "       print help and exit"
       echo
    }

    # Default arguments
    WORK=$(convert_minutes_to_seconds 40)
    BREAK=$(convert_minutes_to_seconds 5)
    QUIET=false

    # Stats
    FOCUSED=0

    # Parse arguments
    for i in "$@"; do
      case $i in
        -h|--help)
          echo_help
          return;
          ;;
        -b|--break)
          if [[ $2 =~ ^-?[0-9]+$ ]]
          then
            BREAK=$(convert_minutes_to_seconds $2)
            shift # past argument
            shift # past value
          else
            echo_help
            return;
          fi
          ;;
        -w|--work)
          if [[ $2 =~ ^-?[0-9]+$ ]]
          then
            WORK=$(convert_minutes_to_seconds $2)
            shift # past argument
            shift # past value
          else
            echo_help
            return;
          fi
          ;;
        -q|--quiet)
          QUIET=true
          shift # past argument
          ;;
        -*|--*)
          echo "Unknown option $1"
          echo_help
          return;
          ;;
      esac
    done

    # show notification
    notify() {
        msg=$1
        secs=$2
        time=$(format $secs)
        osascript -e 'display notification "'"$msg\n$time"'" with title "Pomodoro" sound name "default"'
    }

    # format to hh:mm:ss format
    format() {
        secs=${1}
        hours=$((secs/3600))
        minutes=$((secs%3600/60))
        seconds=$((secs%60))
        printf "%02d:%02d:%02d" $hours $minutes $seconds
    }

    # start a countdown for x seconds
    countdown() {
      secs=$1
      shift
      msg=$@
      while [ $secs -gt 0 ]
      do
        t=$(format $secs)
        printf "\r\033[K$msg $t"
        ((secs--))
        sleep 1
      done
      echo
    }

    # single step pomodoro step (work / break interval)
    pomodoro_step() {
      if ! $QUIET; then
        notify "$1!" $2
      fi
      countdown $2 "$1:"
    }

    # main pomodoro loop (infinite)
    pomodoro_loop() {
        counter=1
        while true; do
            FOCUSED=$((FOCUSED++))
            echo "\nPomodoro #$((counter++)) ..."
            pomodoro_step "🏋️ Work" $WORK
            pomodoro_step "⏱️ Break" $BREAK
            done
    }

    echo "🍎 Pomodoro Timer"
    echo "Work: $(convert_seconds_to_minutes $WORK) minutes"
    echo "Break: $(convert_seconds_to_minutes $BREAK) minutes"

    pomodoro_loop

    osascript -e 'display notification "'You have been focused $(convert_seconds_to_minutes $FOCUSED)minutes'" with title "Pomodoro" sound name "default"'
}
