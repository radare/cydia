Cydia.Radare.Org
================

This repository contains the package build descriptions to build the .deb files for
jailbroken iOS devices.

This was a hand crafted job since recently that I have started to add cross-compilation
built targets in the package construction, so it no longer needs to ship the root/ with
all the blobs.

To see the way to publish this repository checkout the [radare2-dockers](https://github.com/radare/radare2-dockers)
it contains the website and the scripts to reconstruct the package database for all the
`*.deb` found inside the `debs/` directory.

--pancake
