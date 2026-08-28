#!/bin/sh

set -e

VIDEO="/data/video.mp4"

if [ ! -f "$VIDEO" ]; then
    echo "ERROR: video.mp4 not found"
    exit 1
fi

echo "Starting YouTube loop stream..."

exec ffmpeg \
    -hide_banner \
    -loglevel info \
    -stream_loop -1 \
    -re \
    -i "$VIDEO" \
    -c:v libx264 \
    -preset veryfast \
    -b:v 4000k \
    -maxrate 4000k \
    -bufsize 8000k \
    -pix_fmt yuv420p \
    -r 30 \
    -g 60 \
    -c:a aac \
    -b:a 128k \
    -ar 44100 \
    -f flv \
    "${YOUTUBE_RTMP_URL}/${YOUTUBE_STREAM_KEY}"
