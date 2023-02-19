FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
  httpie \
  cron \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

COPY names.txt .
COPY post.sh .
RUN chmod +x post.sh

RUN crontab -l | { cat; echo "* */3 * * * /app/post.sh"; } | crontab -

ENTRYPOINT ["cron", "-f"]