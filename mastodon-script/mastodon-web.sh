#!/bin/bash

user="mastodon"
working_directory="/home/mastodon/live"
environment="RAILS_ENV=production PORT=3000"
exec_start="/home/mastodon/.rbenv/shims/bundle exec puma -C config/puma.rb"

sudo -i -u $user sh -c "cd $working_directory && $environment $exec_start"
