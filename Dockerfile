FROM ruby:2.5.3-slim

RUN apt-get update -qq && \
  apt-get install -qq -y --no-install-recommends \
    apt-transport-https \
    build-essential \
    curl \
    gnupg2 \
    libpq-dev \
    wget && \
  rm -rf /var/lib/apt/lists/*
# nodejs
RUN wget -qO- https://deb.nodesource.com/setup_10.x | bash - && \
  apt-get install -y -qq --no-install-recommends nodejs && \
  rm -rf /var/lib/apt/lists/*
# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && apt-get install -y -qq --no-install-recommends yarn && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile      /usr/src/app/Gemfile
COPY Gemfile.lock /usr/src/app/Gemfile.lock

COPY package.json /usr/src/app/package.json
COPY yarn.lock    /usr/src/app/yarn.lock

RUN bundle install --jobs=4
RUN yarn install
COPY . /usr/src/app
