#!/bin/bash
set -e

case "$1" in
  'rspec') echo 'bundle exec rspec'
    mkdir -p tmp/pids && bundle exec rake db:test:prepare && bundle exec rspec
    ;;
  'console') echo 'bundle exec rails console'
    bundle exec rails console
    ;;
  'migrate') echo 'bundle exec rake db:migrate'
    bundle exec rake db:migrate
    ;;
  'guard') echo 'bundle exec rake db:create && bundle exec rake db:schema:load && bundle exec guard'
    bundle exec rake db:create && bundle exec rake db:schema:load && bundle exec guard
    ;;
  *) exec "$@"
    ;;
esac

