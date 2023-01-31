FROM bitnami/pgpool


COPY scripts/ /opt/bitnami/scripts/
COPY conf/ opt/bitnami/pgpool/etc/

HEALTHCHECK --interval=5s CMD bash /opt/bitnami/scripts/healthcheck.sh || exit 1


#switch to user root to run update
USER root

# update and get right bash version
RUN apt -y update && \
    apt install -y bash && \
    apt install -y curl

#switch to user 1001 (the default user in the bitnami pgpool container)
USER 1001

COPY libpgpool.sh opt/bitnami/scripts/