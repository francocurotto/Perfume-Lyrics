#!/bin/bash

# CONSTANTS
YTLIST="youtube-list"

# download loop
while read -r line; do
    # get url
    readarray -d " " -t linearr <<< "$line"
    url=${linearr[0]}
    # get title
    echo "Getting title for $url"
    TITLE=$(yt-dlp --get-title $url)
    # create folder
    DLDIR="downloaded/$TITLE"
    # check if folder exists
    if [ ! -d "$DLDIR" ]; then
        # create directory
        mkdir -p "$DLDIR"
        # download videos and subtitles
        yt-dlp -o "$DLDIR/%(title)s.%(ext)s" -f 22 --write-sub --sub-lang en,en-GB-125blav4xII,ja $url
    else
        echo "Skipping $DLDIR, already exists"
    fi
done <$YTLIST
