FROM python:3.8.2-slim
MAINTAINER Doni Rubiagatra <rubiagatra@gmail.com>

ENV PROJECT_ROOT /usr/src/app
ENV PYTHONUNBUFFERED 1

RUN mkdir $PROJECT_ROOT
RUN apt-get update && apt-get install -y build-essential

ADD ./requirements.txt /opt/requirements.txt
COPY . $PROJECT_ROOT

RUN pip install -r /opt/requirements.txt --ignore-installed

WORKDIR $PROJECT_ROOT

EXPOSE 8051
ENTRYPOINT python index.py
