FROM ruby:2.6.3
ENV LANG C.UTF-8

RUN apt-get update -qq && \
apt-get install -y nodejs postgresql-client npm build-essential curl apt-transport-https wget && \
gem install bundler:2.1.4

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install yarn

WORKDIR /app
RUN mkdir -p tmp/pids
RUN mkdir -p tmp/sockets

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
