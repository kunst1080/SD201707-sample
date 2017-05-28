#!/bin/bash

user=mastodon
working_directory=/home/mastodon/live
environment="RAILS_ENV=production DB_POOL=5"
exec_start="/home/mastodon/.rbenv/shims/bundle exec sidekiq -c 5 -q default -q mailers -q pull -q push"

sudo -i -u $user sh -c "cd $working_directory && $environment $exec_start"
