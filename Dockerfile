FROM ruby:3.3

ENV APP_ROOT=/app

WORKDIR $APP_ROOT

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends build-essential libsqlite3-dev nodejs && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile
COPY bin/docker-entrypoint /usr/local/bin/docker-entrypoint

RUN bundle install

COPY . .

EXPOSE 3000

ENTRYPOINT ["docker-entrypoint"]

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
