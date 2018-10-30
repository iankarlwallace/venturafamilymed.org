#!/bin/bash
#
# Simple script to restore the latest production backup from the akeeba-backups dir
# to test.venturafamilymed.org via kickstart (some browser involvement is needed ...)
#

HOMEDIR=/home/iankarlwallace
PRODSITE=www.venturafamilymed.org
TESTSITE=test.venturafamilymed.org
BKUPTIMESTAMP=`/bin/ls -1r /home/iankarlwallace/akeeba-backups/$PRODSITE/site-${PRODSITE}-*.jpa | /usr/bin/head -n 1 | cut -c 92-106`
AKEEBAVER="5-5-1"
KICKSTARTFILE="kickstart-core-${AKEEBAVER}-zip.zip"

# Remove files in testing dir ... but with restraint
if [ -d "$HOMEDIR/$TESTSITE" ]; then
	cd $HOMEDIR/$TESTSITE

	# Remove what's in the directory now
	for FILE in `/bin/ls -A1r .`
	do
		CURDIR=`/bin/pwd`
		echo "Working in directory [$CURDIR]"
		if [ "$CURDIR" = "$HOMEDIR/$TESTSITE" ]; then
			CURFILE=$FILE
			echo -n "Working on removing [$CURFILE]"
			if [ -f "$CURFILE" ]; then
				/bin/rm $CURFILE
				echo " removed."
			elif [ -d "$CURFILE" ]; then
				/bin/rm -r $CURFILE
				echo " removed."
			else
				echo " *** NOT file or dir - skipping ***"
			fi
		else
			echo "BAILING - [$CURDIR] not equal to [$HOMEDIR/$TESTSITE]"
			exit 1
		fi
	done

	# Copy the lates backup to the test dir
	/bin/cp $HOMEDIR/akeeba-backups/$PRODSITE/site-${PRODSITE}-${BKUPTIMESTAMP}.j* $HOMEDIR/$TESTSITE/.

	# Get a version of KickStart
	echo "Using Akeeba Backup Kickstart Version ${AKEEBAVER}"
	/usr/bin/wget https://www.akeebabackup.com/download/akeeba-kickstart/${AKEEBAVER}/${KICKSTARTFILE}
	/usr/bin/unzip ${KICKSTARTFILE}
	/bin/rm $HOMEDIR/$TESTSITE/${KICKSTARTFILE}

	/usr/bin/rsync -rPv $HOMEDIR/$PRODSITE/images $HOMEDIR/$TESTSITE/.
else
	echo "No testing dir at [$HOMEDIR/$TESTSITE]"
	exit 1
fi
