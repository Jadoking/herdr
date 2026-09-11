#!/bin/sh
set -eu

herdr plugin install ntindle/herdr-resurrect \
  --ref 5afa6755d4f35c62c7522ba4fd04922d1ac69602 --yes

# v0.5.0; builds locally and requires Go 1.24+.
herdr plugin install kryptamine/herdr-auto-title \
  --ref d951862d7c78f24957673dc106572e0ed94e4068 --yes

# v0.36.2
herdr plugin install persiyanov/herdr-reviewr \
  --ref 4c090225af706bf3aaa24b39fea890a72994f40f --yes
