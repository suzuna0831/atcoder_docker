FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y \
    python3-pip \
    nodejs \
    npm \
    build-essential \
    locales \
    tzdata \
    sudo \
    git \
    vim

COPY requirements.txt .
RUN pip3 install --break-system-packages -r requirements.txt && \
    rm -rf ~/.cache/pip && \
    rm -f requirements.txt

RUN npm install -g atcoder-cli

COPY templates /root/.config/atcoder-cli-nodejs
RUN acc config default-task-choice all

RUN git clone https://github.com/atcoder/ac-library.git /lib/ac-library
RUN git clone https://github.com/philip82148/cpp-dump.git /lib/cpp-dump

RUN echo 'alias g="g++ -std=c++20 -Wall -Wextra -Wshadow -Wfloat-equal -ftrapv -fsanitize=undefined,address -fno-omit-frame-pointer -fno-sanitize-recover -g -I /lib/ac-library"' >> ~/.bashrc
RUN echo 'alias gd="g++ -DDEBUG -std=c++20 -Wall -Wextra -Wshadow -Wfloat-equal -ftrapv -fsanitize=undefined,address -fno-omit-frame-pointer -fno-sanitize-recover -g -I /lib/ac-library"' >> ~/.bashrc

ENV TZ="Asia/Tokyo"

WORKDIR /work