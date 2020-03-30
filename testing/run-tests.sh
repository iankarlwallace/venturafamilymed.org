#!/bin/bash
#
# Run both backstopjs and behat tests
#

CURDIR=$(pwd)
ROOTDIR=$(dirname $(realpath $0))
cd $ROOTDIR

cd $ROOTDIR/backstopjs
echo "Update to Backstop JS tests"
yarn upgrade

echo "Running Backstop JS tests"
yarn backstop test

cd $ROOTDIR/behat
echo "Update to Behat"
COMPOSER_MEMORY_LIMIT=-1
export COMPOSER_MEMORY_LIMIT
composer update
yarn upgrade

echo "Running Behat tests"
$ROOTDIR/behat/run-tests.sh

cd $CURDIR
