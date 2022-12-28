#!/bin/bash
# nc-customizer by CrazyblocksTechnologies Computer Laboratories

echo "Make sure this script is ran in the Nextcloud directory"
echo "Current working directory $PWD"
echo "Continue? [n]:"
read con

if [ "$con" = "y" ];
then
    echo "Running..."
else
    exit
fi

# Removals: Not needed, annoyances, etc.
rm -rf ./tests
rm -rf ./core/vendor/zxcvbn
rm -rf ./core/vendor/.gitignore
rm -rf ./.devcontainer
rm -rf ./3rdparty/microsoft
rm -rf ./3rdparty/aws

# File modifications: Telemetry prevention
find ./lib/private/Support/CrashReport -type f -print0 | xargs -0 sed -i 's/owncloud.org/0.0.0.0/g'
find ./lib/public/Support/CrashReport -type f -print0 | xargs -0 sed -i 's/owncloud.org/0.0.0.0/g'
find ./lib/private/Support/CrashReport -type f -print0 | xargs -0 sed -i 's/owncloud.com/0.0.0.0/g'
find ./lib/public/Support/CrashReport -type f -print0 | xargs -0 sed -i 's/owncloud.com/0.0.0.0/g'
find ./lib/private/Support/CrashReport -type f -print0 | xargs -0 sed -i 's/nextcloud.com/0.0.0.0/g'
find ./lib/public/Support/CrashReport -type f -print0 | xargs -0 sed -i 's/nextcloud.com/0.0.0.0/g'
find ./lib/private/Support/CrashReport -type f -print0 | xargs -0 sed -i 's/nextcloud.org/0.0.0.0/g'
find ./lib/public/Support/CrashReport -type f -print0 | xargs -0 sed -i 's/nextcloud.org/0.0.0.0/g'
