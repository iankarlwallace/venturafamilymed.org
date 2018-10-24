#!/bin/bash
# Run all test that we can for Jenkins CI
# Should:
# 1) Setup npm and behat environments
# 2) Needs to run chrome as headless prior to Behat scripts
# 3) Exit cleanly with status code of zero if successful

ROOTDIR="$PWD"

# Node.js first (easier)
YARNCMD="/usr/bin/yarn"
YARNDIR="$ROOTDIR/backstopjs"
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
BEHATDIR="$ROOTDIR/testing"
COMPOSER="/usr/bin/composer"
CHROME="/usr/bin/google-chrome"
CHROMEOPTS="--disable-gpu --headless --remote-debugging-address=0.0.0.0 --remote-debugging-port=9222 --window-size=1920,1080 --disable-extensions"
if [[ ! -x "$CHROME" || ! -x "$COMPOSER" ]]; then
  echo "Missing composer or google-chrome?  Can't test Behat then."
  exit 1
fi

if [ ! -d "$BEHATDIR" ]; then
  echo "No Behat Testing Dir. Abort."
  exit 1
fi

cd $BEHATDIR
$COMPOSER install
/usr/bin/nohup $CHROME $CHROMEOPTS > /dev/null 2>&1 &
CHROMEPID=$!
echo "Chrome headless running at [$CHROMEPID]"
/usr/bin/sleep 5
$BEHATDIR/bin/behat -f pretty -o std -f junit -o xml
/usr/bin/kill -9 $CHROMEPID > /dev/null 2>&1
echo "Chrome headless stoppd on [$CHROMEPID]"
/usr/bin/sleep 5

exit 0
