FROM ruby:2.7

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client libpq-dev

WORKDIR /var/www

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]