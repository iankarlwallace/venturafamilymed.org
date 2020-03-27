#!/bin/bash
#
# Run both backstopjs and behat tests
#

CURDIR=$(pwd)
ROOTDIR=$(dirname $(realpath $0))
cd $ROOTDIR

echo "Running backstop JS tests"
cd $ROOTDIR/backstopjs
yarn backstop test

cd $ROOTDIR
behat/run-tests.sh

cd $CURDIR
