FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
  httpie \
  cron \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

ADD names.txt /app
ADD post.sh /app

RUN crontab -l | { cat; echo "* */3 * * * /app/post.sh"; } | crontab -

CMD cron