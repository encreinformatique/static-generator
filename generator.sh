#!/bin/bash
# Initialize config variables
_destination="$1"
_header="$2"
_footer="$3"

if [ "$_destination" == "" ]; then
    _destination="docs/"
fi

for file in content/*; do
    _fileName=$(basename "$file")
    # We add the header or an empty string in the file.
    # We could also and create the file.
    if [ "$_header" != "" ]; then
        php -dxdebug.mode=off "$_header" > "./$_destination${_fileName/.php/.html}"
    else
        php -dxdebug.mode=off "" > "./$_destination${_fileName/.php/.html}"
    fi

    php -dxdebug.mode=off "./$file" >> "./$_destination${_fileName/.php/.html}"

    if [ "$_footer" != "" ]; then
        php -dxdebug.mode=off "$_footer" >> "./$_destination${_fileName/.php/.html}"
    fi
done
