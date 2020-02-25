#! /bin/bash
echo "Starting Buildah Scratch Build"
set -x
#Intended to run on Fedora
rose=$(buildah from scratch)
rosemnt=$(buildah mount $rose)
dnf install --installroot $scratchmnt --releasever 30 python python-pip --setopt install_weak_defs=false -y
buildah run "$rose" -- echo "EMPTY"
