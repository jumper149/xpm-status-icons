#!/usr/bin/env bash

MAIN_GIT_DIR="$(git rev-parse --show-toplevel)" 

if [[ "${MAIN_GIT_DIR}" != *"xpm-status-icons" ]] ; then
    echo "Abort to keep your home directory safe. :)"
    echo "Use this in the cloned git-repository or edit it yourself."
    echo "You can find the repository here: https://github.com/jumper149/xpm-status-icons"
    exit 1
fi

source "${MAIN_GIT_DIR}/bin/config/configIconDirs.sh"

echo "Clear products of previous instances of this script."
rm "${MAIN_GIT_DIR}/showcase.xpm" "${MAIN_GIT_DIR}/showcase.png"

echo "Create column of icons for each directory."
for directory in ${DIRS} ; do
    args=""
    full_path_dir="${MAIN_GIT_DIR}/icons/${directory}"
    for file in "${full_path_dir}/"* ; do
        args+=" ${file} -append"
    done
    convert ${args} "${full_path_dir}/column.xpm"
done

echo "Create row of the previously created columns."
args=""
for directory in ${DIRS} ; do
    full_path_dir="${MAIN_GIT_DIR}/icons/${directory}"
    args+=" ${full_path_dir}/column.xpm +append"
done
convert ${args} "${MAIN_GIT_DIR}/showcase.xpm"

echo "Clean up."
for directory in ${DIRS} ; do
    full_path_dir="${MAIN_GIT_DIR}/icons/${directory}"
    rm "${full_path_dir}/column.xpm"
done

echo "Transform white fills with transparency."
sed -i 's/white/None/g' "${MAIN_GIT_DIR}/showcase.xpm"

echo "Convert showcase to PNG."
convert "${MAIN_GIT_DIR}/showcase.xpm" "${MAIN_GIT_DIR}/showcase.png"
