#!/bin/bash
# Deploy the public_html dir to the test or www environments
#
# Initially just check and tell me what would be done

DOMAINROOT=venturafamilymed.org

case $1 in
  test)     TARGETDIR=test.$DOMAINROOT
            ;;
  www)      TARGETDIR=www.$DOMAINROOT
            ;;
  *)
            echo "Please specify test or www for the environment."
            exit 1
            ;;
esac

echo "Working on env [$TARGETDIR]."

# Check that environment directory exists
if [ ! -d "$HOME/$TARGETDIR" ]; then
  echo "Directory [$HOME/$TARGETDIR] does not exist."
  exit 1
fi

if [ ! -d "$HOME/$DOMAINROOT" ]; then
  echo "Directory [$HOME/$DOMAINROOT] does not exist."
fi

# Source is $HOME/$DOMAINROOT while target is $HOME/$TARGETDIR
# Use rsync to tell us what would be copied if anything is needed
# for now its only a dry run, use partial and progress as well
/usr/bin/rsync -avP -n $HOME/$DOMAINROOT/public_html/templates/protostar/css/user.css $HOME/$TARGETDIR/.
