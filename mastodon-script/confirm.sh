#!/bin/bash

user="mastodon"
working_directory="/home/mastodon/live"
environment="RAILS_ENV=production"
exec_start="/home/mastodon/.rbenv/shims/bundle exec rails mastodon:confirm_email USER_EMAIL=$1"

sudo -i -u $user sh -c "cd $working_directory && $environment $exec_start"
