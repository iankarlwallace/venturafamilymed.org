#!/bin/bash
#
# Run both backstopjs and behat tests
#

CURDIR=$(pwd)
ROOTDIR=$(dirname $(realpath $0))
cd $ROOTDIR

cd $ROOTDIR/backstopjs
echo "Yarn install dependencies to Backstop JS tests"
yarn --force --frozen-lockfile

echo "Running Backstop JS tests"
yarn backstop test

cd $ROOTDIR/behat
echo "Update to Behat"
COMPOSER_MEMORY_LIMIT=-1
export COMPOSER_MEMORY_LIMIT
composer update
yarn --force --frozen-lockfile

echo "Running Behat tests"
$ROOTDIR/behat/run-tests.sh

cd $CURDIR
