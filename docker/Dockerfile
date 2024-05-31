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

COPY setup_acc.sh .
RUN bash setup_acc.sh && rm -f setup_acc.sh

COPY setup_acl.sh .
RUN bash setup_acl.sh && rm -f setup_acl.sh

COPY setup_dump.sh .
RUN bash setup_dump.sh && rm -f setup_dump.sh

ENV TZ="Asia/Tokyo" \
    LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:en" 

ARG UID
ARG GID
ARG USERNAME
ARG GROUPNAME

RUN if getent passwd $UID ; then usermod -u 9999 $(getent passwd $UID | cut -d: -f1); fi
RUN groupadd -g ${GID} ${GROUPNAME} -f
RUN useradd -m -u ${UID} ${USERNAME} -g ${GID} -s /bin/bash
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER ${USERNAME}

ENV PATH="/usr/local/bin:${PATH}"
ENV PATH="/home/${USERNAME}/.local/bin:${PATH}"

WORKDIR /work

RUN echo 'alias g="g++ -std=c++20 -Wall -Wextra -Wshadow -Wfloat-equal -ftrapv -fsanitize=undefined,address -fno-omit-frame-pointer -fno-sanitize-recover -g -I /work/ac-library"' >> /home/${USERNAME}/.bashrc
RUN echo 'alias gd="g++ -DDEBUG -std=c++20 -Wall -Wextra -Wshadow -Wfloat-equal -ftrapv -fsanitize=undefined,address -fno-omit-frame-pointer -fno-sanitize-recover -g -I /work/ac-library"' >> /home/${USERNAME}/.bashrc
