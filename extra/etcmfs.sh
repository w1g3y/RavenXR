#!/bin/sh
#
# Copyright (c) 2005 Dario Freni
#
# See COPYING for licence terms.
#
# $FreeBSD$
# $Id: etcmfs.sh,v 1.3 2005/12/01 00:14:23 saturnero Exp $

set -e -u

if [ -z "${LOGFILE:-}" ]; then
    echo "This script can't run standalone."
    echo "Please use launch.sh to execute it."
    exit 1
fi

TMPFILE=$(mktemp -t etcmfs)

echo "Adding init script for /etc mfs"

cp ${LOCALDIR}/extra/etcmfs/etcmfs.rc ${BASEDIR}/etc/rc.d/etcmfs
chmod 555 ${BASEDIR}/etc/rc.d/etcmfs

echo "Saving mtree structure for /etc"

mtree -Pcp ${BASEDIR}/etc > ${TMPFILE}
mv ${TMPFILE} ${BASEDIR}/etc/mtree/etc.dist

if [ -d ${BASEDIR}/usr/local/etc ]; then
    mtree -Pcp ${BASEDIR}/usr/local/etc > ${TMPFILE}
    mv ${TMPFILE} ${BASEDIR}/etc/mtree/localetc.dist
fi