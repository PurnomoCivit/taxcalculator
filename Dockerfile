FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /TaxCalculator
WORKDIR /TaxCalculator
COPY Gemfile /TaxCalculator/Gemfile
COPY Gemfile.lock /TaxCalculator/Gemfile.lock
RUN bundle install
COPY . /TaxCalculator
