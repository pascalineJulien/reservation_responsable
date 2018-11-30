FROM ruby:latest

RUN apt-get update -qq --fix-missing
RUN apt-get install -qq -y \
  build-essential \
  vim \
  git \
  default-libmysqlclient-dev  \
  mysql-client \
  apt-transport-https apt-utils

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for a JS runtime
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

# for yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn

ENV APP_HOME /srv/app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME


# Check to see if server.pid already exists. If so, delete it.
RUN test -f tmp/pids/server.pid && rm -f tmp/pids/server.pid; true

COPY Gemfile /srv/app/Gemfile
COPY Gemfile.lock /srv/app/Gemfile.lock
RUN bundle install

COPY ./docker/entrypoint.sh /
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


#COPY bundle_install.sh /
#RUN chmod a+x /bundle_install.sh
#RUN /bundle_install.sh

COPY . $APP_HOME


