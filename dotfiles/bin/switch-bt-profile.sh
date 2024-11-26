#!/usr/bin/env bash

SINK=$(pacmd list-sinks | grep bluez_sink | sed 's/.*<\(.*\)>.*/\1/')
PROFILE=$(echo "${SINK}" | awk -F. '{ print $3 }')

CARD=$(pacmd list-sinks | grep bluez_card | sed 's/.*<\(.*\)>.*/\1/')

case "$1" in
    status)
        echo "${PROFILE}"
        ;;

    reconnect)
        bluetoothctl disconnect 14:3F:A6:60:49:B3
        sleep 1
        bluetoothctl connect 14:3F:A6:60:49:B3
        ;;

    switch)
        case "${PROFILE}" in
            a2dp_sink)
                pactl set-card-profile ${CARD} headset_head_unit
                pacmd set-default-sink $(echo "${SINK}" | sed "s/a2dp_sink/headset_head_unit/")
                ;;

            headset_head_unit)
                pactl set-card-profile ${CARD} a2dp_sink
                pacmd set-default-sink $(echo "${SINK}" | sed "s/headset_head_unit/a2dp_sink/")
                ;;
        esac
        ;;
esac

