#!/bin/bash

# CONSTANTS
DLDIR="downloaded"

# clean loop
for d in "$DLDIR"/*; do
    # get basename
    BASENAME=$(basename "$d")
    echo -n "Cleanning $BASENAME..."
    # get subtitles paths
    SUBJAPATH="$d/$BASENAME.ja.vtt"
    SUBRJPATH="$d/$BASENAME.en-GB-125blav4xII.vtt"
    SUBENPATH="$d/$BASENAME.en.vtt"
    ### clean japanese subtitles
    # replace punctuation for proper line wrap
    sed -i "s/。/. /g" "$SUBJAPATH"
    sed -i "s/、/, /g" "$SUBJAPATH"
    sed -i "s/！/! /g" "$SUBJAPATH"

    ### clean romaji subtitles
    sed -i "s/’/'/g" "$SUBRJPATH"
    
    ### clean english subtitles
    # replace punctuation for proper ascii character
    sed -i "s/’/'/g" "$SUBENPATH"
    # remove non-ascii character from english
    perl -i -ne 'print if m{^[[:ascii:]]+$}' "$SUBENPATH"
    echo "done"
done
