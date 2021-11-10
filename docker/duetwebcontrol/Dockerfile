## Build DuetWebControl
FROM --platform=$BUILDPLATFORM node:16 as build-dwc

ARG REPO=https://github.com/Duet3D/DuetWebControl
ARG VERSION=master

RUN git clone ${REPO} /opt/DuetWebControl \
 && cd /opt/DuetWebControl \
 && git checkout ${VERSION}

WORKDIR /opt/DuetWebControl
RUN npm install \
 && npm run build \
 && find dist/ -iname *.gz -exec rm {} \; \
 && rm dist/*.zip

## Setup dwc2-for-klipper-socket
FROM python:3 as build-dfks

ARG DFKS_REPO=https://github.com/Stephan3/dwc2-for-klipper-socket
ARG DFKS_VERSION=master

WORKDIR /opt

RUN git clone ${DFKS_REPO} dwc2-for-klipper-socket \
 && cd dwc2-for-klipper-socket \
 && git checkout ${DFKS_VERSION}

RUN python -m venv venv \
 && venv/bin/pip install tornado

## Runtime Image
FROM python:3-slim as run

WORKDIR /opt
COPY --from=build-dwc /opt/DuetWebControl/dist ./DuetWebControl
COPY --from=build-dfks /opt/dwc2-for-klipper-socket ./dwc2-for-klipper-socket
COPY --from=build-dfks /opt/venv ./venv

RUN mkdir run cfg gcode
RUN groupadd dwc --gid 1000 \
 && useradd dwc --uid 1000 --gid dwc \
 && chown -R dwc:dwc /opt/*

USER dwc
VOLUME ["/opt/run", "/opt/cfg", "/opt/gcode"]
ENTRYPOINT ["/opt/venv/bin/python", "dwc2-for-klipper-socket/web_dwc2.py"]
CMD ["-c", "cfg/dwc2.cfg"]