FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundle
RUN bundle config --local build.sassc --disable-march-tune-native
RUN bundle install

COPY package.json /myapp/package.json
COPY yarn.lock /myapp/yarn.lock

RUN npm install -g yarn
RUN yarn install

COPY . /myapp

RUN rake assets:precompile

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8080"]
