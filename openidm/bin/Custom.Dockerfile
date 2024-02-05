#
# Copyright 2020 ForgeRock AS. All Rights Reserved
#

# Build custom IDM Docker image:
# 1. Extract OpenIDM ZIP archive
# 2. cd /path/to/openidm
# 3. docker build -f bin/Custom.Dockerfile -t idm:latest .

FROM docker.io/aaronwang0509/java-11:7.3.0

# ttf-dejavu font needed by Flowable workflow engine
RUN apt-get update && \
    apt-get install -y ttf-dejavu

COPY --chown=forgerock:root . /opt/openidm

WORKDIR /opt/openidm

EXPOSE 8080

USER 11111

ENTRYPOINT ["/opt/openidm/bin/docker-entrypoint.sh", "openidm"]