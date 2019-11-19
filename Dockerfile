FROM ruby:2.6.0

RUN apt-get update -qq && apt-get install -y curl postgresql-client graphviz
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN gem install bundle mailcatcher

RUN mkdir /myapp
WORKDIR /myapp

# COPY Gemfile /myapp/Gemfile
# COPY Gemfile.lock /myapp/Gemfile.lock
# RUN bundle install

COPY . /myapp

EXPOSE 3000
EXPOSE 1080