FROM ruby:2.6.0

RUN apt-get update -qq && apt-get install -y curl postgresql-client graphviz
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN gem install bundle mailcatcher
RUN gem install rails -v 5.2.3

RUN mkdir /desafio_petbooking
WORKDIR /desafio_petbooking

COPY Gemfile /desafio_petbooking/Gemfile
COPY Gemfile.lock /desafio_petbooking/Gemfile.lock
RUN bundle install

COPY . /desafio_petbooking

EXPOSE 3000
EXPOSE 1080