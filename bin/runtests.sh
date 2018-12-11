#!/bin/bash
# Run all test that we can for Jenkins CI
# Should:
# 1) Setup npm and behat environments
# 2) Converted to using Zombie Driver (Node.js JavaScript Headless Browswer)

run_backstopjs_tests () {
  cd $YARNDIR
  $YARNCMD upgrade
  $YARNCMD backstop test
}

run_behat_tests() {
  cd $BEHATDIR
  $YARNCMD upgrade
  $COMPOSER upgrade
  $BEHATDIR/bin/behat -f pretty -o std -f junit -o xml
}

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
YARNDIR="$ROOTDIR/testing/backstopjs"
if [ -x "/usr/local/bin/yarn" ]; then
	YARNCMD="/usr/local/bin/yarn"
elif [ -x "/usr/bin/yarn" ]; then
	YARNCMD="/usr/bin/yarn"
else
	echo "No yarn found and can't run without.  Abort."
	exit 1
fi

if [ ! -d "$YARNDIR" ]; then
  echo "Hmmm, missing Backstop JS dir. Abort."
  exit 1
fi

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

if [ "x${1}" == "x" ]; then
  OPT="all"
else
  OPT="$1"
fi

case "$OPT" in
  behat)
    run_behat_tests
    ;;
  backstopjs)
    run_backstopjs_tests
    ;;
  all)
    run_behat_tests
    sleep 5
    run_backstopjs_tests
    ;;
  *)
    echo "Unknown option [$OPT] - stopping."
    echo "$0 [behat|backstopjs|all]"
    exit 1
    ;;
esac

exit 0
