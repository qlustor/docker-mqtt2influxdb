FROM python:3.9
LABEL maintainer="Team QLUSTOR <team@qlustor.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN true &&\
\
# Install Python packages
pip3 install --upgrade mqtt2influxdb

# Final setup & execution
ADD . /app
WORKDIR /app
VOLUME /etc/hardwario
ENTRYPOINT ["/bin/sh", "/app/entrypoint.sh"]
CMD ["-c /etc/hardwario/mqtt2influxdb.yml"]
