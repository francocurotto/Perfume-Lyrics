#!/bin/bash
# paste subtitles
ffmpeg  -y -i invideo.mp4   -vf "subtitles=ja.vtt:force_style='Fontsize=28,Alignment=6, OutlineColour=&H80000000,BorderStyle=4,BackColour=&H80000000,Outline=0,Shadow=0'"  outvideo.mp4
ffmpeg  -y -i outvideo.mp4  -vf "subtitles=rj.vtt:force_style='Fontsize=28,Alignment=10,OutlineColour=&H80000000,BorderStyle=4,BackColour=&H80000000,Outline=0,Shadow=0'"  outvideo2.mp4
ffmpeg  -y -i outvideo2.mp4 -vf "subtitles=en.vtt:force_style='Fontsize=28,Alignment=2, OutlineColour=&H80000000,BorderStyle=4,BackColour=&H80000000,Outline=0,Shadow=0'"  outvideo3.mp4
