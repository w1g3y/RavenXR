#!/bin/sh
#
# Copyright (c) 2005 Matteo Riondato
#
# See COPYING for licence terms.
#
#
# $Id: swapfind.sh,v 1.3 2006/12/08 11:05:42 rionda Exp $

set -e -u

if [ -z "${LOGFILE:-}" ]; then
	echo "This script can't run standalone."
	echo "Please use launch.sh to execute it."
	exit 1
fi

cp extra/swapfind/swapfind.sh $BASEDIR/etc/rc.d/swapfind
chmod 555 $BASEDIR/etc/rc.d/swapfind

