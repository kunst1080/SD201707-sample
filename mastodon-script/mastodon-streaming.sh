#!/bin/bash

user=mastodon
working_directory="/home/mastodon/live"
environment="NODE_ENV=production PORT=4000"
exec_start="/usr/bin/npm run start"

sudo -i -u $user sh -c "cd $working_directory && $environment $exec_start"
