#!/usr/bin/env bash

terminal=${1:-xterm}

if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
  pid=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.type=="con") | select(.focused==true).pid')
else
  pid=$(xprop -id $(xdotool getwindowfocus) | grep _WM_PID | awk -F' = ' '{ print $2 }')
fi

pname=$(ps -p ${pid} -o comm= | sed 's/-$//')

if [[ $pname == $terminal ]]; then
  ppid=$(pgrep --newest --parent ${pid})
  readlink /proc/${ppid}/cwd || echo $HOME
else
  echo $HOME
fi
