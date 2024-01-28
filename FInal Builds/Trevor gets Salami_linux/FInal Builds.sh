#!/bin/sh
echo -ne '\033c\033]0;Trevor-gets-salami\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/FInal Builds.x86_64" "$@"
