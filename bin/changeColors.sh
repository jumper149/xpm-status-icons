#!/usr/bin/env bash

# This script will only work for files, that use the same color-encoding characters in the XPM as
# the ones in 'xpm-status-icons/icons'.

if [ -z "$1" ] ; then
    echo "Give configuration file as first argument. Template is: 'xpm-status-icons/bin/config/configColors.sh'"
    exit 1
fi
if [ -z "$2" ] ; then
    echo "Give file, that is to be changed, as second argument."
    exit 2
fi

CONFIG_FILE="$1"
FILE="$2"

source "${CONFIG_FILE}"

function sedCmd {
    color_char="$1"
    new_color="$2"
    old_regex="^\"${color_char} c #[a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]\",\$"
    new_regex="\"${color_char} c ${new_color}\","
    sed_command="s/${old_regex}/${new_regex}/"
    echo "${sed_command}"
}

set0="$(sedCmd "s" "${color0}")"
set8="$(sedCmd "S" "${color8}")"

set1="$(sedCmd "r" "${color1}")"
set9="$(sedCmd "R" "${color9}")"

set2="$(sedCmd "g" "${color2}")"
setA="$(sedCmd "G" "${colorA}")"

set3="$(sedCmd "y" "${color3}")"
setB="$(sedCmd "Y" "${colorB}")"

set4="$(sedCmd "b" "${color4}")"
setC="$(sedCmd "B" "${colorC}")"

set5="$(sedCmd "m" "${color5}")"
setD="$(sedCmd "M" "${colorD}")"

set6="$(sedCmd "c" "${color6}")"
setE="$(sedCmd "C" "${colorE}")"

set7="$(sedCmd "w" "${color7}")"
setF="$(sedCmd "W" "${colorF}")"

sed -i -e "${set0}" -e "${set8}" \
    -e "${set1}" -e "${set9}" \
    -e "${set2}" -e "${setA}" \
    -e "${set3}" -e "${setB}" \
    -e "${set4}" -e "${setC}" \
    -e "${set5}" -e "${setD}" \
    -e "${set6}" -e "${setE}" \
    -e "${set7}" -e "${setF}" \
    "${FILE}"
