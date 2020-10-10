#!/bin/sh

get_icon() {
    case $1 in
        # Icons for Font Awesome 5 Pro
        01d) icon="";;
        01n) icon="";;
        02d) icon="";;
        02n) icon="";;
        03d) icon="";;
        03n) icon="";;
        04*) icon="";;
        09*) icon="";;
        10d) icon=" ";;
        10n) icon=" ";;
        11*) icon="";;
        13*) icon="";;
        50*) icon="";;
        *) icon="";
    esac

    echo $icon
}

KEY="c8f6c7c7ec8e04238cfe03ae30469ba1"
CITY="Glasgow,United Kingdom"
UNITS="metric"
SYMBOL="°"

API="https://api.openweathermap.org/data/2.5"

if [ -n "$CITY" ]; then
    if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
        CITY_PARAM="id=$CITY"
    else
        CITY_PARAM="q=$CITY"
    fi

    weather=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
else
    location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        weather=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
    fi
fi

if [ -n "$weather" ]; then
    weather_desc=$(echo "$weather" | jq -r ".weather[0].description")
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    weather_icon=$(echo "$weather" | jq -r ".weather[0].icon")

    echo "%{T1}" "%{F#02c084}" "$(get_icon "$weather_icon")" "%{F-}" "$weather_desc", "$weather_temp$SYMBOL" "%{T-}"
fi
