FROM debian:stretch

RUN apt-get update && apt-get install -y \
        ca-certificates \
        trafficserver \
	--no-install-recommends && rm -r /var/lib/apt/lists/*

COPY etc/plugin.config /etc/trafficserver/plugin.config
COPY etc/remap.config /etc/trafficserver/remap.config

RUN mkdir -p /var/run/trafficserver \
  && chmod 777 /var/run/trafficserver

ENV PROXY_CONFIG_SSL_CLIENT_CA_CERT_PATH="/etc/ssl/certs"
ENV PROXY_CONFIG_SSL_CLIENT_VERIFY_SERVER 1
ENV PROXY_CONFIG_URL_REMAP_REMAP_REQUIRED 0
ENV PROXY_CONFIG_REVERSE_PROXY_ENABLED 0

EXPOSE 8080

CMD ["traffic_cop", "-o"]
