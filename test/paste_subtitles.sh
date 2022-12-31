#!/bin/bash
# paste subtitles
#ffmpeg  -y -i "$INPATH"    -vf "subtitles=$SUBJAPATH:force_style='Fontsize=$FONTSIZE,Alignment=6, OutlineColour=&H80000000,BorderStyle=3,Outline=1,Shadow=0,MarginV=20'"  "$OUTJAPATH" 
#ffmpeg  -y -i "$OUTJAPATH" -vf "subtitles=$SUBRJPATH:force_style='Fontsize=$FONTSIZE,Alignment=10,OutlineColour=&H80000000,BorderStyle=3,Outline=1,Shadow=0,MarginV=20'" "$OUTRJPATH" 
#ffmpeg  -y -i "$OUTRJPATH" -vf "subtitles=$SUBENPATH:force_style='Fontsize=$FONTSIZE,Alignment=2, OutlineColour=&H80000000,BorderStyle=3,Outline=1,Shadow=0,MarginV=20'"  "$OUTPATH" 
ffmpeg  -y -i invideo.mp4 -vf "subtitles=en.vtt:force_style='Fontsize=28,Alignment=2, OutlineColour=&H80000000,BorderStyle=3,Outline=1,Shadow=0,MarginV=20'"  outvideo.mp4
