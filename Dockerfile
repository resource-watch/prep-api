FROM ruby:2.4.1-alpine
MAINTAINER David Inga <david.inga@vizzuality.com>

ARG secretKey

ENV RAILS_ENV production
ENV RACK_ENV production
ENV SECRET_KEY_BASE $secretKey
ENV RW_API_URL https://api.resourcewatch.org
ENV APIGATEWAY_URL https://production-api.globalforestwatch.org

# Install dependencies
RUN apk update && \
    apk upgrade && \
    apk add --update --no-cache \
      build-base \
      bash \
      git \
      nodejs \
      tzdata \
      libxml2-dev \
      libxslt-dev \
      postgresql-dev \
      imagemagick-dev \
    && rm -rf /var/cache/apk/* \
    && gem install bundler --no-ri --no-rdoc \
    && mkdir -p /usr/src/app

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 20 --retry 5 --without development test

# Bundle app source
ADD . /usr/src/app

EXPOSE 3000
ENTRYPOINT ["./entrypoint.sh"]
