FROM ruby:2.5.1

RUN apt-get update && \
    apt-get install -y nodejs \
                       vim \
                       mysql-client \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /TaxCalculator
WORKDIR /TaxCalculator
COPY Gemfile /TaxCalculator/Gemfile
COPY Gemfile.lock /TaxCalculator/Gemfile.lock
RUN bundle install

ENV APP_ROOT /workspace
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
COPY . /TaxCalculator

EXPOSE  3000
CMD ["rails", "server", "-b", "0.0.0.0"]