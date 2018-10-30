#!/bin/bash
# Run all test that we can for Jenkins CI
# Should:
# 1) Setup npm and behat environments
# 2) Converted to using Zombie Driver (Node.js JavaScript Headless Browswer)

cd "$(dirname "$0")"
cd ..
ROOTDIR="$PWD"

# This script should live in the "bin" dir for the repo
if [ ! -d "$ROOTDIR/bin" ]; then
  echo "I appear to be confused on the directories ... bailing."
  exit 1
else
  echo "Running [$0] from [$ROOTDIR]."
fi

# Node.js first (easier)
YARNCMD="/usr/bin/yarn"
YARNDIR="$ROOTDIR/testing/backstopjs"
if [ ! -x "$YARNCMD" ]; then
  echo "No yarn cmd found. Abort."
  exit 1
fi

if [ ! -d "$YARNDIR" ]; then
  echo "Hmmm, missing Backstop JS dir. Abort."
  exit 1
fi

cd $YARNDIR
$YARNCMD upgrade
$YARNCMD backstop test

# Behat
BEHATDIR="$ROOTDIR/testing/behat"
COMPOSER="/usr/bin/composer"
if [[ ! -x "$COMPOSER" ]]; then
  echo "Missing composer! Can't test Behat."
  exit 1
fi

if [ ! -d "$BEHATDIR" ]; then
  echo "No Behat Testing Dir. Abort."
  exit 1
fi

cd $BEHATDIR
$YARNCMD upgrade
$COMPOSER upgrade
$BEHATDIR/bin/behat -f pretty -o std -f junit -o xml

exit 0
