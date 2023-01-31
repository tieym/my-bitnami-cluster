FROM bitnami/postgresql-repmgr:latest

COPY conf/ /opt/bitnami/scripts/



HEALTHCHECK --interval=5s CMD sh /opt/bitnami/scripts/healthcheck.sh || exit 1




