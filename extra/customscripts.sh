#!/bin/sh
#
# Copyright (c) 2005 Dominique Goncalves
#
# See COPYING for licence terms.
#
# $FreeBSD$
# $Id: customscripts.sh,v 1.3 2006/10/12 20:39:58 saturnero Exp $

set -e -u

if [ -z "${LOGFILE:-}" ]; then
    echo "This script can't run standalone."
    echo "Please use launch.sh to execute it."
    exit 1
fi

CUSTOMSCRIPTS=${CUSTOMSCRIPTS:-extra/customscripts}

echo "Running custom shell scripts"

cd ${CUSTOMSCRIPTS}
for script in `find . -type f -name "*.sh"` ; do
        /bin/cp ${script} ${BASEDIR}/root
        echo "Running ${script}"
        /usr/sbin/chroot ${BASEDIR} /bin/sh /root/${script}
        /bin/rm ${BASEDIR}/root/${script}
done

cd ${LOCALDIR}
