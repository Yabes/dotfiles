#!/usr/bin/env bash

terminal=${1:-xterm}
pid=$(xprop -id $(xdotool getwindowfocus) | grep _WM_PID | awk -F' = ' '{ print $2 }')
pname=$(ps -p ${pid} -o comm= | sed 's/-$//')

if [[ $pname == $terminal ]]; then
  ppid=$(pgrep --newest --parent ${pid})
  readlink /proc/${ppid}/cwd || echo $HOME
else
  echo $HOME
fi
