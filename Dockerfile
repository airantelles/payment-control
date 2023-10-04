FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /teste-ruby-airan
COPY Gemfile /teste-ruby-airan/Gemfile
COPY Gemfile.lock /teste-ruby-airan/Gemfile.lock
RUN bundle install
COPY . /teste-ruby-airan


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]