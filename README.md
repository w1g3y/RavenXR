# RavenXR

RavenXR is a continuation of the FreeSBIE project.
It's a Live CD .ISO, and provides:
 - Lightweight GUI environment
 - disk tools for cloning local devices, and across networks
 - Some data recovery tools

At present, priorities are as follows:
 - Get existing builds working on 14.2
 - Begin updating build prosess to use ZFS pools and newer disk cloning to increase build speeds
 - Incorporate new compressed filesystems for the .ISO


### Old FreeSBIE README:
FreeSBIE 2 is quite easy and familiar for an average (Free)BSD user. It is Makefile-based, and it has a default configuration file overridable by the user. The quick way to make an ISO image consists of four steps:
1. make sure you have mkisofs from the ‘cdrtools’ package (otherwise: pkg_add -rv cdrtools)
2. run `make pkgselect’ to select which packages to include in your image (optional, if you don’t want packages or if package selection is done in freesbie.conf)
3. modify conf/freesbie.conf and in some cases conf/freesbie.defaults.conf
4. run `make iso’ and go watch a movie, or spend some time with a loved one.

This will create a simple ISO image with a vanilla FreeBSD-based system plus the packages you selected, if any.
