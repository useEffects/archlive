#!/bin/bash

rm -rf archlive-install-repos/*

# Navigate to pkgbuild directory
cd pkgbuild

# Loop through directories in pkgbuild
for package_dir in */; do
    if [ -f "$package_dir/PKGBUILD" ]; then
        # Build PKGBUILD
        cd "$package_dir"
        makepkg -s --noconfirm -f
        
        # Get the built package name
        package_name=$(basename $(ls *.pkg.tar.zst))
        
        # Copy package back to archlive-install-repos
        cp "$package_name" "../archlive-install-repos/"
        
        # Go back to pkgbuild directory
        cd ..
    fi
done

# Navigate back to archlive-install-repos
cd ../archlive-install-repos

# Update repository database
repo-add archlive-install-repos.db.tar.gz *.pkg.tar.zst

cd ..