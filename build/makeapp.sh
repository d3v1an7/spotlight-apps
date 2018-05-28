#!/bin/bash

set -e

find include -name '*.sh' -exec sh -c '
  filepath="$1"
  filename="${filepath##*/}"
  file="${filename%.*}"
  source "${filepath%.sh}.cfg"
  # Remove app from this dir if it exists
  [ -e "${name}.app" ] && rm -R "${name}.app"
  ./lib/appify.sh \
    --script "${filepath}" \
    --name "${name}" \
    --icons "icon/${file}.icns"
  # Remove app from /Applications dir if it exists, and we want to overwrite
  if [ -e "/Applications/${name}.app" ]; then
    echo "/Applications/${name}.app already exists. Do you want to replace it?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) rm -R "/Applications/${name}.app"; break;;
            No ) rm -R "${name}.app"; exit;;
        esac
    done
  fi
  mv "${name}.app" "/Applications/${name}.app"
' sh {} \;
