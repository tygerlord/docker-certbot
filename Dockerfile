FROM debian:buster-slim 

RUN mkdir -p /app/htdocs
WORKDIR /app

COPY entrypoint.sh .

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y --no-install-recommends certbot \
 && apt-get clean \
 && chmod +x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]

