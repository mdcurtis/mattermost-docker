#!/bin/bash

mkdir -p /volumes/db/var/lib/postgresl/data /volumes/app/mattermost/{config,data,logs,plugins,client-plugins} /volumes/web/cert

chown -R 2000:2000 /volumes/app/mattermost
chown -R 101:101 /volumes/web/cert
