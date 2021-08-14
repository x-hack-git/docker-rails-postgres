#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid
RAILS_ENV=production bundle exec rails db:migrate
RAILS_ENV=production bundle exec rails db:seed
bundle exec rails s -e production

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
