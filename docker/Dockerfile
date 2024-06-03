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

COPY templates ~/.config/atcoder-cli-nodejs/
RUN acc config default-task-choice all

RUN git clone https://github.com/atcoder/ac-library.git ./ac-library
RUN git clone https://github.com/philip82148/cpp-dump.git ./cpp-dump

RUN echo 'alias g="g++ -std=c++20 -Wall -Wextra -Wshadow -Wfloat-equal -ftrapv -fsanitize=undefined,address -fno-omit-frame-pointer -fno-sanitize-recover -g -I /work/ac-library"' >> /home/${USERNAME}/.bashrc
RUN echo 'alias gd="g++ -DDEBUG -std=c++20 -Wall -Wextra -Wshadow -Wfloat-equal -ftrapv -fsanitize=undefined,address -fno-omit-frame-pointer -fno-sanitize-recover -g -I /work/ac-library"' >> /home/${USERNAME}/.bashrc

ENV TZ="Asia/Tokyo" \
    LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:en" 

WORKDIR /work