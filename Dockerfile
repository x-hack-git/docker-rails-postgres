FROM ruby:2.6.3
ENV LANG C.UTF-8 webpacker:install

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client && gem install bundler:2.1.4

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
