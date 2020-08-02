#!/bin/bash

trap "exit" INT TERM ERR
trap "kill 0" EXIT

./build.ffserver.conf.sh

ffserver -hide_banner -loglevel ${FFSERVER_LOG_LEVEL} &
ffmpeg -hide_banner -loglevel ${FFMPEG_LOG_LEVEL} -rtsp_transport tcp ${FFMPEG_INPUT_OPTS} -i ${RTSP_URL} ${FFMPEG_OUTPUT_OPTS} http://127.0.0.1:$PORT/feed.ffm
