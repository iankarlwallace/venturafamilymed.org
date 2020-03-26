#!/bin/bash
#
# Start google-chrome to run Mink Behat Scripts
#

#/opt/google/chrome/chrome --disable-gpu --headless --remote-debugging-address=0.0.0.0 --remote-debugging-port=9222 --window-size="1920,1080" --disable-extensions
/opt/google/chrome/chrome --disable-gpu --remote-debugging-address=0.0.0.0 --remote-debugging-port=9222 --window-size="1920,1080" --disable-extensions
