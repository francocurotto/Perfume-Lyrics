#!/bin/bash

# CONSTANTS
YTLIST="youtube-list"

# download loop
while read -r line; do
    # get url
    readarray -d " " -t linearr <<< "$line"
    url=${linearr[0]}
    # get title
    TITLE=$(youtube-dl --get-title $url)
    # create folder
    DLDIR="downloaded/$TITLE"
    mkdir -p "$DLDIR"
    # download videos and subtitles
    #youtube-dl -o "$DLDIR/%(title)s.%(ext)s" -f "bestvideo[height<=720]+bestaudio/best[height<=720]" --write-sub --sub-lang en,en-GB,ja $url
    yt-dlp -o "$DLDIR/%(title)s.%(ext)s" -f "bestvideo[height<=720]+bestaudio/best[height<=720]" --write-sub --sub-lang en,en-GB-125blav4xII,ja $url
done <$YTLIST
