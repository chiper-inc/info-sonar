FROM alpine:3.8 as build
WORKDIR /app
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh
ARG jenkinschiper
ARG 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
RUN ls
# FROM python:latest
ENV PYTHONUNBUFFERED=1
ENV GOOGLE_APPLICATION_CREDENTIALS=./key.json
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN pip install --upgrade google-api-python-client
RUN pip install google-cloud-bigquery
COPY . .
RUN pip --no-cache-dir install PyYAML
ENV GOOGLE_APPLICATION_CREDENTIALS=./key.json