FROM ruby:2.7.5-alpine

RUN apk update && apk add bash build-base nodejs postgresql-dev tzdata

RUN mkdir /home/app \ 
&& chown $(id -un):$(id -gn) /home/app
WORKDIR /home/app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler --no-document
RUN bundle install --no-binstubs --jobs $(nproc) --retry 3

COPY . ./

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
