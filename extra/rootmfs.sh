#!/bin/sh
#
# Copyright (c) 2005 Dario Freni
#
# See COPYING for licence terms.
#
# $FreeBSD$
# $Id: rootmfs.sh,v 1.1 2005/10/03 18:37:50 saturnero Exp $

set -e -u

if [ -z "${LOGFILE:-}" ]; then
    echo "This script can't run standalone."
    echo "Please use launch.sh to execute it."
    exit 1
fi

TMPFILE=$(mktemp -t rootmfs)

echo "Adding init script for /root mfs"

cp ${LOCALDIR}/extra/rootmfs/rootmfs.rc ${BASEDIR}/etc/rc.d/rootmfs
chmod 555 ${BASEDIR}/etc/rc.d/rootmfs

echo "Saving mtree structure for /root"

mtree -Pcp ${BASEDIR}/root > ${TMPFILE}
mv ${TMPFILE} ${BASEDIR}/etc/mtree/root.dist
