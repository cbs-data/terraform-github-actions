FROM alpine:3 

RUN ["/bin/sh", "-c", "apk add --update --no-cache bash ca-certificates curl git jq openssh"]

RUN ["bin/sh", "-c", "mkdir -p /src"]

# ADDS GOOGLE CLOUD CREDENTIALS FILE 
ENV GOOGLE_APPLICATION_CREDENTIALS /var/sec/gcp_cred.json
RUN ["bin/sh", "-c", " mkdir -p /var/sec && echo $GOOGLE_CREDENTIALS > /var/sec/gcp_cred.json"]

COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]
