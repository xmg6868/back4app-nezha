FROM ghcr.io/nezhahq/nezha:v2.2.1

ENV PORT=8008

WORKDIR /opt/nezha

COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 8008

CMD ["/start.sh"]
