#!/bin/sh
#
# Copyright (c) 2005 Dario Freni
#
# See COPYING for licence terms.
#
# $FreeBSD$
# $Id: varmfs.sh,v 1.2 2006/04/24 11:14:33 rionda Exp $

set -e -u

if [ -z "${LOGFILE:-}" ]; then
    echo "This script can't run standalone."
    echo "Please use launch.sh to execute it."
    exit 1
fi

TMPFILE=$(mktemp -t varmfs)

echo "Adding init script for /var mfs"

cp ${LOCALDIR}/extra/varmfs/varmfs.rc ${BASEDIR}/etc/rc.d/varmfs
chmod 555 ${BASEDIR}/etc/rc.d/varmfs

echo "Saving mtree structure for /var"

mtree -Pcp ${BASEDIR}/var > ${TMPFILE}
mv ${TMPFILE} ${BASEDIR}/etc/mtree/var.dist

echo "Generating pkg_info.txt"
chroot ${BASEDIR} pkg_info > ${BASEDIR}/pkg_info.txt
