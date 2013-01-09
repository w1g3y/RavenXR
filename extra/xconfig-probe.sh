#!/bin/sh
#
# Copyright (c) 2005 Timothy Redaelli & Matteo Riondato & Dario Freni
#
# See COPYING for licence terms.
#
#
# $Id: xconfig-probe.sh,v 1.2 2005/12/09 21:50:15 drizzt Exp $

set -e -u

if [ -z "${LOGFILE:-}" ]; then
	echo "This script can't run standalone."
	echo "Please use launch.sh to execute it."
	exit 1
fi

mkdir -p $BASEDIR/usr/local/share/xconfig/ $BASEDIR/usr/local/etc/rc.d/ $BASEDIR/usr/local/sbin/

cp extra/xconfig-probe/xorg.conf.orig $BASEDIR/usr/local/share/xconfig/

install -C extra/xconfig-probe/xconfig-probe.sh $BASEDIR/usr/local/etc/rc.d/

# XXX Remember to trigger it on your login scripts or in rc.local
install -C extra/xconfig-probe/xkbdlayout.sh $BASEDIR/usr/local/sbin/
