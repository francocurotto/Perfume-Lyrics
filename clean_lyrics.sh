#!/bin/bash

# CONSTANTS
DLDIR="downloaded"

# clean loop
for d in "$DLDIR"/*; do
    # get basename
    BASENAME=$(basename "$d")
    # get subtitles paths
    SUBJAPATH="$d/$BASENAME.ja.vtt"
    SUBRJPATH="$d/$BASENAME.en-GB-125blav4xII.vtt"
    SUBENPATH="$d/$BASENAME.en.vtt"
    ### clean japanese subtitles
    # replace punctuation for proper line wrap
    sed -i "s/。/. /g" "$SUBJAPATH"
    sed -i "s/、/, /g" "$SUBJAPATH"
    sed -i "s/！/! /g" "$SUBJAPATH"
    ### clean english subtitles
    # remove non-ascii character from english
    perl -i -ne 'print if m{^[[:ascii:]]+$}' "$SUBENPATH"
done
