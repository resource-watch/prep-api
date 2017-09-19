FROM ruby:2.4.1
MAINTAINER David Inga <david.inga@vizzuality.com>

ARG secretKey
ENV SECRET_KEY_BASE $secretKey
ENV NAME prep-manager

# Install dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install -y nodejs \
    && mkdir -p /usr/src/$NAME

# Create app directory
WORKDIR /usr/src/$NAME

# Install app dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 20 --retry 5 --without development test

# Set Rails to run in production
ENV RAILS_ENV production
ENV RACK_ENV production

# Bundle app source
COPY . ./

EXPOSE 3000

# Start puma
CMD bundle exec rake tmp:clear && bundle exec puma -C config/puma.rb
