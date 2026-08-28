FROM jrottenberg/ffmpeg:6-alpine

WORKDIR /app

COPY start.sh /app/start.sh

RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
