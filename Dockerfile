FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /payment-control
COPY Gemfile /payment-control/Gemfile
COPY Gemfile.lock /payment-control/Gemfile.lock
RUN bundle install
COPY . /payment-control


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]