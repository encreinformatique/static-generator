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
    _destFile="./$_destination${_fileName/.php/.html}"
    # We add the header or an empty string in the file.
    # We could also and create the file.
    if [ "$_header" != "" ]; then
        php -dxdebug.mode=off "$_header" > "$_destFile"
    else
        php -dxdebug.mode=off "" > "$_destFile"
    fi

    php -dxdebug.mode=off "./$file" >> "$_destFile"

    if [ "$_footer" != "" ]; then
        php -dxdebug.mode=off "$_footer" >> "$_destFile"
    fi
done
