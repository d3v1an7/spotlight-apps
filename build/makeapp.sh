#!/bin/bash

set -e

find include -name '*.sh' -exec sh -c '
  cleanup() { [ -e "$1" ] && rm -R "$1"; }
  filepath="$1"
  filename="${filepath##*/}"
  file="${filename%.*}"
  source "${filepath%.sh}.cfg"
  # Remove app from this dir if it exists
  cleanup "${name}.app"
  cleanup "app/${name}.app"
  ./lib/appify.sh \
    --script "${filepath}" \
    --name "${name}" \
    --icons "icon/${file}.icns"
  cp -r "${name}.app" "app/${name}.app"
  # Remove app from /Applications dir if it exists, and we want to overwrite
  if [ -e "/Applications/${name}.app" ]; then
    echo "/Applications/${name}.app already exists. Do you want to replace it?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) cleanup "/Applications/${name}.app"; break;;
            No ) cleanup "${name}.app"; exit;;
        esac
    done
  fi
  mv "${name}.app" "/Applications/${name}.app"
' sh {} \;
