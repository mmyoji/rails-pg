FROM ruby:2.5.3

RUN apt-get update -qq && \
  apt-get install -qq -y --no-install-recommends \
    build-essential \
    libpq-dev \
    apt-transport-https \
    curl \
    wget
# nodejs
RUN wget -qO- https://deb.nodesource.com/setup_10.x | bash - && \
  apt-get install -y -qq --no-install-recommends nodejs
# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && apt-get install -y -qq --no-install-recommends yarn

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile      /usr/src/app/Gemfile
COPY Gemfile.lock /usr/src/app/Gemfile.lock

COPY package.json /usr/src/app/package.json
COPY yarn.lock    /usr/src/app/yarn.lock

RUN bundle install --jobs=4
RUN yarn install
COPY . /usr/src/app
