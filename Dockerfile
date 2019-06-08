FROM ruby:alpine
RUN echo "gem: --no-document" > ~/.gemrc
RUN gem install bundler -v 2
COPY Gemfile Gemfile.lock /app
WORKDIR /app
RUN bundle install
COPY app.rb /app
CMD ["bundle", "exec", "ruby", "app.rb"]
