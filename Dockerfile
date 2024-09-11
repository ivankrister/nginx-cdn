ARG ARCH

FROM ${ARCH}nginx:latest AS dist

# The environment variables for template.
ENV ORYX_SERVER=10.104.48.3:8081 \
    SRS_ALLOW_ORIGIN=https://example.com/
    ORYX_SSL_KEY=/data/config/nginx.key \
    ORYX_SSL_CRT=/data/config/nginx.crt \
    SRS_M3U8_EXPIRE=10 SRS_TS_EXPIRE=3600
ADD nginx.edge.https.conf.template /etc/nginx/templates/default.conf.template

# Create the proxy cache directory for NGINX.
RUN mkdir -p /data/nginx-cache
