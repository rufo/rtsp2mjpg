FROM alpine:3.8
RUN apk add curl bash ffmpeg && \
    rm -rf /var/cache/apk/*
COPY stream.sh /usr/bin/stream.sh
COPY build.ffserver.conf.sh /usr/bin/build.ffserver.conf.sh
RUN chmod +x /usr/bin/stream.sh
RUN chmod +x /usr/bin/build.ffserver.conf.sh
RUN PORT=5000 /usr/bin/build.ffserver.conf.sh
ENV RTSP_URL rtsp://192.168.222.170:8554/unicast
ENV FFMPEG_INPUT_OPTS  ""
ENV FFMPEG_OUTPUT_OPTS  ""
ENV FFSERVER_LOG_LEVEL "error"
ENV FFMPEG_LOG_LEVEL  "warning"
ENTRYPOINT stream.sh
