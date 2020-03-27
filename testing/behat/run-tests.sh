#!/bin/bash
#
# Start google-chrome to run Mink Behat Scripts
#

ROOTDIR=$(dirname $(realpath $0))
CHROMECMD='/opt/google/chrome/chrome --disable-gpu --remote-debugging-address=0.0.0.0 --remote-debugging-port=9222 --window-size=1920,1080 --disable-extensions'

OPT=$1
if [ "$OPT" == "" ]
then
  OPT="headless"
fi

PID="none"
case "$1" in
  debug)
    $CHROMECMD > /dev/null 2>&1 &
    PID=$!
    ;;
  *)
    $CHROMECMD --headless > /dev/null 2>&1 &
    PID=$1
    ;;
esac

sleep 2

echo "Chrome running [$PID]."
$ROOTDIR/bin/behat
ps -p $PID > /dev/null
if [ "$?" = 0 ]
then
  echo "Cleaning up Chrome running [$PID]."
  kill $PID
else
  echo "ERROR: Couldn't find Chrome runing [$PID]"
fi
echo "Done."
