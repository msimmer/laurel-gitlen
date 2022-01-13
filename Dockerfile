FROM ruby:2.0.0

ENV BUNDLER_VERSION=1.3.0

# Install build deps
RUN apt-get update -q && apt-get install -qy \
  procps \
  curl \
  ca-certificates \
  gnupg2 \
  build-essential \
  libxml2-dev \
  libxslt-dev \
  libpq-dev \
  nodejs \
  postgresql \
  postgresql-contrib \
  --no-install-recommends \
  && apt-get clean


WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle check || bundle install

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]

