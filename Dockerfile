FROM ubuntu:14.04

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN sudo apt-get update && apt-get install -y \
  wget \
  curl \
  libcurl4-openssl-dev \
  unzip

RUN sudo apt-get install -y build-essential python-dev libffi-dev python-pip

RUN sudo apt-get update && apt-get install -y \
		postgresql-client libpq-dev \
		sqlite3 \
		gcc \
		git

ENV HOME /root
ENV PYENVPATH $HOME/.pyenv
ENV PATH $PYENVPATH/shims:$PYENVPATH/bin:$PATH

RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

RUN echo 'eval "$(pyenv init -)"' >  /root/.bashrc

RUN pyenv install 3.4.1 && pyenv global 3.4.1
