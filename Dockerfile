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

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

RUN echo "* */3 * * * root /app/post.sh /proc/1/fd/1 2>/proc/1/fd/2" >> /etc/crontab

ENTRYPOINT ["entrypoint.sh"]