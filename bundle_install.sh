#!/bin/bash

cd $APP_HOME
echo $RAILS_ENV
if [ "$RAILS_ENV" = "production" ] ; then
  echo "Bundle for production"
  bundle install --deployment --without development:test
else
  echo "Bundle for development or test"
  bundle install --without production
fi
