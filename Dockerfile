FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /TaxCalculator
WORKDIR /TaxCalculator
ADD Gemfile /TaxCalculator/Gemfile
ADD Gemfile.lock /TaxCalculator/Gemfile.lock
RUN bundle install

ADD . /TaxCalculator