#!/usr/bin/env bash
sudo groupmod -o -g "$GID" user
sudo usermod -o -u "$UID" user

sudo chown user:user \
  '/home/.config/QQ/'

/usr/bin/qq --no-sandbox
