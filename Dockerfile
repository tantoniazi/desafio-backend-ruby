FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs  libgmp3-dev postgresql-client ruby-dev
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app
RUN rm -frv /app/tmp/pids/*
RUN bundle exec rake db:drop
RUN bundle exec rake db:create
RUN bundle exec rake db:migrate
RUN bundle exec rake db:migrate RAILS_ENV=test
RUN bundle exec rake db:populate
RUN bundle exec rake db:populate RAILS_ENV=test