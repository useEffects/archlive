#!/bin/bash

# Remove files that do not end with .pkg.tar.zst
find . -type f ! -name "update.sh" ! -name "*.pkg.tar.zst" -delete

# Run repo-add command
repo-add archlive-install-repos.db.tar.gz ./*.pkg.tar.zst
