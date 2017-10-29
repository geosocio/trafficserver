FROM debian:stretch

RUN apt-get update && apt-get install -y \
        trafficserver \
	--no-install-recommends && rm -r /var/lib/apt/lists/*

EXPOSE 80 443

RUN mkdir -p /var/run/trafficserver \
  && chmod 777 /var/run/trafficserver

CMD ["traffic_cop", "-o"]
