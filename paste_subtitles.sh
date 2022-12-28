#!/bin/bash

# CONSTANTS
DLDIR="downloaded"
SUBDIR="subtitled"
FONTSIZE="30"

# create subtitbled directory
mkdir -p "$SUBDIR"

# subtitle loop
for d in "$DLDIR"/*; do
    # get basename
    BASENAME=$(basename "$d")
    # get video path
    INPATH="$d/$BASENAME.mp4"
    # get subtitle paths
    SUBJAPATH="$d/$BASENAME.ja.vtt"
    SUBRJPATH="$d/$BASENAME.en-GB.vtt"
    SUBENPATH="$d/$BASENAME.en.vtt"
    SUBJAPATH=${SUBJAPATH//,/\\,} # escape commas
    SUBRJPATH=${SUBRJPATH//,/\\,} # escape commas
    SUBENPATH=${SUBENPATH//,/\\,} # escape commas
    # paste subtitles
    OUTJAPATH="$SUBDIR/$BASENAME-ja.mp4"
    OUTRJPATH="$SUBDIR/$BASENAME-rj.mp4"
    OUTPATH="$SUBDIR/$BASENAME.mp4"
    ffmpeg  -y -i "$INPATH"    -vf "subtitles=$SUBJAPATH:force_style='Fontsize=$FONTSIZE,Alignment=6, OutlineColour=&H80000000,BorderStyle=3,Outline=1,Shadow=0,MarginV=20'"  "$OUTJAPATH" 
    ffmpeg  -y -i "$OUTJAPATH" -vf "subtitles=$SUBRJPATH:force_style='Fontsize=$FONTSIZE,Alignment=10,OutlineColour=&H80000000,BorderStyle=3,Outline=1,Shadow=0,MarginV=20'" "$OUTRJPATH" 
    ffmpeg  -y -i "$OUTRJPATH" -vf "subtitles=$SUBENPATH:force_style='Fontsize=$FONTSIZE,Alignment=2, OutlineColour=&H80000000,BorderStyle=3,Outline=1,Shadow=0,MarginV=20'"  "$OUTPATH" 
    # remove intermediate files
    rm "$SUBDIR/$BASENAME-ja.mp4"
    rm "$SUBDIR/$BASENAME-rj.mp4"
done

