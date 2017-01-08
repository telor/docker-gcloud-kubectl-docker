FROM docker:dind

RUN apk update && apk add wget bash python && rm -rf /var/cache/apk/* && \
    wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz --no-check-certificate && \
    tar zxvf google-cloud-sdk.tar.gz && \
    rm google-cloud-sdk.tar.gz && \
    ls -l && \
    ./google-cloud-sdk/install.sh --usage-reporting=true --path-update=true && \
    gcloud --quiet components update && \
    gcloud --quiet components install kubectl

ENV PATH $(pwd)/google-cloud-sdk/bin:$PATH
