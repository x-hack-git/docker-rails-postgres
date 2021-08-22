#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

echo "LAUNCH IN PRODUCTION MODE"

bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed

bundle exec rails s -p 3000 -b '0.0.0.0' --environment production

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"